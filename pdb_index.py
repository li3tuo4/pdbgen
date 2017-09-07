#!/usr/bin/python

"""
Read pdb file and index the important (sub)segments.

"""

import re

import sys

#some constants here
#top level code segments' string pattern (aka divders and assumed to be unique)
#to make the regex more robust, I added RBRA, 
#in case those keywords (segment title) exist in MOD part (possible).
VER = 'Version'
LBRA = '{'
RBRA = '}'
VER_RE = re.compile(VER+LBRA)
FILETYPE = 'FileType'
FILETYPE_RE = re.compile(FILETYPE+LBRA) 
DATABASE = 'Database'
DATABASE_RE = re.compile(DATABASE+LBRA)  
PREF = 'Preference'
PREF_RE = re.compile(PREF+LBRA)
ABS_LVL_ARCH = 'AbsLevelArch'
ABS_LVL_ARCH_RE = re.compile(ABS_LVL_ARCH+LBRA)  
ENT_DECL = 'EntityDecl'
ENT_DECL_RE = re.compile(ENT_DECL+LBRA)  
RES_DECL = 'ResourceDecl'
RES_DECL_RE = re.compile(RES_DECL+LBRA) 
STO_SPEC = 'StorageSpec'
STO_SPEC_RE = re.compile(STO_SPEC+LBRA)  
INSTR_DECL = 'InstructionDecl'
INSTR_DECL_RE = re.compile(INSTR_DECL+LBRA)  
OP_DESC = 'OperationDesc'
OP_DESC_RE = re.compile(OP_DESC+LBRA)  
C_DEF_DECL = 'CdefinitionDecl'
C_DEF_DECL_RE = re.compile(C_DEF_DECL+LBRA)  
MOD = 'MOD'
MOD_RE = re.compile(MOD+LBRA)
EST = 'Estimation'
EST_RE = re.compile(EST+LBRA)
GEN = 'Generation'
GEN_RE = re.compile(GEN+LBRA)
SW_GEN = 'SW_Generation'
SW_GEN_RE = re.compile(SW_GEN+LBRA)
ASM_GEN = 'ASM_Generation'
ASM_GEN_RE = re.compile(ASM_GEN+LBRA)
TOP_DIVS = (VER,FILETYPE,DATABASE,PREF,ABS_LVL_ARCH,ENT_DECL,
        RES_DECL,STO_SPEC,INSTR_DECL,OP_DESC,C_DEF_DECL,MOD,
        EST,GEN,SW_GEN,ASM_GEN)


def read_pdb(file_name):
    with open(file_name,'r') as f:
        #pdb_lines = f.readlines()
        pdb_txt = f.read()
    return pdb_txt

def index_mod_instr(txt):
    """
    conceptual mapping:
        [index] --> [subsegment]
        id      --> id
        _code   --> variable,1,2,3,...

    a faked index name "" (empty string) is used for the last three subsegments.
    this is compatible to pdb_gen.mod_gen(), which generates the three
    subsegments together.
    also refer back to index_mod().

    """
    index = {}
    instr_re = re.compile('(\w+)\s+#1{')
    id_str = 'id'
    _code = ''
    id_re_str = 'id{\s+(\d+)\s+}'
    id_re = re.compile(id_re_str)
    segs = instr_re.split(txt)
    dontcare = segs.pop(0)
    for i in range(0,len(segs),2):
        instr_name = segs[i]
        instr_cseg = segs[i+1].rstrip()[:-1]
        dontcare,id_seg,code_seg = id_re.split(instr_cseg)
        index[instr_name] = {id_str:(0,id_seg),_code:(1,code_seg)} 
    return index

