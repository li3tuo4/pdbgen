#!/usr/bin/python

"""
ppd scanner. 

Input: ppd file, a metadata generated by ASIPmeister.
Output: tokens, ready for constructing DFG.
Data structure should be dictionary (python lookup/hash table).

"""
import string
import sys
import re
import json
from collections import deque

#recursion limit value bounded by num of lines in ppd
sys.setrecursionlimit(9999)

#keywords
INSTRUCTION = 'instruction'
OPERAND = 'operand'
OPECODE = 'opecode'
WIRE = 'wire'
STAGE = 'stage'
TYPE = 'type'
OPCODE = 'opcode'
VAR = 'var'
STMT = 'stmt'

#symbols
SEMICOLON = ';'
APOS = '\''
QUOT = '\"'
LPAREN = '('
RPAREN = ')'
LBRACK = '['
RBRACK = ']'
LBRACE = '{'
RBRACE = '}'
LCHEV = '<'
RCHEV = '>'
SIMP_COMMENT = '//'
COMP_COMMENT_BEGIN = '/*'
COMP_COMMENT_END = '*/'
EQUAL = '='

#scope value = 0 (default=global) or 1,2,...,n (n = pipeline stage number)
scope_val = 0

#regular expression object
INSTR_BEGIN_STR = '/* Instruction */\n'
TYPE_BEGIN_STR = '/* Instruction Type */\n'
IO_BEGIN_STR = '/* I/O Port */\n'
OPERAND_KW_REGEX = re.compile(OPERAND)
OPERAND_VAR_REGEX = re.compile('\s+(\w+)')
VAR_REGEX = re.compile('wire\s?\[(\d+):0\]\s?(\w+)')
BIN_REGEX = re.compile('[01]+')
SIMP_WORD_REGEX = re.compile('\w+')
#PART_SEL_REGEX = re.compile('\d+')
PART_SEL_REGEX = re.compile('\[(\d*:?\d+)\]')
SYMBOL_REGEX = re.compile('\W+')
SPLIT_STMT_REGEX = re.compile(EQUAL)
SIMP_COMMENT_REGEX = re.compile('//.*\n')
#must use non-greedy qualifier!
COMP_COMMENT_REGEX = re.compile('/\*.*?\*/',re.DOTALL)

#constants for parsing stmt
OUT = 'out'
IN = 'in'
FU = 'fu'
SEL = 'sel'
NA = 'na'
NUL = 'null'

#global var, db and reserved_vars are outputs
cur_instr = None
db = {}
reserved_vars=set()

def read_ppd(file_name):
    with open(file_name,'r') as f:
        ppd_lines = f.readlines()
    return ppd_lines

def init(ppd_lines):
    """initialize ppd lines
    find the instruction segment in ppd,
    remove empty lines,
    and remove comments.
    find the type segment in ppd,
    identify operands.

    """
    global reserved_vars
    type_seg_loc = ppd_lines.index(TYPE_BEGIN_STR)
    io_seg_loc = ppd_lines.index(IO_BEGIN_STR)
    instr_seg_loc = ppd_lines.index(INSTR_BEGIN_STR)
    instr_lines = ppd_lines[instr_seg_loc+1:]
    type_lines = ppd_lines[type_seg_loc+1:io_seg_loc]
    for l in type_lines:
        l = l.strip()
        if OPERAND_KW_REGEX.match(l):
            reserved_var = OPERAND_VAR_REGEX.search(l).group(1)
            reserved_vars.add(reserved_var)
    instr_txt = ''.join(instr_lines)
    instr_txt = SIMP_COMMENT_REGEX.sub('',instr_txt)
    instr_txt = COMP_COMMENT_REGEX.sub('',instr_txt)
    instr_lines = instr_txt.split('\n')
    stripped_instr_lines = []
    comment_flag = False
    for l in instr_lines:
        l = l.strip()
        if l:
            stripped_instr_lines.append(l)
    return deque(stripped_instr_lines)

def parse_var(line):
    """
    parse vars (wires)
        1. global vars & local vars --> look at scope flag?
        2. multi vars in one line --> pattern ';'
        3. assumption: at least one valid var_str exists
    """
    var_list = line.split(SEMICOLON)
    for var_str in var_list:
        if var_str:
            test = VAR_REGEX.search(var_str)
            if test: #multi-bit case
                var_name = test.group(2)
                var_width = int(test.group(1)) + 1
            else: #1-bit case
                var_name = var_str.split()[-1]
                var_width = 1
            db[cur_instr][VAR][scope_val][var_name] = var_width
    return

