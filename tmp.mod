instruction LB : I
{
opecode  opcode = "0000000000100000";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_8(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LBU : I
{
opecode  opcode = "0000000000100010";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ldu_8(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LH : I
{
opecode  opcode = "0000000000100100";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_16(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LHU : I
{
opecode  opcode = "0000000000100110";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ldu_16(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LW : I
{
opecode  opcode = "0000000000101000";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_32(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction DLW : I
{
opecode  opcode = "0000000000101001";

wire[31:0] source0;
wire[31:0] source1;
wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] bigE_word0;
wire [31:0] bigE_word1;
wire [4:0] nextRT;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire [3:0] flag;
wire [3:0] tmpRT;
wire one;

<addr1,flag> = ALU1.add(source0,source1);

one ='1';
tmpRT = rt[4:1];
nextRT = <tmpRT,one>;
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
null = FWUL0.lock2(nextRT);
null = FWUL1.lock2(nextRT);
null = FWUL2.lock2(nextRT);
null = FWUL3.lock2(nextRT);
};

stage 4 :
{
wire cout;
wire cin;
wire [31:0] four32bit;
wire addr_err;
wire [31:0] result1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

cin = '0';
four32bit = "00000000000000000000000000000100";

<result1,addr_err> = Dmem.ld_32(addr1);
byte0 = result1[31:24];
byte1 = result1[23:16];
byte2 = result1[15:8];
byte3 = result1[7:0];
bigE_word0 = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word0);
null = FWUL1.forward3(rt,bigE_word0);
null = FWUL2.forward3(rt,bigE_word0);
null = FWUL3.forward3(rt,bigE_word0);
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
null = FWUL0.lock4(nextRT);
null = FWUL1.lock4(nextRT);
null = FWUL2.lock4(nextRT);
null = FWUL3.lock4(nextRT);
};

stage 5 :
{
wire addr_err;
wire [31:0] result2;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result2,addr_err> = Dmem.ld_32(addr2);
byte0 = result2[31:24];
byte1 = result2[23:16];
byte2 = result2[15:8];
byte3 = result2[7:0];
bigE_word1 = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward5(rt,bigE_word0);
null = FWUL1.forward5(rt,bigE_word0);
null = FWUL2.forward5(rt,bigE_word0);
null = FWUL3.forward5(rt,bigE_word0);
null = FWUL0.forward6(nextRT,bigE_word1);
null = FWUL1.forward6(nextRT,bigE_word1);
null = FWUL2.forward6(nextRT,bigE_word1);
null = FWUL3.forward6(nextRT,bigE_word1);
null = FWUL0.lock5(nextRT);
null = FWUL1.lock5(nextRT);
null = FWUL2.lock5(nextRT);
null = FWUL3.lock5(nextRT);
};

stage 6 :
{
null = FWUL0.forward7(rt,bigE_word0);
null = FWUL1.forward7(rt,bigE_word0);
null = FWUL2.forward7(rt,bigE_word0);
null = FWUL3.forward7(rt,bigE_word0);
null = FWUL0.forward8(nextRT,bigE_word1);
null = FWUL1.forward8(nextRT,bigE_word1);
null = FWUL2.forward8(nextRT,bigE_word1);
null = FWUL3.forward8(nextRT,bigE_word1);
null = GPR.write0(rt,bigE_word0);
null = GPR.write1(nextRT,bigE_word1);
};
};
instruction LWL : I
{
opecode  opcode = "0000000000101100";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] source2;
wire[31:0] addr;
wire[31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;
wire[31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0, source2);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire[29:0] addr_mask;
wire[1:0] zero2;
wire[31:0] target;
wire[31:0] data;
wire addr_err;
wire[1:0] vAddr10;
wire[7:0] data2;
wire[7:0] data1;
wire[7:0] data0;
wire[7:0] reg2;
wire[7:0] reg1;
wire[7:0] reg0;
wire[31:0] result3;
wire[31:0] result2;
wire[31:0] result1;
wire[31:0] result0;
wire[31:0] bigE_data;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
vAddr10 = addr[1:0];
zero2 = "00";
target = <addr_mask,zero2>;

<data,addr_err> = Dmem.ld_32(target);

byte0 = data[31:24];
byte1 = data[23:16];
byte2 = data[15:8];
byte3 = data[7:0];
bigE_data = <byte3, byte2, byte1, byte0>;

data2 = bigE_data[23:16];
data1 = bigE_data[15:8];
data0 = bigE_data[7:0];
reg2 = source1[23:16];
reg1 = source1[15:8];
reg0 = source1[7:0];

result0 = <data0, reg2, reg1, reg0>;
result1 = <data1, data0, reg1, reg0>;
result2 = <data2, data1, data0, reg0>;
result3 = bigE_data;
result = MUXw32p4.sel(result0,result1,result2,result3,vAddr10);

null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction LWR : I
{
opecode  opcode = "0000000000101101";

wire[31:0] source0;
wire[31:0] source1;
wire[31:0] source2;
wire[31:0] addr;
wire[31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;
wire[31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0, source2);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire[29:0] addr_mask;
wire[1:0] zero2;
wire[31:0] target;
wire[31:0] data;
wire addr_err;
wire[1:0] vAddr10;
wire[7:0] data3;
wire[7:0] data2;
wire[7:0] data1;
wire[7:0] reg3;
wire[7:0] reg2;
wire[7:0] reg1;
wire[31:0] result3;
wire[31:0] result2;
wire[31:0] result1;
wire[31:0] result0;
wire[31:0] bigE_data;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
vAddr10 = addr[1:0];
zero2 = "00";
target = <addr_mask,zero2>;

<data,addr_err> = Dmem.ld_32(target);
byte0 = data[31:24];
byte1 = data[23:16];
byte2 = data[15:8];
byte3 = data[7:0];
bigE_data = <byte3, byte2, byte1, byte0>;
data3 = bigE_data[31:24];
data2 = bigE_data[23:16];
data1 = bigE_data[15:8];
reg3 = source1[31:24];
reg2 = source1[23:16];
reg1 = source1[15:8];

result3 = <reg3, reg2, reg1, data3>;
result2 = <reg3, reg2, data3, data2>;
result1 = <reg3, data3, data2, data1>;
result0 = bigE_data;
result = MUXw32p4.sel(result0,result1,result2,result3,vAddr10);

null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction SB : I
{
opecode  opcode = "0000000000110000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_8(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction SH : I
{
opecode  opcode = "0000000000110010";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_16(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction SW : I
{
opecode  opcode = "0000000000110100";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction DSW : I
{
opecode  opcode = "0000000000110101";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] source3;
wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source3;
wire [4:0] rt2;
wire [3:0] oldrt;
wire one;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; one = '1';
oldrt = rt[4:1];
rt2 = <oldrt,one>;
tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
tmp_source3 = GPR.read2(rt2);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
source2 = EXT1.sign(imm);
source3 = FWUL2.forward(rt2,tmp_source3);
};

stage 3 :
{
wire [3:0] flag;
wire cin;
wire cout;
wire [31:0] four32bit;

<addr1, flag> = ALU1.add(source0,source2);
cin = '1';
four32bit = "00000000000000000000000000000100";
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr1,LE_source1 /*source1*/);
};

stage 6 :
{
wire addr_err;
wire [31:0] LE_source3;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source3[31:24];
byte1 = source3[23:16];
byte2 = source3[15:8];
byte3 = source3[7:0];
LE_source3 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr2,LE_source3 /*source3*/);
};
};
instruction DSZ : I
{
opecode  opcode = "0000000000111000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [4:0] zero5;
wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; zero5 = "00000";
tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(zero5);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(zero5,tmp_source1);
source2 = EXT1.sign(imm);
};

stage 3 :
{
wire [3:0] flag;

<addr1,flag> = ALU1.add(source0,source2);
};

stage 4 :
{
wire cin;
wire cout;
wire [31:0] four32bit;

cin = '1';
four32bit ="00000000000000000000000000000100";
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
};

stage 5 :
{
wire addr_err;

addr_err = Dmem.s_32(addr1,source1);
};

stage 6 :
{
wire addr_err;

addr_err = Dmem.s_32(addr2,source1);
};
};
instruction SWL : I
{
opecode  opcode = "0000000000111001";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] tmp_pc;
wire [31:0] addr;
wire [31:0] result; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0, source2);
};

stage 4 :
{
wire [29:0] addr_mask;
wire [1:0] zero2;
wire [31:0] target;
wire [31:0] data;
wire addr_err;
wire [1:0] vAddr10;
wire [7:0] data3;
wire [7:0] data2;
wire [7:0] data1;
wire [7:0] reg3;
wire [7:0] reg2;
wire [7:0] reg1;
wire [31:0] result3;
wire [31:0] result2;
wire [31:0] result1;
wire [31:0] result0;
wire [31:0] nData;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
vAddr10 = addr[1:0];
zero2 = "00";
target = <addr_mask, zero2>;

<data, addr_err> = Dmem.ld_32(target);

byte0 = data[31:24];
byte1 = data[23:16];
byte2 = data[15:8];
byte3 = data[7:0];
nData = <byte3, byte2, byte1, byte0>;

data3 = nData[31:24];
data2 = nData[23:16];
data1 = nData[15:8];
reg3 = source1[31:24];
reg2 = source1[23:16];
reg1 = source1[15:8];
result3 = source1;
result2 = <data3, reg3, reg2, reg1>;
result1 = <data3, data2, reg3, reg2>;
result0 = <data3, data2, data1, reg3>;
result = MUXw32p4.sel(result0,result1,result2,result3,vAddr10);
};

stage 5 :
{
wire addr_err;
wire [29:0] addr_mask;
wire [1:0] zero2;
wire [31:0] target;
wire [31:0] nResult;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
zero2 = "00";
target = <addr_mask, zero2>;

byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
nResult = <byte3, byte2, byte1, byte0>;

addr_err = Dmem.s_32(target, nResult);
};

stage 6 :
{

};
};
instruction SWR : I
{
opecode  opcode = "0000000000111010";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] tmp_pc;
wire [31:0] addr;
wire [31:0] result; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source2 = EXT1.sign(imm);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<addr, flag> = ALU1.add(source0,source2);
};

stage 4 :
{
wire [29:0] addr_mask;
wire [1:0] zero2;
wire [31:0] target;
wire [31:0] data;
wire addr_err;
wire [1:0] vAddr10;
wire [7:0] data2;
wire [7:0] data1;
wire [7:0] data0;
wire [7:0] reg2;
wire [7:0] reg1;
wire [7:0] reg0;
wire [31:0] result3;
wire [31:0] result2;
wire [31:0] result1;
wire [31:0] result0;
wire [31:0] nData;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
vAddr10 = addr[1:0];
zero2 = "00";
target = <addr_mask, zero2>;

<data, addr_err> = Dmem.ld_32(target);

byte0 = data[31:24];
byte1 = data[23:16];
byte2 = data[15:8];
byte3 = data[7:0];
nData = <byte3, byte2, byte1, byte0>;

data2 = nData[23:16];
data1 = nData[15:8];
data0 = nData[7:0];
reg2 = source1[23:16];
reg1 = source1[15:8];
reg0 = source1[7:0];

result0 = source1;
result1 = <reg2, reg1, reg0, data0>;
result2 = <reg1, reg0, data1, data0>;
result3 = <reg0, data2, data1, data0>;
result = MUXw32p4.sel(result0,result1,result2,result3,vAddr10);
};

stage 5 :
{
wire addr_err;
wire [29:0] addr_mask;
wire [1:0] zero2;
wire [31:0] target;
wire [31:0] nResult;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

addr_mask = addr[31:2];
zero2 = "00";

byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
nResult = <byte3, byte2, byte1, byte0>;

target = <addr_mask, zero2>;
addr_err = Dmem.s_32(target, nResult);
};

stage 6 :
{

};
};
instruction LB_RR : R
{
opecode  opcode = "0000000011000000";

wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_8(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LBU_RR : R
{
opecode  opcode = "0000000011000001";

wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ldu_8(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LH_RR : R
{
opecode  opcode = "0000000011000010";

wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_16(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LHU_RR : R
{
opecode  opcode = "0000000011000011";

wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ldu_16(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction LW_RR : R
{
opecode  opcode = "0000000011000100";

wire[31:0] addr;
wire[31:0] bigE_word;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire[3:0] flag;

<addr,flag> = ALU1.add(source0,source1);
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
};

stage 4 :
{
wire addr_err;
wire[31:0] result;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result,addr_err> = Dmem.ld_32(addr);
byte0 = result[31:24];
byte1 = result[23:16];
byte2 = result[15:8];
byte3 = result[7:0];
bigE_word = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word);
null = FWUL1.forward3(rt,bigE_word);
null = FWUL2.forward3(rt,bigE_word);
null = FWUL3.forward3(rt,bigE_word);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
};

stage 5 :
{
null = FWUL0.forward5(rt,bigE_word);
null = FWUL1.forward5(rt,bigE_word);
null = FWUL2.forward5(rt,bigE_word);
null = FWUL3.forward5(rt,bigE_word);
};

stage 6 :
{
null = GPR.write0(rt,bigE_word);
null = FWUL0.forward7(rt,bigE_word);
null = FWUL1.forward7(rt,bigE_word);
null = FWUL2.forward7(rt,bigE_word);
null = FWUL3.forward7(rt,bigE_word);
};
};
instruction DLW_RR : R
{
opecode  opcode = "0000000011001110";

wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] bigE_word0;
wire [31:0] bigE_word1;
wire [4:0] nextRT;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rd,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;
wire [3:0] tmpRT;
wire one;

<addr1,flag> = ALU1.add(source0,source1);

one ='1';
tmpRT = rt[4:1];
nextRT = <tmpRT,one>;
null = FWUL0.lock1(rt);
null = FWUL1.lock1(rt);
null = FWUL2.lock1(rt);
null = FWUL3.lock1(rt);
null = FWUL0.lock2(nextRT);
null = FWUL1.lock2(nextRT);
null = FWUL2.lock2(nextRT);
null = FWUL3.lock2(nextRT);
};

stage 4 :
{
wire cout;
wire cin;
wire [31:0] four32bit;
wire addr_err;
wire [31:0] result1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

cin = '0';
four32bit = "00000000000000000000000000000100";

<result1,addr_err> = Dmem.ld_32(addr1);
byte0 = result1[31:24];
byte1 = result1[23:16];
byte2 = result1[15:8];
byte3 = result1[7:0];
bigE_word0 = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward3(rt,bigE_word0);
null = FWUL1.forward3(rt,bigE_word0);
null = FWUL2.forward3(rt,bigE_word0);
null = FWUL3.forward3(rt,bigE_word0);
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
null = FWUL0.lock3(rt);
null = FWUL1.lock3(rt);
null = FWUL2.lock3(rt);
null = FWUL3.lock3(rt);
null = FWUL0.lock4(nextRT);
null = FWUL1.lock4(nextRT);
null = FWUL2.lock4(nextRT);
null = FWUL3.lock4(nextRT);
};

stage 5 :
{
wire addr_err;
wire [31:0] result2;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

<result2,addr_err> = Dmem.ld_32(addr2);
byte0 = result2[31:24];
byte1 = result2[23:16];
byte2 = result2[15:8];
byte3 = result2[7:0];
bigE_word1 = <byte3, byte2, byte1, byte0>;
null = FWUL0.forward5(rt,bigE_word0);
null = FWUL1.forward5(rt,bigE_word0);
null = FWUL2.forward5(rt,bigE_word0);
null = FWUL3.forward5(rt,bigE_word0);
null = FWUL0.forward6(nextRT,bigE_word1);
null = FWUL1.forward6(nextRT,bigE_word1);
null = FWUL2.forward6(nextRT,bigE_word1);
null = FWUL3.forward6(nextRT,bigE_word1);
null = FWUL0.lock5(nextRT);
null = FWUL1.lock5(nextRT);
null = FWUL2.lock5(nextRT);
null = FWUL3.lock5(nextRT);
};

stage 6 :
{
null = FWUL0.forward7(rt,bigE_word0);
null = FWUL1.forward7(rt,bigE_word0);
null = FWUL2.forward7(rt,bigE_word0);
null = FWUL3.forward7(rt,bigE_word0);
null = FWUL0.forward8(nextRT,bigE_word1);
null = FWUL1.forward8(nextRT,bigE_word1);
null = FWUL2.forward8(nextRT,bigE_word1);
null = FWUL3.forward8(nextRT,bigE_word1);
null = GPR.write0(rt,bigE_word0);
null = GPR.write1(nextRT,bigE_word1);
};
};
instruction SB_RR : R
{
opecode  opcode = "0000000011000110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source2;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
tmp_source2 = GPR.read2(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
source2 = FWUL2.forward(rd,tmp_source2);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_8(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction SH_RR : R
{
opecode  opcode = "0000000011000111";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source2;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
tmp_source2 = GPR.read2(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
source2 = FWUL2.forward(rd,tmp_source2);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_16(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction SW_RR : R
{
opecode  opcode = "0000000011001000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source2;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
tmp_source2 = GPR.read2(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
source2 = FWUL2.forward(rd,tmp_source2);
};

stage 3 :
{
wire [3:0] flag;

<addr,flag> = ALU1.add(source0,source2);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr,LE_source1 /*source1*/);
};

stage 6 :
{

};
};
instruction DSW_RR : R
{
opecode  opcode = "0000000011010000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] source3;
wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [4:0] rt2;
wire [3:0] oldrt;
wire one;
wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source2;
wire [31:0] tmp_source3;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; one = '1';
oldrt = rt[4:1];
rt2 = <oldrt,one>;
tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
tmp_source2 = GPR.read2(rd);
tmp_source3 = GPR.read3(rt2);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
source2 = FWUL2.forward(rd,tmp_source2);
source3 = FWUL3.forward(rt2,tmp_source3);
};

stage 3 :
{
wire [3:0] flag;
wire cin;
wire cout;
wire [31:0] four32bit;

<addr1, flag> = ALU1.add(source0,source2);
cin = '1';
four32bit = "00000000000000000000000000000100";
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
};

stage 4 :
{

};

stage 5 :
{
wire addr_err;
wire [31:0] LE_source1;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source1[31:24];
byte1 = source1[23:16];
byte2 = source1[15:8];
byte3 = source1[7:0];
LE_source1 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr1,LE_source1 /*source1*/);
};

stage 6 :
{
wire addr_err;
wire [31:0] LE_source3;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;

byte0 = source3[31:24];
byte1 = source3[23:16];
byte2 = source3[15:8];
byte3 = source3[7:0];
LE_source3 = <byte3, byte2, byte1, byte0>;
addr_err = Dmem.s_32(addr2,LE_source3 /*source3*/);
};
};
instruction DSZ_RR : R
{
opecode  opcode = "0000000011010001";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] source2;
wire [31:0] addr1;
wire [31:0] addr2;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [4:0] zero5;
wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire [31:0] tmp_source2;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; zero5 = "00000";
tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(zero5);
tmp_source2 = GPR.read2(rd);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(zero5,tmp_source1);
source2 = FWUL2.forward(rd,tmp_source2);
};

stage 3 :
{
wire [3:0] flag;

<addr1,flag> = ALU1.add(source0,source2);
};

stage 4 :
{
wire cin;
wire cout;
wire [31:0] four32bit;

cin = '1';
four32bit ="00000000000000000000000000000100";
<addr2,cout> = ADDER2.adc(addr1,four32bit,cin);
};

stage 5 :
{
wire addr_err;

addr_err = Dmem.s_32(addr1,source1);
};

stage 6 :
{
wire addr_err;

addr_err = Dmem.s_32(addr2,source1);
};
};
instruction JUMP : J
{
opecode  opcode = "0000000000000001";

wire [31:0] result;
wire [31:0] tmp_pc; wire [25:0] targ;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_cpc;
wire [1:0] const;
wire [3:0] cpc_top;
wire zero1b0;
wire one1b0;

tmp_ir = IReg.read(); targ = tmp_ir[25:0]; one1b0 = '1';
zero1b0 = '0';
const = "00";
tmp_cpc = CPC.read();
cpc_top = tmp_cpc[31:28];
result = <cpc_top,targ,const>;
};

stage 3 :
{
null = CPC.write(result);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction JAL : J
{
opecode  opcode = "0000000000000010";

wire [31:0] link;
wire [4:0] linkReg;
wire [31:0] result;
wire [31:0] tmp_pc; wire [25:0] targ;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_cpc;
wire [1:0] const;
wire [3:0] cpc_top;

tmp_ir = IReg.read(); targ = tmp_ir[25:0]; const = "00";
tmp_cpc = CPC.read();
link = tmp_cpc;
cpc_top = tmp_cpc[31:28];
result = <cpc_top,targ,const>;
linkReg = "11111";
};

stage 3 :
{
null = CPC.write(result);
null = FWUL0.forward1(linkReg,link);
null = FWUL1.forward1(linkReg,link);
null = FWUL2.forward1(linkReg,link);
null = FWUL3.forward1(linkReg,link);
};

stage 4 :
{
null = FWUL0.forward3(linkReg,link);
null = FWUL1.forward3(linkReg,link);
null = FWUL2.forward3(linkReg,link);
null = FWUL3.forward3(linkReg,link);
};

stage 5 :
{
null = FWUL0.forward5(linkReg,link);
null = FWUL1.forward5(linkReg,link);
null = FWUL2.forward5(linkReg,link);
null = FWUL3.forward5(linkReg,link);
};

stage 6 :
{
null = GPR.write0(linkReg,link);
null = FWUL0.forward7(linkReg,link);
null = FWUL1.forward7(linkReg,link);
null = FWUL2.forward7(linkReg,link);
null = FWUL3.forward7(linkReg,link);
};
};
instruction JR : R
{
opecode  opcode = "0000000000000011";

wire [31:0] target;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source = GPR.read0(rs);
target = FWUL0.forward(rs,tmp_source);
};

stage 3 :
{
null =CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction JALR : R
{
opecode  opcode = "0000000000000100";

wire [31:0] target;
wire [31:0] link;
wire [4:0] linkReg;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; link = CPC.read();
tmp_source = GPR.read0(rs);
target = FWUL0.forward(rs,tmp_source);
};

stage 3 :
{
null = CPC.write(target);
linkReg = "11111";
null = FWUL0.forward1(linkReg,link);
null = FWUL1.forward1(linkReg,link);
null = FWUL2.forward1(linkReg,link);
null = FWUL3.forward1(linkReg,link);
};

stage 4 :
{
null = FWUL0.forward3(linkReg,link);
null = FWUL1.forward3(linkReg,link);
null = FWUL2.forward3(linkReg,link);
null = FWUL3.forward3(linkReg,link);
};

stage 5 :
{
null = FWUL0.forward5(linkReg,link);
null = FWUL1.forward5(linkReg,link);
null = FWUL2.forward5(linkReg,link);
null = FWUL3.forward5(linkReg,link);
};

stage 6 :
{
null = GPR.write0(linkReg,link);
null = FWUL0.forward7(linkReg,link);
null = FWUL1.forward7(linkReg,link);
null = FWUL2.forward7(linkReg,link);
null = FWUL3.forward7(linkReg,link);
};
};
instruction BEQ : I
{
opecode  opcode = "0000000000000101";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] target;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire cin;
wire cout;
wire [1:0] zero2;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [31:0] offset;
wire [31:0] tmp_cpc;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire zero;
wire cond;
wire [3:0] flag;

flag = ALU1.cmp(source0,source1);
zero = flag[2];
cond = zero =='1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BNE : I
{
opecode  opcode = "0000000000000110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] target;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;
wire cin;
wire cout;
wire [1:0] zero2;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [31:0] offset;
wire [31:0] tmp_cpc;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire zero;
wire cond;
wire [3:0] flag;

flag = ALU1.cmp(source0,source1);
zero = flag[2];
cond = zero !='1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BLEZ : I
{
opecode  opcode = "0000000000000111";

wire [31:0] target;
wire [31:0] src0;
wire[31:0] source0;
wire[31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_cpc;
wire cout;
wire [31:0] offset;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [1:0] zero2;
wire cin;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
src0 = FWU0.forward(rs,tmp_source0);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire cond_tmp;
wire cond;
wire [3:0] flag;
wire N;
wire Z;

flag = ALU1.cmpz(src0);
N = flag[1];
Z = flag[2];
cond_tmp = N|Z;
cond = cond_tmp == '1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BGTZ : I
{
opecode  opcode = "0000000000001000";

wire [31:0] src0;
wire [31:0] target;
wire[31:0] source0;
wire[31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_cpc;
wire cout;
wire [31:0] offset;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [1:0] zero2;
wire cin;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
src0 = FWU0.forward(rs,tmp_source0);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire cond_tmp;
wire cond;
wire [3:0] flag;
wire N;
wire Z;

flag = ALU1.cmpz(src0);
N = flag[1];
Z = flag[2];
cond_tmp = N|Z;
cond = cond_tmp != '1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BLTZ : I
{
opecode  opcode = "0000000000001001";

wire [31:0] src0;
wire [31:0] target;
wire[31:0] source0;
wire[31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_cpc;
wire cout;
wire [31:0] offset;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [1:0] zero2;
wire cin;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
src0 = FWU0.forward(rs,tmp_source0);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire cond;
wire [3:0] flag;
wire N;

flag = ALU1.cmpz(src0);
N = flag[1];
cond = N == '1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BGEZ : I
{
opecode  opcode = "0000000000001010";

wire [31:0] src0;
wire [31:0] target;
wire[31:0] source0;
wire[31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_cpc;
wire cout;
wire [31:0] offset;
wire [31:0] ext_imm;
wire [29:0] tmp;
wire [1:0] zero2;
wire cin;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
src0 = FWU0.forward(rs,tmp_source0);
cin = '0';
zero2 = "00";
ext_imm = EXT1.sign(imm);
tmp = ext_imm[29:0];
offset = <tmp,zero2>;
tmp_cpc = CPC.read();
<target,cout> = ADD1.adc(tmp_cpc,offset,cin);
};

stage 3 :
{
wire cond;
wire [3:0] flag;
wire N;

flag = ALU1.cmpz(src0);
N = flag[1];
cond = N != '1';
null = [cond] CPC.write(target);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction ADD : R
{
opecode  opcode = "0000000001000000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.add(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction ADDI : I
{
opecode  opcode = "0000000001000001";

wire[31:0] source0;
wire[31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.add(source0,source1);
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction ADDU : R
{
opecode  opcode = "0000000001000010";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.addu(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction ADDIU : I
{
opecode  opcode = "0000000001000011";

wire[31:0] source0;
wire[31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.addu(source0,source1);
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction SUB : R
{
opecode  opcode = "0000000001000100";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.sub(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SUBU : R
{
opecode  opcode = "0000000001000101";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.subu(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction MULT : R
{
opecode  opcode = "0000000001000110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] resulthi;
wire [31:0] resultlo;
wire [63:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
result = MUL1.mul(source0,source1);
resulthi = result[63:32];
resultlo = result[31:0];
null = LO.write(resultlo);
null = HI.write(resulthi);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction MULTU : R
{
opecode  opcode = "0000000001000111";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] resulthi;
wire [31:0] resultlo;
wire [63:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
result = MUL1.mulu(source0,source1);
resulthi = result[63:32];
resultlo = result[31:0];
null = LO.write(resultlo);
null = HI.write(resulthi);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction DIV : R
{
opecode  opcode = "0000000001001000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] resulthi;
wire [31:0] resultlo;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire flag;

<resultlo,resulthi,flag> = DIV1.div(source0,source1);
null = LO.write(resultlo);
null = HI.write(resulthi);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction DIVU : R
{
opecode  opcode = "0000000001001001";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] resulthi;
wire [31:0] resultlo;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire flag;

<resultlo,resulthi,flag> = DIV1.divu(source0,source1);
null = LO.write(resultlo);
null = HI.write(resulthi);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction MFHI : R
{
opecode  opcode = "0000000001001010";

wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire zero1b;
wire one1b0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; one1b0 = '1';
zero1b = '0';
result = HI.read();
};

stage 3 :
{
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction MTHI : R
{
opecode  opcode = "0000000001001011";

wire [31:0] source0;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
};

stage 3 :
{
null = HI.write(source0);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction MFLO : R
{
opecode  opcode = "0000000001001100";

wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire zero1b;
wire one1b0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; one1b0 = '1';
zero1b = '0';
result = LO.read();
};

stage 3 :
{
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction MTLO : R
{
opecode  opcode = "0000000001001101";

wire [31:0] source0;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
};

stage 3 :
{
null = LO.write(source0);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction AND : R
{
opecode  opcode = "0000000001001110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.and(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction ANDI : I
{
opecode  opcode = "0000000001001111";

wire [31:0] result;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.zero(imm);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.and(source0,source1);
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction OR : R
{
opecode  opcode = "0000000001010000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.or(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction ORI : I
{
opecode  opcode = "0000000001010001";

wire [31:0] result;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.zero(imm);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.or(source0,source1);
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction XOR : R
{
opecode  opcode = "0000000001010010";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.xor(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction XORI : I
{
opecode  opcode = "0000000001010011";

wire [31:0] result;
wire [31:0] source0;
wire [31:0] source1;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.zero(imm);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.xor(source0,source1);
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction NOR : R
{
opecode  opcode = "0000000001010100";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;

<result,flag> = ALU1.nor(source0,source1);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SLL : R
{
opecode  opcode = "0000000001010101";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [23:0] zero24;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; zero24 = "000000000000000000000000";

tmp_source0 = GPR.read0(rt);
source0 = FWUL0.forward(rt,tmp_source0);
source1 = <zero24,shamt>;
};

stage 3 :
{
wire [4:0] shift;

shift = source1[4:0];
result = SFT1.sll(source0,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SLLV : R
{
opecode  opcode = "0000000001010110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [4:0] shift;

shift = source0[4:0];
result = SFT1.sll(source1,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SRL : R
{
opecode  opcode = "0000000001010111";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [23:0] zero24;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; zero24 = "000000000000000000000000";

tmp_source0 = GPR.read0(rt);
source0 = FWUL0.forward(rt,tmp_source0);
source1 = <zero24,shamt>;
};

stage 3 :
{
wire [4:0] shift;

shift = source1[4:0];
result = SFT1.srl(source0,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SRLV : R
{
opecode  opcode = "0000000001011000";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [4:0] shift;

shift = source0[4:0];
result = SFT1.srl(source1,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SRA : R
{
opecode  opcode = "0000000001011001";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [23:0] zero24;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; zero24 = "000000000000000000000000";

tmp_source0 = GPR.read0(rt);
source0 = FWUL0.forward(rt,tmp_source0);
source1 = <zero24,shamt>;
};

stage 3 :
{
wire [4:0] shift;

shift = source1[4:0];
result = SFT1.sra(source0,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SRAV : R
{
opecode  opcode = "0000000001011010";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [4:0] shift;

shift = source0[4:0];
result = SFT1.sra(source1,shift);
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SLT : R
{
opecode  opcode = "0000000001011011";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;
wire [1:0] flag2;
wire NnV;
wire VnN;
wire cond;
wire [30:0] zero31;

zero31 = "0000000000000000000000000000000";

flag = ALU1.cmp(source0,source1);
flag2 = flag[1:0];

NnV = flag2 == "10";
VnN = flag == "1001";
cond = NnV | VnN;
result = <zero31,cond>;
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SLTI : I
{
opecode  opcode = "0000000001011100";

wire[31:0] source0;
wire[31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire[31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.sign(imm);
};

stage 3 :
{
wire [3:0] flag;
wire [1:0] flag2;
wire NnV;
wire VnN;
wire cond;
wire [30:0] zero31;

zero31 = "0000000000000000000000000000000";

flag = ALU1.cmp(source0,source1);
flag2 = flag[1:0];

NnV = flag2 == "10";
VnN = flag == "1001";
cond = NnV | VnN;
result = <zero31,cond>;
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction SLTU : R
{
opecode  opcode = "0000000001011101";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [4:0] rd; wire [7:0] shamt;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;
wire [31:0] tmp_source1;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; rd = tmp_ir[12:8]; shamt = tmp_ir[7:0]; tmp_source0 = GPR.read0(rs);
tmp_source1 = GPR.read1(rt);

source0 = FWUL0.forward(rs,tmp_source0);
source1 = FWUL1.forward(rt,tmp_source1);
};

stage 3 :
{
wire [3:0] flag;
wire [1:0] flag2;
wire cond;
wire [30:0] zero31;

zero31 = "0000000000000000000000000000000";

flag = ALU1.cmpu(source0,source1);
flag2 = flag[3:2];
cond = flag2 == "00";
result = <zero31,cond>;
null = FWUL0.forward1(rd,result);
null = FWUL1.forward1(rd,result);
null = FWUL2.forward1(rd,result);
null = FWUL3.forward1(rd,result);
};

stage 4 :
{
null = FWUL0.forward3(rd,result);
null = FWUL1.forward3(rd,result);
null = FWUL2.forward3(rd,result);
null = FWUL3.forward3(rd,result);
};

stage 5 :
{
null = FWUL0.forward5(rd,result);
null = FWUL1.forward5(rd,result);
null = FWUL2.forward5(rd,result);
null = FWUL3.forward5(rd,result);
};

stage 6 :
{
null = GPR.write0(rd,result);
null = FWUL0.forward7(rd,result);
null = FWUL1.forward7(rd,result);
null = FWUL2.forward7(rd,result);
null = FWUL3.forward7(rd,result);
};
};
instruction SLTIU : I
{
opecode  opcode = "0000000001011110";

wire [31:0] source0;
wire [31:0] source1;
wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [31:0] tmp_source0;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; tmp_source0 = GPR.read0(rs);
source0 = FWUL0.forward(rs,tmp_source0);
source1 = EXT1.zero(imm);
};

stage 3 :
{
wire [3:0] flag;
wire [1:0] flag2;
wire cond;
wire [30:0] zero31;

zero31 = "0000000000000000000000000000000";

flag = ALU1.cmpu(source0,source1);
flag2 = flag[3:2];
cond = flag2 == "00";
result = <zero31,cond>;
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction NOP : INH
{
opecode  opcode = "0000000000000000";

wire [31:0] tmp_pc;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;

tmp_ir = IReg.read();
};

stage 3 :
{

};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction LUI : I
{
opecode  opcode = "0000000010100010";

wire [31:0] result;
wire [31:0] tmp_pc; wire [4:0] rs; wire [4:0] rt; wire [15:0] imm;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;       wire [15:0] zero16;

tmp_ir = IReg.read(); rs = tmp_ir[28:24]; rt = tmp_ir[20:16]; imm = tmp_ir[15:0]; zero16 = "0000000000000000";
result = <imm,zero16>;
};

stage 3 :
{
null = FWUL0.forward1(rt,result);
null = FWUL1.forward1(rt,result);
null = FWUL2.forward1(rt,result);
null = FWUL3.forward1(rt,result);
};

stage 4 :
{
null = FWUL0.forward3(rt,result);
null = FWUL1.forward3(rt,result);
null = FWUL2.forward3(rt,result);
null = FWUL3.forward3(rt,result);
};

stage 5 :
{
null = FWUL0.forward5(rt,result);
null = FWUL1.forward5(rt,result);
null = FWUL2.forward5(rt,result);
null = FWUL3.forward5(rt,result);
};

stage 6 :
{
null = GPR.write0(rt,result);
null = FWUL0.forward7(rt,result);
null = FWUL1.forward7(rt,result);
null = FWUL2.forward7(rt,result);
null = FWUL3.forward7(rt,result);
};
};
instruction SYSCALL : INH
{
opecode  opcode = "0000000010100000";

wire [31:0] tmp_cpc;
wire [31:0] tmp_pc;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;

tmp_ir = IReg.read(); tmp_cpc = CPC.read();
};

stage 3 :
{
wire [31:0] result;

result = "00000000000000000000000001100000";
null = SYSREG.write(tmp_cpc);
null = CPC.write(result);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction BREAK : INH
{
opecode  opcode = "0000000010100001";

wire[31:0] tmp_cpc;
wire [31:0] tmp_pc;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;

tmp_ir = IReg.read(); tmp_cpc = CPC.read();
};

stage 3 :
{
wire [31:0] result;

null = SYSREG.write(tmp_cpc);
result = "00000000000000000000000000110000";
null = CPC.write(result);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
instruction SYSRET : INH
{
opecode  opcode = "0000000011111111";

wire[31:0] result;
wire [31:0] tmp_pc;

stage 1 :
{
wire[31:0] current_pc;
wire iramaddr_err;
wire[63:0] inst0;

current_pc = CPC.read();
tmp_pc=current_pc;
<inst0,iramaddr_err> = Imem.ld_64(current_pc);
null = IReg.write(inst0);
null = CPC.inc();
};

stage 2 :
{
wire [63:0] tmp_ir;

tmp_ir = IReg.read(); result = SYSREG.read();
};

stage 3 :
{
null = CPC.write(result);
};

stage 4 :
{

};

stage 5 :
{

};

stage 6 :
{

};
};
}