def index_mod(txt):
    """
    indexing MOD code segment in pdb file:
    This function must be compatible with pdb_gen.mod_gen().
    Index structure (refer to auto_tips.txt):
        mod --> Complete
            --> Common
            --> Instruction --> [instr name]    --> id
                                                --> [code]
                            --> XX
            --> Exception   --> [reset name]    --> [code]
            --> Macro
    +Wed Jul 23 00:22:07 EST 2014
    So far, only the instruction subsegment must be indexed.
    Other subsegments do not necessarily require index,
    as no modification/edition is needed.

    """
    index={}
    complete = 'Complete'
    complete_re = re.compile(complete+LBRA)
    common = 'Common'
    common_re = re.compile(common+LBRA)
    instruction = 'Instruction'
    instruction_re = re.compile(instruction+LBRA)
    exception = 'Exception'
    exception_re = re.compile(exception+LBRA)
    macro = 'Macro'
    macro_re = re.compile(macro+LBRA)
    dontcare,leftover = complete_re.split(txt,1)
    cseg,leftover = common_re.split(leftover,1)
    index[complete] = (0,cseg.rstrip()[:-1])
    cseg,leftover = instruction_re.split(leftover,1)
    index[common] = (1,cseg.rstrip()[:-1])
    cseg,leftover = exception_re.split(leftover,1)
    cseg = cseg.rstrip()[:-1]
    index[instruction] = (2,index_mod_instr(cseg))
    cseg,leftover = macro_re.split(leftover,1)
    index[exception] = (3,cseg.rstrip()[:-1])
    index[macro] = (4,leftover.rstrip()[:-1])
    return index

def index_instr_decl_instr(txt):
    """
    Index instruction subsegment in instruction declaration segment
    
    +Thu Jul 24 11:03:07 EST 2014
    At the moment, just index at instruction level, leave lower levels. 
    Reuse the code of index_mod_instr().

    """
    index = {}
    instr_re = re.compile('(\w+)\s+#1{')
    segs = instr_re.split(txt)
    dontcare = segs.pop(0)
    for i in range(0,len(segs),2):
        instr_name = segs[i]
        instr_cseg = segs[i+1].rstrip()[:-1]
        index[instr_name] = instr_cseg 
    return index

def index_instr_decl(txt):
    """
    indexing instruction declaration segment
    +Wed Jul 23 14:16:31 EST 2014
    Now only the top level subsegments are indexed, 
    except for instruction subsegment.

    """
    index = {}
    complete = 'Complete'
    maxinstid = 'MaxInstId'
    instructiontype = 'InstructionType'
    instruction = 'Instruction'
    complete_re = re.compile(complete+LBRA)
    maxinstid_re= re.compile(maxinstid+LBRA)
    instructiontype_re = re.compile(instructiontype+LBRA)
    instruction_re = re.compile(instruction+LBRA)
    dontcare,leftover = complete_re.split(txt,1)
    cseg,leftover = maxinstid_re.split(leftover,1)
    index[complete] = (0,cseg.rstrip()[:-1])
    cseg,leftover = instructiontype_re.split(leftover,1)
    index[maxinstid] = (1,cseg.rstrip()[:-1])
    cseg,leftover = instruction_re.split(leftover,1)
    index[instructiontype] = (2,cseg.rstrip()[:-1])
    leftover = leftover.rstrip()[:-1]
    index[instruction] = (3,index_instr_decl_instr(leftover))
    return index

def index_resource_instance(txt):
    """
    indexing instance subsegment in resource declaration segment
    The order of instances does not matter.
    It's harder than instruction. Cannot directly reuse the code.
    Probably need parsing mod or ppd file. No, ppd and mod file only
    have valid instances.
    +Thu Jul 24 11:53:46 EST 2014
    Now only the top level subsegments are indexed.

    """
    instance_tmpl_re = re.compile('(\w+){\s+valid{')
    #pass1: get instance names
    instance_names = instance_tmpl_re.findall(txt)
    #pass2: finish indexing
    comb_names_re = re.compile('|'.join([i+LBRA for i in instance_names]))
    csegs = comb_names_re.split(txt)
    csegs = [cseg.rstrip()[:-1] for cseg in csegs]
    dontcare = csegs.pop(0)
    index = dict(zip(instance_names,csegs))
    return index

def index_resource(txt):
    index = {}
    complete = 'Complete'
    instance = 'Instance'
    complete_re = re.compile(complete+LBRA)
    instance_re = re.compile(instance+LBRA)
    dontcare,leftover = complete_re.split(txt,1)
    complete_cseg,instance_cseg = instance_re.split(leftover,1)
    complete_cseg = complete_cseg.rstrip()[:-1]
    instance_cseg = instance_cseg.rstrip()[:-1]
    index[complete] = (0,complete_cseg)
    index[instance] = (1,index_resource_instance(instance_cseg))
    return index