def parse_left(line):
    """
    <left side> ::= <variable name> | <variable name set> | 'null'

    """
    if line == NUL:
        out_vars = []
    else:
        out_vars = SIMP_WORD_REGEX.findall(line)
    return out_vars

def parse_cond_assign_expr(line):
    """
    <conditional assignment expression> ::= 
        '('<conditional variable reference>')' '?'
        <variable reference> ':' <variable reference>

    """
    in_vars = SIMP_WORD_REGEX.findall(line)
    func = NA
    funcs = [SEL,func]
    return in_vars,funcs

def parse_cond_func_expr(line):
    """
    <conditional function execution expression> ::= 
        '['<conditional variable reference>']' <resource reference>

    <resource reference> ::= <resource name> '.' <function name>
    '('[<parameter line>]')'

    Use compound function representation, a list [SEL,func] to differ from 
    unconditional function execution expression.

    """
    finding = SIMP_WORD_REGEX.findall(line)
    in_vars = [finding[0]] + finding[3:]
    #in_vars = [finding[0]].extend(finding[3:])
    func = '{0}.{1}'.format(finding[1],finding[2])
    funcs = [SEL,func]
    return in_vars,funcs

def parse_part_sel_expr(line):
    """
    <part selection expression> ::= <variable reference> <part selector>

    <part selector> ::= '['<index>'[':'<index>]']'

    """
    var_search = SIMP_WORD_REGEX.search(line)
    in_vars = [var_search.group()]
    """ old code
    index_strs = PART_SEL_REGEX.findall(line) #one or two index field
    if len(index_strs) == 2:
        func = '{0}:{1}'.format(index_strs[0],index_strs[1])
    else:
        func = index_strs[0]
    """
    func_search = PART_SEL_REGEX.search(line)
    func = func_search.group(1)
    funcs = [func]
    return in_vars,funcs

def parse_func_expr(line):
    """
    <resource reference> ::= <resource name> '.' 
    <function name> '('[<parameter line>]')'

    """
    finding = SIMP_WORD_REGEX.findall(line)
    in_vars = finding[2:]
    func = '{0}.{1}'.format(finding[0],finding[1])
    funcs = [func]
    return in_vars,funcs

def parse_set_expr(line):
    """
    <> ::= '<' <variable reference> [',' <variable reference>] '>'

    """
    in_vars = SIMP_WORD_REGEX.findall(line)
    func = NA
    funcs = [func]
    return in_vars,funcs

def parse_bin_const_expr(line):
    """
    <binary constant> ::= <bit literal> | <vector literal>

    """
    in_vars = BIN_REGEX.findall(line)
    func = NA
    funcs = [func]
    return in_vars,funcs

def parse_bit_comp_var_exprs(line):
    """
    <bit AND operation expression> ::= <variable reference> '&' 
    <variable reference>

    <bit OR operation expression> ::= <variable reference> '|' 
    <variable reference>

    <bit invert operation expression> ::= '~' <variable reference>

    <variable reference> := <variable name>

    <comparison expression> ::= <variable reference> <relational operator> 
    <binary constant>

    <relational operator> ::= '==' | '!='

    """
    in_vars = SIMP_WORD_REGEX.findall(line)
    symbols = SYMBOL_REGEX.findall(line)
    if symbols:
        func = symbols[0]
    else:
        func = NA
    funcs = [func]
    return in_vars,funcs

def parse_right(line):
    """
    A bit different to BNF of ASIPmeister:
    <right side> ::= <simple right side> | <conditional right side>

    <simple right side> ::= <bit AND expression> | <bit OR expression> |
        <bit invert expression> | <comparison expression> |
        <set> | <resource reference> | <part selection expression> |
        <binary constant> | <variable reference>

    <conditional right side> ::= <conditional assignment expression> | 
        <conditional function execution expression>

    """
    if line.startswith(LBRACK):
        return parse_cond_func_expr(line)
    elif line.startswith(LPAREN):
        return parse_cond_assign_expr(line)
    elif line.endswith(RBRACK):
        return parse_part_sel_expr(line)
    elif line.endswith(RPAREN):
        return parse_func_expr(line)
    elif line.endswith(RCHEV):
        return parse_set_expr(line)
    elif EQUAL in line:
        return parse_bit_comp_var_exprs(line)
    elif line.endswith(APOS) or line.endswith(QUOT):
        return parse_bin_const_expr(line)
    else:
        return parse_bit_comp_var_exprs(line)

