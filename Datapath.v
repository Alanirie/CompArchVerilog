module Datapath(clk, rst, status, pcsrc, alusrc, aluop, instr, mrw, wb, regrw, immgen_ctrl);
	input clk, rst, pcsrc, alusrc, mrw, wb, regrw;
	input [3:0] aluop;
	input immgen_ctrl;
	output [3:0] status;
	output[31:0] instr;

wire [4:0] rd, rs1, rs2;
wire [31:0] pc_in, pc_out, rom_out, ram_out, alu_out;
wire [31:0] pc_adda_out, pc_addb_out;
wire [31:0] pc_muxout;

assign pc_in = pcmux_out;

wire [31:0] rf_out1, rf_out2, immgen_out, alumux_out, alurammux_out;

// Instantiate

Reg_32x32 JUT(rs1, rs2, rd, alurammux_out, rst, en, clk, rf_out1, rf_out2, regrw);
ALU WUT(rf_out1, alumux_out, Cin, alu_out, Sub,Z, N, M, status, aluop);
ROM TUT(pc_out, rom_out);
Instruction_Decoder HUT(rom_out, instr, rd, rs1, rs2, imm);
PC EUT(clk, rst, pc_in, pc_out);
Ram_256x32 UUT(alu_out, mrw, clk, rf_out2, ram_out);
ImmGen QUT(instr, immgen_out, immgen_ctrl);
Adder32bit YUT(pc_out, B, Cin, pc_adda_out, ADD);
Adder32bit IUT(pc_out, immgen_out, Cin, pc_addb_out, ADD);
mux_2x1 AUT(pc_adda_out, pc_addb_out, pcsrc, pcmux_out); // PC Mux
mux_2xone SUT(rf_out2, immgen_out, wb, alumux_out); // ALU Mux
mux_twox1 OUT(alu_out, ram_out, alusrc,alurammux_out); // RAM Mux 

endmodule