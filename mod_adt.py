"""
Fri Jul 25 14:41:16 EST 2014
Package mod_adt, abstract data type, has data and methods for 
editing/generating mod segment in indexed pdb file.
TODO: transform to Object Oriented (class).

"""

mod_index = {}
mod_code = ''
INSTR_KEY = 'Instruction'
instr_index = mod_index[INSTR_KEY][1]
ID_KEY = 'id'
CODE_KEY = ''

import cseg_aggr

def initialize(ini_index):
    global mod_index
    global mod_code
    mod_index = ini_index
    mod_code = ''
    return

def add_instr(name,ident,code):
    global mod_index
    instr_index.update(name={ID_KEY:(0,ident),CODE_KEY:(1,code)})
    return

def mod_instr(name,code):
    """
    suppose only modifying code

    """
    global mod_index
    instr_index[name][CODE_KEY] = (1,code)
    return

def del_instr(name):
    global mod_index
    del instr_index[name]
    return

def create_cseg():
    global mod_code
    #instr_cseg
    for i in instr_index:
        i_cseg = '{0}  #1{{\nid{{\n{1[ID_KEY][1]}\n}}\n{1[CODE_KEY][1]}}}\n'.format(i,
                instr_index[i])
    return
