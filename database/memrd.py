memrd_m1 = \
"""
wire [1:0] f0_mrd;
wire [2:0] f1_mrd;
wire [31:0] f2_mrd;
wire [31:0] f3_mrd;
wire [31:0] f4_mrd;
wire [31:0] f5_mrd;
wire [2:0] f6_mrd;
wire [135:0] code_mrd;

f0_mrd = "00";
f1_mrd = "001";
f2_mrd = addr;
f3_mrd = bigE_word;
f4_mrd = cycle;
f5_mrd = tmp_pc;
f6_mrd = "011";
code_mrd = <f0_mrd,f1_mrd,f2_mrd,f3_mrd,f4_mrd,f5_mrd,f6_mrd>;
null = DATAOUT_FORMA_M13.write(code_mrd);
"""

memrd_m2 = \
"""
wire [1:0] f0_mrd;
wire [2:0] f1_mrd;
wire [31:0] f2_mrd;
wire [31:0] f3_mrd;
wire [31:0] f4_mrd;
wire [31:0] f5_mrd;
wire [2:0] f6_mrd;
wire [135:0] code_mrd;

f0_mrd = "00";
f1_mrd = "001";
f2_mrd = addr2;
f3_mrd = bigE_word0;
f4_mrd = cycle;
f5_mrd = tmp_pc;
f6_mrd = "100";
code_mrd = <f0_mrd,f1_mrd,f2_mrd,f3_mrd,f4_mrd,f5_mrd,f6_mrd>;
null = DATAOUT_FORMA_M24.write(code_mrd);