def index_top(txt):
    index = {}
    #TODO maybe using loop for the code below.
    dontcare,leftover = VER_RE.split(txt,1)   
    ver_cseg,leftover = FILETYPE_RE.split(leftover,1)
    index[VER] = (0,ver_cseg.rstrip()[:-1])
    filetype_cseg,leftover = DATABASE_RE.split(leftover,1)
    index[FILETYPE] = (1,filetype_cseg.rstrip()[:-1])
    database_cseg,leftover = PREF_RE.split(leftover,1)
    index[DATABASE] = (2,database_cseg.rstrip()[:-1])
    pref_cseg,leftover = ABS_LVL_ARCH_RE.split(leftover,1)
    index[PREF] = (3,pref_cseg.rstrip()[:-1])
    arch_cseg,leftover = ENT_DECL_RE.split(leftover,1)
    index[ABS_LVL_ARCH] = (4,arch_cseg.rstrip()[:-1])
    entity_cseg,leftover = RES_DECL_RE.split(leftover,1)
    index[ENT_DECL] = (5,entity_cseg.rstrip()[:-1])
    resource_cseg,leftover = STO_SPEC_RE.split(leftover,1)
    resource_cseg = resource_cseg.rstrip()[:-1]
    index[RES_DECL] = (6,index_resource(resource_cseg))
    storage_cseg,leftover = INSTR_DECL_RE.split(leftover,1)
    index[STO_SPEC] = (7,storage_cseg.rstrip()[:-1])
    instr_cseg,leftover = OP_DESC_RE.split(leftover,1)
    instr_cseg = instr_cseg.rstrip()[:-1]
    index[INSTR_DECL] = (8,index_instr_decl(instr_cseg))
    op_desc_cseg,leftover = C_DEF_DECL_RE.split(leftover,1)
    index[OP_DESC] = (9,op_desc_cseg.rstrip()[:-1])
    c_def_cseg,leftover = MOD_RE.split(leftover,1)
    index[C_DEF_DECL] = (10,c_def_cseg.rstrip()[:-1])
    mod_cseg,leftover = EST_RE.split(leftover,1)
    mod_cseg = mod_cseg.rstrip()[:-1]
    index[MOD] = (11,index_mod(mod_cseg))
    est_cseg,leftover = GEN_RE.split(leftover,1)
    index[EST] = (12,est_cseg.rstrip()[:-1])
    gen_cseg,leftover = SW_GEN_RE.split(leftover,1)
    index[GEN] = (13,gen_cseg.rstrip()[:-1])
    sw_gen_cseg,asm_gen_cseg = ASM_GEN_RE.split(leftover,1)
    index[SW_GEN] = (14,sw_gen_cseg.rstrip()[:-1])
    index[ASM_GEN] = (15,asm_gen_cseg.rstrip()[:-1])
    return index

def main():
    pdb_file_name = 'pisa-forma-v0.pdb'
    pdb_txt = read_pdb(pdb_file_name)
    index = index_top(pdb_txt)
    """
    #check mod
    mod_index = top_index[MOD][1]
    instr_index = mod_index['Instruction'][1]
    #check instr decl
    instr_decl_index = top_index[INSTR_DECL][1]
    instr_decl_instr_index = instr_decl_index['Instruction'][1]
    #check resource decl
    resource_index = top_index[RES_DECL][1]
    instance_index = resource_index['Instance'][1]
    """
    """
    for k in instr_index:
        print '-------------------------------'
        print k
        print instr_index[k]['id'][1]
        print instr_index[k]['_code'][1]
    """
    """
    for k in instr_decl_index:
        print '-------------------------------'
        print k,instr_decl_index[k][1]
    """
    """
    for k in instr_decl_instr_index:
        print '-------------------------------'
        print k,instr_decl_instr_index[k]
    """
    """
    for k in resource_index:
        print '-------------------------------'
        print k,resource_index[k][1]
    """
    """
    for k in instance_index:
        print '-------------------------------'
        print k,instance_index[k]
    """
    return index

if __name__ == '__main__':
    main()
