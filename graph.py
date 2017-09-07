#!/usr/bin/python

"""
Dataflow graph or datapath fusion
    Given an instr or a set of instrs, 
    base_graph = get_BG(instr)
    ext_graph = get_EG(instr)
    fused_graph = fuse(base_graph,ext_graph)

Tuo Li (li3tuo4@gmail.com)

"""

import sys
import database.lb
import ppd_scan

""" global vars declared here """

table_map = dict(LB=database.lb.forma_table)

def get_BG(instr):
    var_db = ppd_scan.db[instr]['var']
    stmt_db = ppd_scan.db[instr]['stmt']
    #remove implicit stmts and vars
    implicit_vars = ['rs','rt','rd','shamt','imm','targ','tmp_ir']
    for k in stmt_db:
        stmts = stmt_db[k][:]
        for s in stmts:
            out_vars = s['out']
            for v in out_vars:
                if v in implicit_vars:
                    stmt_db[k].remove(s)
    for k in var_db:
        var_wires = var_db[k]
        for vw in var_wires.keys():
            if vw in implicit_vars:
                del var_wires[vw]
    return var_db,stmt_db

def get_EG(instr):
    table = table_map[instr] #database.lb.forma_table
    graph = dict()
    for stage in table:
        graph[stage] = list()
        tmpl_stmts = table[stage]
        for event_name in tmpl_stmts:
            if 'resconf' in event_name:
                for tmpl in tmpl_stmts[event_name]:
                    stmt = {'out':tmpl[0],'in':tmpl[1],'func':tmpl[2]}
                    graph[stage].append(stmt)
    return graph

def fuse():
    return

def main():
    ppd_scan.main()
    instr = 'LB'
    base_graph = get_BG(instr)
    #ext_graph = get_EG(instr)
    #fused_graph = fuse(base_graph,ext_graph)
    print base_graph[0]
    return

if __name__ == '__main__':
    main()
