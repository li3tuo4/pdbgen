"""
forma data and rules for pisa instruction LB

subgraph = {VAR:{},STMT:{}}
template = STMT with abstract vars, 
that are later binded/allocated to resources.
same format as STMT (out,in,func).
_var is abstract var for forma default var (ASIPmeister wire)

"""

max_id = 182
this_id = max_id + 1
base_op = '20' #hex
forma_op = '50' #hex
this_op = forma_op + base_op

_cycle = (['cycle'],[],['_counter'])

_reg_rd_addr = ('_var','rs','na')
_reg_rd_val = ('_var','tmp_source0','na')
_fwd_addr = ('_var','rs','na')
_fwd_val = ('_var','source0','na')
_mem_rd_addr = ('_var','addr','na')
_mem_rd_val = ('_var','bigE_word','na')
_reg_wr_addr = ('_var','rt','na')
_reg_wr_val = ('_var','bigE_word','na')

_cycle_ex = (['cycle'],[],['CYCLEWIRE_FORMA_EX.read'])
_ctrlwire_ex0_in = (['ctrlwire_ex0'],[],['CTRLWIRE_FORMA_EX0.read'])
_cond_ex0 = (['cond_ex0'],['ctrlwire_ex0','1'],'==')
_code0_ex0 = (['f0_ex0'],['10'],['na'])
_code1_ex0 = (['f1_ex0'],['100'],['na'])
_code2_ex0 = (['f2_ex0'],['0'],['na'])#32b
_code3_ex0 = (['f3_ex0'],['0'],['na'])#32b
_code4_ex0 = (['f4_ex0'],['cycle'],['na'])#32b
_code5_ex0 = (['f5_ex0'],['tmp_pc'],['na'])#32b
_code6_ex0 = (['f6_ex0'],['010'],['na'])
_encode_ex0 = (['code_ex0'],
        ['f0_ex0','f1_ex0','f2_ex0','f3_ex0',
            'f4_ex0','f5_ex0','f6_ex0'],['na'])
_dataout_ex0 = ([],['cond_ex0','code_ex0'],['SEL','DATAOUT_FORMA.write'])

template = \
"""
2{
wire [31:0] tmp_source0;
wire [1:0] f0_regrd;
wire [2:0] f0_regrd;

cycle = CYCLEWIRE_FORMA_ID.read();//take care of conflicts in one stage
tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);

f0_rrd0 = "00";
f1_rrd0 = "000";
f2_rrd0 = rs;
f3_rrd0 = tmp_source0;
f4_rrd0 = cycle;
f5_rrd0 = tmp_pc;
f6_rrd0 = "001";
code_regrd = <f0_regrd,f1_regrd,f2_regrd,f3_regrd,f4_regrd,f5_regrd,f6_regrd>;
null = DATAOUT_FORMA_ID0.write(code_regrd);//take care of conflicts,across instrs

f0_fwd0 = "00";
f1_fwd0 = "011";
f2_fwd0 = rs;
f3_fwd0 = source0;
f4_fwd0 = cycle;
f5_fwd0 = tmp_pc;
f6_fwd0 = "001";
code_regrd = <f0_fwd0,f1_fwd0,f2_fwd0,f3_fwd0,f4_fwd0,f5_fwd0,f6_fwd0>;
null = DATAOUT_FORMA_ID1.write(code_fwd);
}
3{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);

cycle = CYCLEWIRE_FORMA_EX.read()
ctrlwire_ex0 = CTRLWIRE_FORMA_EX0.read();
cond_ex0 = ctrlwire_ex0 == '1';
f0_ex0 = "10";
f1_ex0 = "100";
f2_ex0 = "00000000000000000000000000000000";
f3_ex0 = "00000000000000000000000000000000";
f4_ex0 = cycle;
f5_ex0 = tmp_pc;
f6_ex0 = "010";
code_ex0 = <f0_ex0,f1_ex0,f2_ex0,f3_ex0,f4_ex0,f5_ex0,f6_ex0>;
null = [cond_ex0]DATAOUT_FORMA_EX0.write(code_ex0);

ctrlwire_ex1 = CTRLWIRE_FORMA_EX.read();
cond_ex1 = ctrlwire_ex1 == '1';
f0_ex1 = "10";
f1_ex1 = "100";
f2_ex1 = "00000000000000000000000000000000";
f3_ex1 = "00000000000000000000000000000000";
f4_ex1 = cycle;
f5_ex1 = tmp_pc;
f6_ex1 = "010";
code_ex0 = <f0_ex1,f1_ex1,f2_ex1,f3_ex1,f4_ex1,f5_ex1,f6_ex1>;
null = [cond_ex1]DATAOUT_FORMA_EX1.write(code_ex1);
}
4{
wire [7:0] byte3;
wire [7:0] byte2;
wire [7:0] byte1;
wire [7:0] byte0;
wire [31:0] result;
wire  addr_err;

<result,addr_err> = Dmem.ld_8(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3,byte2,byte1,byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);

cycle = CYCLEWIRE_FORMA_M1.read()
f0_mrd = "00";
f1_mrd = "001";
f2_mrd = addr;
f3_mrd = bigE_word;
f4_mrd = cycle;
f5_mrd = tmp_pc;
f6_mrd = "011";
code_mrd = <f0_mrd,f1_mrd,f2_mrd,f3_mrd,f4_mrd,f5_mrd,f6_mrd>;
null = DATAOUT_FORMA_M10.write(code_mrd);
}
5{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
}
6{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);

cycle = CYCLEWIRE_FORMA_WB.read()
f0_rwr = "01";
f1_rwr = "000";
f2_rwr = rt;
f3_rwr = bigE_word;
f4_rwr = cycle;
f5_rwr = tmp_pc;
f6_rwr = "101";
code_rwr = <f0_rwr,f1_rwr,f2_rwr,f3_rwr,f4_rwr,f5_rwr,f6_rwr>;
null = DATAOUT_FORMA_M20.write(code_rwr);
}
"""

"""
            2:
            'reg_rd':[
                _reg_rd_addr,
                _reg_rd_val,
                ],
            'fwd':[
                _fwd_addr,
                _fwd_val,
                ],
            4:
            'mem_rd':[
                _mem_rd_addr,
                _mem_rd_val,
                ],
            'resconf_m10':[],
            'resconf_m11':[],
            'resconf_m12':[],
            5:
            'resconf_m20':[],
            'resconf_m21':[],
            'resconf_m22':[],
            'resconf_m23':[],
            6:
            'reg_wr':[
                _reg_wr_addr,
                _reg_wr_val,
                ],
"""
forma_table = {
        1:{},
        2:{},
        3:{
            'resconf_ex0':[
                _cycle_ex,
                _ctrlwire_ex0_in,
                _code0_ex0,
                _code1_ex0,
                _code2_ex0,
                _code3_ex0,
                _code4_ex0,
                _code5_ex0,
                _code6_ex0,
                _encode_ex0,
                _dataout_ex0]
            #'resconf_ex1':[],
            #'resconf_ex2':[],
            },
        4:{},
        5:{},
        6:{}}


