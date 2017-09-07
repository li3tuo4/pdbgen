#!/usr/bin/python

"""
code generation for pdb file
input:  indexed content from original pdb file.
input:  graph, assumed to be already scheduled and allocated.
output: edited pdb file.

1) transform graph (sorta IR) to pdb code.
2) insert pdb code to file.

a graph = [variables, statements]
variable = {name:property}
statement = {O,I,F}

a pdb code = (decl_code_seg,io_code_seg,MOD_code_seg,...)

"""

import ppd_scan
import pdb_index
from ppd_scan import OUT
from ppd_scan import IN
from ppd_scan import FU
from ppd_scan import OUT
from ppd_scan import SEL
from ppd_scan import NUL
from ppd_scan import NA

import sys

def decl_gen():
    pass
    return

def io_gen():
    pass
    return

def wire_decl_gen(g_var):
    """
    g_var = {stage_num:{wire_name:bit_range_spec}}

    wire_decl_tab = {stage_num:[wire_decl]}

    """
    wire_decl_tab = {}
    for stage_num in g_var:
        sub_g_var = g_var[stage_num]
        wire_decl_tab[stage_num] = []
        for wire_name in sub_g_var:
            bit_range_spec = sub_g_var[wire_name]
            if bit_range_spec == 1:
                bit_range_spec_str = ''
            else:
                bit_range_spec_str = '[{0}:0]'.format(bit_range_spec-1)
            wire_decl = 'wire {1} {0};'.format(wire_name,bit_range_spec_str)
            wire_decl_tab[stage_num].append(wire_decl)
    return wire_decl_tab

def left_gen(out_vars):
    if not out_vars:#no var case (null)
        left_part = NUL
    elif len(out_vars) == 1:#single var case (variable name)
        left_part = out_vars[0]
    else: #multi-var case (variable name set)
        comb_var_str = ','.join(out_vars)
        left_part = '<{0}>'.format(comb_var_str)
    return left_part

def simp_right_gen(in_vars):
    """
    <identifier> ::= <English letter> {<alphanumeric character>|'_'}

    <binary constant> ::= <bit literal> | <vector literal>

    <binary character> ::= '0'|'1'

    """
    if len(in_vars) == 1:
        in_var = in_vars[0]
        if in_var.startswith('0') or in_var.startswith('1'):
            if len(in_var) == 1: #<bit literal>
                right_part = '\'{0}\''.format(in_var)
            else: #<vector literal>
                #right_part = '\\\"{0}\\\"'.format(in_var)
                right_part = '\"{0}\"'.format(in_var)
        else: #variable reference
            right_part = in_var
    else: #set expression
        var_ref_str = ','.join(in_vars)
        right_part = '<{0}>'.format(var_ref_str)
    return right_part

def right_gen(in_vars,funcs):
    """
    use funcs to figure out how to generate right part
    
    bi-func case: <conditonal right side>
        SEL + x, x = ?
            resource.function case: <conditional function execution expression>
            NA case: <conditional assignment expression>
    uni-func case: <simple right side>
        func = ?
            NA case: <simple assignment>
                <varaible reference> unary
                <set expression> n-ary (n>=2)
                <binary constant expression> unary
            num:num case: <part selection expression> unary
            resource.function case: <resource reference> n-ary (n=0,1,2,...)
            {AND,OR,invert} case: <bit * operation expression> binary/unary
            {==,!=} case: <comparison expression> binary

    """
    if len(funcs) == 1:
        func = funcs[0]
        if func == NA:
            right_part = simp_right_gen(in_vars)
        elif ':' in func or func.isdigit(): #part selection expression
            right_part = '{0}[{1}]'.format(in_vars[0],func)
        elif '.' in func:
            arg_str = ','.join(in_vars)
            right_part = '{0}({1})'.format(func,arg_str)
        elif len(in_vars) == 1:
            right_part = '{0}{1}'.format(func,in_vars[0])
        else:
            right_part = '{0}{1}{2}'.format(in_vars[0],func,in_vars[1])
    elif funcs[-1] == NA: #ternary operator
        right_part = '{0}?{1}:{2}'.format(in_vars[0],in_vars[1],in_vars[2])
    else: #n-ary opeartor
        cond_str = in_vars[0]
        arg_str = ','.join(in_vars[1:])
        right_part = '[{0}]{1}({2})'.format(cond_str,funcs[-1],arg_str)
    return right_part

