regrd_id = 
"""
wire [31:0] cycle;
wire [26:0] zero27b;
wire [1:0] f0_rrd0;
wire [2:0] f1_rrd0;
wire [31:0] f2_rrd0;
wire [31:0] f3_rrd0;
wire [31:0] f4_rrd0;
wire [31:0] f5_rrd0;
wire [2:0] f6_rrd0;
wire [135:0] code_rrd0;
wire [1:0] f0_fwd0;
wire [2:0] f1_fwd0;
wire [31:0] f2_fwd0;
wire [31:0] f3_fwd0;
wire [31:0] f4_fwd0;
wire [31:0] f5_fwd0;
wire [2:0] f6_fwd0;
wire [135:0] code_fwd0;

cycle = CYCLEWIRE_FORMA_ID.read();
zero27b = "000000000000000000000000000";
f0_rrd0 = "00";
f1_rrd0 = "000";
f2_rrd0 = <zero27b,rs>;
f3_rrd0 = tmp_source0;
f4_rrd0 = cycle;
f5_rrd0 = tmp_pc;
f6_rrd0 = "001";
code_rrd0 = <f0_rrd0,f1_rrd0,f2_rrd0,f3_rrd0,f4_rrd0,f5_rrd0,f6_rrd0>;
null = DATAOUT_FORMA_ID0.write(code_rrd0);

f0_fwd0 = "00";
f1_fwd0 = "011";
f2_fwd0 = <zero27b,rs>;
f3_fwd0 = source0;
f4_fwd0 = cycle;
f5_fwd0 = tmp_pc;
f6_fwd0 = "001";
code_fwd0 = <f0_fwd0,f1_fwd0,f2_fwd0,f3_fwd0,f4_fwd0,f5_fwd0,f6_fwd0>;
null = DATAOUT_FORMA_ID1.write(code_fwd0);
"""
