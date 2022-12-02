//Fixed ALU

`define ADD 4'b0000
`define SUB 4'b1000
`define AND 4'b0111
`define OR  4'b0110
`define XOR 4'b0100
`define SL  4'b0101
`define SR  4'b0011

module ALU(A, B, op, clk, result, status); 
	input [31:0] A, B;
	input [3:0] op;
	input clk;
	
	output reg [31:0] result;
	output reg [4:0] status; 
	
	always @(posedge clk) begin
	
		case (op) 
			`ADD: result <= A + B;
			`SUB: result <= A - B;
			`AND: result <= A & B;
			`OR:  result <= A | B;
			`XOR: result <= A ^ B;
			`SL: result <= A <<< 1;
			`SR: result <= A >>> 1;
			//must add two more operations for shifting, one for left shift and one for right shift
		endcase

		status[0] <= (A[31] & B[31]) | ((A[31] | B[31]) & ~result[31]); //carry
		status[1] <= ^result; //odd parity
		status[2] <= ~| result; //zero
		status[3] <= result[31]; //negative
		status[4] <= (A[31] ~^ B[31]) & (A[31]^result[31]);//overflow

	end
	
endmodule