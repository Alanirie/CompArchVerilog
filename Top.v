module Top(clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);
	input clk, reset, pcsrc, alusrc, mrw, wb, regrw;
	input [3:0] aluop;
	output [31:0] instr;
	output [4:0] status;
	input [1:0] immgen_ctrl;

	wire [4:0] rd, rs1, rs2;
	wire [31:0] instr;
	
	wire [31:0] pc_in, pc_out, rom_out, ram_out, alu_out;
	wire [31:0] pc_addA_out, pc_addB_out;
	wire [31:0] pcmux_out;

	assign pc_in = pcmux_out;

	wire [31:0] rf_out1, rf_out2, immgen_out, alumux_out, alurammux_out;

	// Instantiate I guess
	ImmGen IMM(imm_in, imm_out, immgen_ctrl);
	PC PRC(pc_in, pc_out, reset, clk);
	ADDR_by_4 ADDR(pc_in, pc_out);
	ROM DROM(pc_out, rom_out);
	ID DID(rom_out, rd, rs1, rs2, instr);
	RAM DRAM(clk, mrw, reset, dataIn, addy, ram_out);
	RegFile RGF(ram_out, rd, rs1, rs2, clk, regrw, rf_out1, rf_out2);
	ALU DUT(rf_out1, rf_out2, aluop, clk, addy, status);
	
endmodule
	