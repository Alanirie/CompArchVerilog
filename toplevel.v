module toplevel(clk1, clk2, clk3, reset, x0, x2, x3, x4, x5, count, C, I);
	input clk1, clk2, clk3, reset;
	output [31:0] x0, x2, x3, x4, x5, C, I;
	output [7:0] count;
	
	wire RW, ALUsrc, sub, MRW, MTR, Cout, N, M, PCsrc, Z;
	wire [3:0] ALUop;
	wire [1:0] IMMs;
	
	CU DUT(I, Z, IMMs, RW, ALUsrc, ALUop, sub, PCsrc, MRW, MTR);
	datapath HUT(clk1, clk2, clk3, reset, IMMs, RW, ALUsrc, ALUop, sub, PCsrc, MRW, MTR, Cout, Z, N, M, x0, x2, x3, x4, x5, count, C, I);

endmodule