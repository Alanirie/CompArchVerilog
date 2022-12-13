module Top_PC(next, current, rst, CLK, RD, RS1, RS2, out, imm);
	input rst, CLK;
	output [7:0] next, current;
	output[4:0] RD, RS1, RS2;
	output[11:0] imm;
	output[31:0] out;
	wire [7:0] PC;
	wire [7:0] PC4;
	
	PC DUT(CLK, rst, PC4 ,PC);
	ADDR_by_4 HUT(PC, PC4);
	ROM JUT(PC, out);
	Instruction_Decoder SUT(out, RD, RS1, RS2, imm);
	
	assign current = PC;
	assign next = PC4;
endmodule


module ROM(ADDR, out);
input [7:0] ADDR;
output reg [31:0] out;


always @(ADDR) begin
case(ADDR)
8'h0: out =32'h00000000;
8'h4: out = 32'h00450693;
8'h8: out = 32'h00100713;
8'hc: out = 32'h00b76463;
8'h10: out = 32'h0006a803;
8'h14: out = 32'h00008067;
8'h18: out = 32'h00068613;
8'h1c: out = 32'h00070793;
8'h20: out = 32'hffc62883;
8'h24: out = 32'h01185a63;
8'h28: out = 32'h01162023;
8'h2c: out = 32'hfff78793;
8'h30: out = 32'hffc60613;
8'h34: out = 32'hfe0796e3;
8'h38: out = 32'h00279793;
8'h3c: out = 32'h00f50763;
8'h40: out = 32'h0107a023;
8'h44: out = 32'h00170713;
8'h48: out = 32'h00468693;
8'h4c: out = 32'hfc1ff06f;

endcase
end
endmodule

module PC(clk, rst, PC4, PC);
input [7:0]PC4;
input rst, clk;
output reg[7:0]PC;

always @(posedge clk) begin
if(rst) begin
PC = 8'd0;
end
else begin
PC = PC4;
end
end

endmodule 

module Instruction_Decoder(instr, inst, RD, RS1, RS2, IMM);
input[31:0] instr;
output [4:0] RD, RS1, RS2;
output [11:0] IMM;
output [31:0] inst;


assign RD = instr[11:7];
assign RS1 = instr[19:15];
assign RS2 = instr[24:20];
assign IMM = instr[31:20];
assign inst = instr;
endmodule 

module ADDR_by_4(PC, PC4);
input [7:0] PC;
output [7:0] PC4;
assign PC4 = PC + 8'd4;
endmodule