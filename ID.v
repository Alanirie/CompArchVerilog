module ID(instruction, RD, RS1, RS2, IMM);
//define I/O
input [31:0] instruction; // 32-bit instr.
output [4:0] RD, RS1, RS2; // 5-bit 
output [11:0] IMM; // 12-bit immediate

	assign RD = instruction [11:7];
	assign RS1 = instruction [19:15];
	assign RS2 = instruction [24:20];
	assign IMM = instruction [31:20];
endmodule
