module ALU(A,B,Cin,Cout, Sub,Z, N, M, Sum, opcode);
	input [31:0] A, B;
	input Cin;
	input Sub;
	input [3:0] opcode;
	output [31:0] Sum;
	output Cout, Z, N, M;
 
wire [31:0] ADD, XOR, AND, OR, NOR, SL, SR, Sub;
wire [31:0] W;

Adder32bit DUT(A,W,Cin,Cout,Sum); 
TwosComplement COM(B, Sub, W);
Shifter SLSR(A, B, SL, SR);
Mux MPR(Sum, XOR, NOR, OR, AND, SL, SR, Fout, opcode);

assign XOR = A ^ B;
assign AND = A & B;
assign ADD = Sum;
assign OR = A | B; 
assign NOR = ~(A|B);

// zero
assign Z = (Sum == 32'b0 ? 1'b1 : 1'b0);

// negative
assign N = ADD[31];

// overflow
assign M = (A[31] & B[31] & ~ Sum[31]) | (~A[31] & B[31] & Sum[31]);

endmodule 

// 32 bit adder
module Adder32bit(A, B, Cin, Cout, ADD);
input [31:0] A,B;
input [31:0] Cin;
output [31:0] Cout;
output [31:0] ADD;

FullAdder DUT_0(A[0],B[0], Cin, Cout[0], ADD[0]);
FullAdder DUT_1(A[1], B[1], Cout[1], Cout[1], ADD[1]);
FullAdder DUT_2(A[2], B[2], Cout[2], Cout[2], ADD[2]);
FullAdder DUT_3(A[3], B[3], Cout[3], Cout[3], ADD[3]);
FullAdder DUT_4(A[4], B[4], Cout[4], Cout[4], ADD[4]);
FullAdder DUT_5(A[5], B[5], Cout[5], Cout[5], ADD[5]);
FullAdder DUT_6(A[6], B[6], Cout[6], Cout[6], ADD[6]);
FullAdder DUT_7(A[7], B[7], Cout[7], Cout[7], ADD[7]);
FullAdder DUT_8(A[8], B[8], Cout[8], Cout[8], ADD[8]);
FullAdder DUT_9(A[9], B[9], Cout[9], Cout[9], ADD[9]);
FullAdder DUT_10(A[10], B[10], Cout[10], Cout[10], ADD[10]);
FullAdder DUT_11(A[11], B[11], Cout[11], Cout[11], ADD[11]);
FullAdder DUT_12(A[12], B[12], Cout[12], Cout[12], ADD[12]);
FullAdder DUT_13(A[13], B[13], Cout[13], Cout[13], ADD[13]);
FullAdder DUT_14(A[14], B[14], Cout[14], Cout[14], ADD[14]);
FullAdder DUT_15(A[15], B[15], Cout[15], Cout[15], ADD[15]);
FullAdder DUT_16(A[16], B[16], Cout[16], Cout[16], ADD[16]);
FullAdder DUT_17(A[17], B[17], Cout[17], Cout[17], ADD[17]);
FullAdder DUT_18(A[18], B[18], Cout[18], Cout[18], ADD[18]);
FullAdder DUT_19(A[19], B[19], Cout[19], Cout[19], ADD[19]);
FullAdder DUT_20(A[20], B[20], Cout[20], Cout[20], ADD[20]);
FullAdder DUT_21(A[21], B[21], Cout[21], Cout[21], ADD[21]);
FullAdder DUT_22(A[22], B[22], Cout[22], Cout[22], ADD[22]);
FullAdder DUT_23(A[23], B[23], Cout[23], Cout[23], ADD[23]);
FullAdder DUT_24(A[24], B[24], Cout[24], Cout[24], ADD[24]);
FullAdder DUT_25(A[25], B[25], Cout[25], Cout[25], ADD[25]);
FullAdder DUT_26(A[26], B[26], Cout[26], Cout[26], ADD[26]);
FullAdder DUT_27(A[27], B[27], Cout[27], Cout[27], ADD[27]);
FullAdder DUT_28(A[28], B[28], Cout[28], Cout[28], ADD[28]);
FullAdder DUT_29(A[29], B[29], Cout[29], Cout[29], ADD[29]);
FullAdder DUT_30(A[30], B[30], Cout[30], Cout[30], ADD[30]);
FullAdder DUT_31(A[31], B[31], Cout[31], Cout[31], ADD[31]);
endmodule


// Full Adder
module FullAdder(A,B,Cin,Cout,ADD);
input [31:0] A,B;
input Cin;
output Cout;
output [31:0] ADD;
assign ADD = A^B^Cin; 
assign Cout = (A&B | Cin&B | Cin&A);
endmodule 

module TwosComplement(B, Sub, W);
input [31:0] B;
input Sub;
output reg W;

always @(B or Sub)
	if(Sub) begin
		W <= ~(B[31:0] +1'b1);
	end
	else begin
		W <= B;
end
endmodule 

module Shifter(A, B, SL, SR);
input [31:0] A, B;
output [31:0] SL, SR;
assign SL = A << B;
assign SR = A >> B;
endmodule 

module Mux (Sum, XOR, NOR, OR, AND, SL, SR, Fout, opcode);
input [31:0] Sum, XOR, NOR, OR, AND, SL, SR;
input [2:0] opcode;
output reg[31:0] Fout;

always @(Sum or XOR or NOR or OR or AND or SL or SR or 32'b0 or opcode)
begin 
	case(opcode)
	3'b000 : Fout <= Sum;
	3'b001 : Fout <= XOR;
	3'b010 : Fout <= OR;
	3'b011 : Fout <= AND;
	3'b100 : Fout <= NOR;
	3'b101 : Fout <= SL;
	3'b110 : Fout <= SR;
	3'b111 : Fout <= 32'b0;
	default : Fout <= 1'bx;
	endcase
end 
endmodule