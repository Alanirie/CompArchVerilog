`timescale 1ns/1ps
module CU_tb();
	reg [31:0] inst;
	reg [3:0] status;
	reg rst;
	wire alusrc, rw, mrw, wb, pcsrc;
	wire [1:0] imm_sel;
	wire [3:0] alu_op;

CU DUT(status, inst, alusrc, rw, mrw, wb, pcsrc, imm_sel, alu_op, rst);

initial begin

	status = 4'b0000;

	rst = 1'b1;
	#1 rst=1'b0;

inst=32'b00000000011100110000001010110011;
#10 inst=32'b0000000101000101000001110010011;
#10 inst=32'b00000000011000111010000000100011;
#10 inst=32'b00000000000000111010111000000011;
#10 inst=32'b00000001110000111000111101100011;
#10 inst=32'b0000000101000101000001110010011;
#10 $stop;

end

endmodule