def statement_gen(g_stmt):
    """
    g_stmt = {stage_num:[stmt_spec]}
    stmt_spec = {O,I,F}

    statement_tab = {stage_num:[statement]}

    The main task is to translate stmt_spec to statement.
    Here I assume ppd_scanner is imported, so I can use the constants.
    Otherwise, I assume some constants are reclaimed here.

    left part := the part before the first "=" in a statement.
    right part := the part after the first "=" in a statement,
    the right part is also the expression part of a statement.

    """
    statement_tab = {}
    for stage_num in g_stmt:
        stmt_spec_list = g_stmt[stage_num]
        statement_tab[stage_num] = []
        for stmt_spec in stmt_spec_list:
            out_vars = stmt_spec[OUT]
            left_part = left_gen(out_vars)
            in_vars = stmt_spec[IN]
            funcs = stmt_spec[FU]
            right_part = right_gen(in_vars,funcs)
            statement = '{0} = {1};'.format(left_part,right_part)
            statement_tab[stage_num].append(statement)
    return statement_tab

def mod_instr_code_gen(graph):
    """
    MOD instruction code segment generation
    graph is regarding an instruction.
    subgraph maps to each pipeline stage.
    in each stage, var maps to wire, stmt maps to operation.
    starting from global wires.

    """
    g_var,g_stmt = graph
    max_stage_num = len(g_stmt)
    wire_decl_tab = wire_decl_gen(g_var)
    statement_tab = statement_gen(g_stmt)
    stage_str_list = []
    for stage_num in range(0,max_stage_num+1):
        wire_decl_list = wire_decl_tab[stage_num] #always making wire code
        wire_main_code = '\n'.join(wire_decl_list)
        if stage_num == 0: #initial state: global wire
            stage_str = 'variable{{\n{0}\n}}'.format(wire_main_code)
            stage_str_list.append(stage_str)
        else: #normal and terminating state
            statement_list = statement_tab[stage_num]
            stmt_main_code = '\n'.join(statement_list)
            stage_str = '{0}{{\n{1}\n\n{2}\n}}'.format(stage_num,
                    wire_main_code,stmt_main_code)
            stage_str_list.append(stage_str)
    code = '\n'.join(stage_str_list)
    return code

def mod_gen(index,):
    """
    1. do mod_instr_code_gen() for each new or updated instruction.
    2. for new instructions do mod_id_gen() to assign new id values.
    3. wrap mod segment together and fill it in index.

    """
    return

def get_BG(graph):
    #graph = ppd_scan.db[instr]['var'],ppd_scan.db[instr]['stmt']
    #remove implicit stmts and vars
    implicit_vars = ['rs','rt','rd','shamt','imm','targ','tmp_ir']
    for k in graph[1]:
        stmts = graph[1][k][:]
        for s in stmts:
            out_vars = s['out']
            for v in out_vars:
                if v in implicit_vars:
                    graph[1][k].remove(s)
    for k in graph[0]:
        var_wires = graph[0][k]
        for vw in var_wires.keys():
            if vw in implicit_vars:
                del var_wires[vw]
    return graph

def test():
    in_vars = ['cond','zero','1']
    funcs = ['sel','na']
    print right_gen(in_vars,funcs)
    return

def main():
    ppd_scan.main()
    indexed_pdb = pdb_index.main()
    instr = sys.argv[1]
    graph = ppd_scan.db[instr]['var'],ppd_scan.db[instr]['stmt']
    graph = get_BG(graph)
    instr_mod_code = mod_instr_code_gen(graph)
    print instr_mod_code
    return

if __name__ == '__main__':
    #test()
    main()
