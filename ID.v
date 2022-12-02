module ID(inst, rd, rs1, rs2, instr);
//define I/O
input [31:0] inst; // 32-bit instr.
output [4:0] rd, rs1, rs2; // 5-bit 
output [31:0] instr;

	assign rd = instruction [11:7];
	assign rs1 = instruction [19:15];
	assign rs2 = instruction [24:20];
	assign instr = inst;
	
endmodule