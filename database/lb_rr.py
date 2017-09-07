"""
forma data and rules for pisa instruction LB_RR

subgraph = {VAR:{},STMT:{}}
template = STMT with abstract vars, 
that are later binded/allocated to resources.
same format as STMT (out,in,func).
_var is abstract var for forma default var (ASIPmeister wire)

"""

_cycle = ('_var','_cycle','na')
_reg_rd_addr0 = ('_var','rs','na')
_reg_rd_val0 = ('_var','tmp_source0','na')
_reg_rd_addr1 = ('_var','rd','na')
_reg_rd_val1 = ('_var','tmp_source1','na')
_fwd_addr0 = ('_var','rs','na')
_fwd_val0 = ('_var','source0','na')
_fwd_addr1 = ('_var','rd','na')
_fwd_val1 = ('_var','source1','na')
_mem_rd_addr = ('_var','addr','na')
_mem_rd_val = ('_var','bigE_word','na')
_reg_wr_addr = ('_var','rt','na')
_reg_wr_val = ('_var','bigE_word','na')

forma_table = {
        1:{
            },
        2:{
            'reg_rd0':[
                _reg_rd_addr0,
                _reg_rd_val0,
                ],
            'reg_rd1':[
                _reg_rd_addr1,
                _reg_rd_val1,
                ],
            'fwd0':[
                _fwd_addr0,
                _fwd_val0,
                ],
            'fwd1':[
                _fwd_addr1,
                _fwd_val1,
                ],
            },
        3:{
            'resconf_ex0':[],
            'resconf_ex1':[],
            'resconf_ex2':[],
            },
        4:{
            'mem_rd':[
                _mem_rd_addr,
                _mem_rd_val,
                ],
            'resconf_m10':[],
            'resconf_m11':[],
            'resconf_m12':[],
            },
        5:{
            'resconf_m20':[],
            'resconf_m21':[],
            'resconf_m22':[],
            'resconf_m23':[],
            },
        6:{
            'reg_wr':[
                _reg_wr_addr,
                _reg_wr_val,
                ],
            },
        }


