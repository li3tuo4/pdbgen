
resconf_ex = \
"""
wire [31:0] cycle;
wire ctrlwire_ex0;
wire cond_ex0;
wire [1:0] f0_ex0;
wire [2:0] f1_ex0;
wire [31:0] f2_ex0;
wire [31:0] f3_ex0;
wire [31:0] f4_ex0;
wire [31:0] f5_ex0;
wire [2:0] f6_ex0;
wire [135:0] code_ex0;
wire ctrlwire_ex1;
wire cond_ex1;
wire ctrlwire_ex2;
wire cond_ex2;

cycle = CYCLEWIRE_FORMA_EX.read();
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

ctrlwire_ex1 = CTRLWIRE_FORMA_EX1.read();
cond_ex1 = ctrlwire_ex1 == '1';
null = [cond_ex1]DATAOUT_FORMA_EX1.write(code_ex0);

ctrlwire_ex2 = CTRLWIRE_FORMA_EX2.read();
cond_ex2 = ctrlwire_ex2 == '1';
null = [cond_ex2]DATAOUT_FORMA_EX2.write(code_ex0);
"""

resconf_m1 = \
"""
wire [31:0] cycle;
wire ctrlwire_m10;
wire cond_m10;
wire [1:0] f0_m10;
wire [2:0] f1_m10;
wire [31:0] f2_m10;
wire [31:0] f3_m10;
wire [31:0] f4_m10;
wire [31:0] f5_m10;
wire [2:0] f6_m10;
wire [135:0] code_m10;
wire ctrlwire_m11;
wire cond_m11;
wire ctrlwire_m12;
wire cond_m12;

cycle = CYCLEWIRE_FORMA_M1.read();
ctrlwire_m10 = CTRLWIRE_FORMA_M10.read();
cond_m10 = ctrlwire_m10 == '1';
f0_m10 = "10";
f1_m10 = "001";
f2_m10 = "00000000000000000000000000000000";
f3_m10 = "00000000000000000000000000000000";
f4_m10 = cycle;
f5_m10 = tmp_pc;
f6_m10 = "011";
code_m10 = <f0_m10,f1_m10,f2_m10,f3_m10,f4_m10,f5_m10,f6_m10>;
null = [cond_m10]DATAOUT_FORMA_M10.write(code_m10);

ctrlwire_m11 = CTRLWIRE_FORMA_M11.read();
cond_m11 = ctrlwire_m11 == '1';
null = [cond_m11]DATAOUT_FORMA_M11.write(code_m10);

ctrlwire_m12 = CTRLWIRE_FORMA_M12.read();
cond_m12 = ctrlwire_m12 == '1';
null = [cond_m12]DATAOUT_FORMA_M12.write(code_m10);
"""

resconf_m2 = \
"""
wire [31:0] cycle;
wire ctrlwire_m20;
wire cond_m20;
wire [1:0] f0_m20;
wire [2:0] f1_m20;
wire [31:0] f2_m20;
wire [31:0] f3_m20;
wire [31:0] f4_m20;
wire [31:0] f5_m20;
wire [2:0] f6_m20;
wire [135:0] code_m20;
wire ctrlwire_m21;
wire cond_m21;
wire ctrlwire_m22;
wire cond_m22;
wire ctrlwire_m23;
wire cond_m23;

cycle = CYCLEWIRE_FORMA_M2.read();
ctrlwire_m20 = CTRLWIRE_FORMA_M20.read();
cond_m20 = ctrlwire_m20 == '1';
f0_m20 = "10";
f1_m20 = "001";
f2_m20 = "00000000000000000000000000000000";
f3_m20 = "00000000000000000000000000000000";
f4_m20 = cycle;
f5_m20 = tmp_pc;
f6_m20 = "100";
code_m20 = <f0_m20,f1_m20,f2_m20,f3_m20,f4_m20,f5_m20,f6_m20>;
null = [cond_m20]DATAOUT_FORMA_M20.write(code_m20);

ctrlwire_m21 = CTRLWIRE_FORMA_M21.read();
cond_m21 = ctrlwire_m21 == '1';
null = [cond_m21]DATAOUT_FORMA_M21.write(code_m20);

ctrlwire_m22 = CTRLWIRE_FORMA_M22.read();
cond_m22 = ctrlwire_m22 == '1';
null = [cond_m22]DATAOUT_FORMA_M22.write(code_m20);

ctrlwire_m23 = CTRLWIRE_FORMA_M23.read();
cond_m23 = ctrlwire_m23 == '1';
null = [cond_m23]DATAOUT_FORMA_M23.write(code_m20);
"""
