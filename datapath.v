module datapath (clk1,clk2,clk3,reset,IMMs,RW,ALUsrc,ALUop,sub,PCsrc,MRW,MTR,Cout,Z,N,M,x0,x2,x3,x4,x5,count,C,I);
	input clk1,clk2,clk3,reset;
	input RW,ALUsrc,PCsrc,MRW,MTR,sub;
	input [1:0] IMMs;
	input [2:0] ALUop;
	output [31:0] I,x0,x2,x3,x4,x5,C;
	output [7:0] count;
	output Cout,Z,N,M;
	
	wire [7:0] PC,PCnext;
	PC inst0 (clk1, reset,PCnext,PC);
	// PC(clk, rst, PC4, PC)
	assign count = PC;
	
	ROM inst2 (PC,I);
	
	wire [4:0] RD,RS1,RS2;
	ID inst3 (I,RD,RS1,RS2);
	
	wire [31:0] A,B,B1,B2,C1,C2;
	RegFile inst4(A,B1,C,RS1,RS2,RD,clk3,reset,RW,x0,x2,x3,x4,x5);
	ImmGen inst5(I,B2,IMMs);
	
	mux2x1 toALU(B1,B2,ALUsrc,B);
	
	ALU inst6(A,B,1'b0,ALUop,sub,C1,Cout,Z,N,M);
	ram256x32 inst7(B1,C2,C1,MRW,clk2);
	//ram256x32(D, F, Adr, RW, clk)
	mux2x1 toReg(C2,C1,MTR,C);
	mux2x1 toPC(PC+3'b100,PC+B2,PCsrc,PCnext);
	
endmodule

module mux2x1 (A,B,S,C);
	input [31:0] A,B;
	input S;
	output reg[31:0] C;
	
	always @(A,B,S) begin
	case (S)
		1'b0: C <= A;
		1'b1: C <= B;
		endcase
	end
	
endmodule