def parse_stmt(line):
    """
    a function parsing statement, hardest part at front end
        <statement> ::= <simple assignment statement> | 
            <conditional assignment statement> | 
            <conditional function execution statement>
        1. multi-statement in one line
        2. output data structure: stmt = scope_val,{O:,I:,F:}
            a. order of src in set I (in): 
                case F (op) = SEL, sel signal > input signal
                case F = {+,-,x,/}, use operation's (natural) order
                case F = res, refer to resource def (res's order)
            b. F can be "part selection": how to represent?
                TODO: let's say (msb,lsb) tuple for now
        3. multi-dst in one statement: left side has '<>'
            use O (out) set (sink0,sink1,...) to represent
        4. conditional expressions: parse_cond_*_expr()
            use F (func) set (SEL,function/resource) to represent

    """
    global db
    stmt_list = line.split(SEMICOLON)[:-1]
    for stmt_str in stmt_list:
        left_str,right_str = SPLIT_STMT_REGEX.split(stmt_str,1)
        out_vars = parse_left(left_str.strip())
        in_vars,funcs = parse_right(right_str.strip())
        #creat a dict representing this statement
        stmt_db = {OUT:out_vars,IN:in_vars,FU:funcs}
        db[cur_instr][STMT][scope_val].append(stmt_db)
    return

def parse_opcode(tokens):
    global db
    result = BIN_REGEX.search(tokens[-1])
    if not result:#assertion: error: not find opcode
        sys.exit(1)
    db[cur_instr][OPCODE] = result.group()
    return

def parse_instr(instr_lines):
    """ recursive function parsing instruction spec segment

    """
    global cur_instr
    global scope_val
    global db
    input_line = instr_lines.popleft()
    tokens = input_line.split()
    token0 = tokens[0]
    if token0 == INSTRUCTION: #condition creating new instruction object
        scope_val = 0
        cur_instr = tokens[1]
        instr_type = tokens[-1]
        db[cur_instr] = {TYPE:instr_type,VAR:{},STMT:{}}
        db[cur_instr][VAR][scope_val] = {}
    elif token0 == OPECODE:
        parse_opcode(tokens)
    elif token0[:4] == WIRE: 
        #because of no real lexer,possible cases:wire[x:y] & wire [x:y]
        parse_var(input_line)
    elif token0 == STAGE:
        scope_val = int(tokens[1])
        db[cur_instr][VAR][scope_val] = {}
        if scope_val > 0:
            #init an item in dict for statements in one stage
            db[cur_instr][STMT][scope_val] = []
    elif token0[0] in [LBRACE,RBRACE]:
        pass #ignore braces
    else: #stmt
        parse_stmt(input_line)
    if not instr_lines:
        return #terminate recursion
    else:
        return parse_instr(instr_lines)

def parse(instr_lines):
    #recursively parse instruction
    parse_instr(instr_lines)
    return

def dump_db(fn):
    with open(fn,'w') as fp:
        json.dump(db,fp)
    return

def load_db(fn):
    with open(fn,'ru') as fp:
        return json.load(fp)

def main():
    test_file = 'meister/pisa-forma-v0.ppd'
    fn = 'parsed_ppd.json'
    raw_mod = init(read_ppd(test_file))
    parse(raw_mod)
    #dump_db(fn)
    """
    for k in db.keys():
        print k,'global'
        print 'variables:'
        for elem in db[k][VAR]['0'].items():
            print elem
        for i in range(1,7):
            print k,i
            print 'variables:'
            for elem in db[k][VAR][str(i)].items():
                print elem
            print 'statements:'
            for elem in db[k][STMT][str(i)]:
                print elem
    """
    return

def test():
    line = 'cond = zero ==\'1\';'
    lines = deque([line])
    print parse(lines)
    return

if __name__ == '__main__':
    main()
