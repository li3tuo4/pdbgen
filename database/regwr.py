regwr_wb = \
"""
wire [31:0] cycle;
wire [26:0] zero27b;
wire [1:0] f0_rwr0;
wire [2:0] f1_rwr0;
wire [31:0] f2_rwr0;
wire [31:0] f3_rwr0;
wire [31:0] f4_rwr0;
wire [31:0] f5_rwr0;
wire [2:0] f6_rwr0;
wire [135:0] code_rwr0;

cycle = CYCLEWIRE_FORMA_WB.read();
zero27b = "000000000000000000000000000";
f0_rwr0 = "01";
f1_rwr0 = "000";
f2_rwr0 = <zero27b,rt>;
f3_rwr0 = bigE_word;
f4_rwr0 = cycle;
f5_rwr0 = tmp_pc;
f6_rwr0 = "101";
code_rwr0 = <f0_rwr0,f1_rwr0,f2_rwr0,f3_rwr0,f4_rwr0,f5_rwr0,f6_rwr0>;
null = DATAOUT_FORMA_WB0.write(code_rwr0);
"""
