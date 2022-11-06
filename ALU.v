module ALU(opcode, A, B, Alu_out, overflow, zero, neg, carry);
input [2:0] opcode;
input [31:0] A;
input [31:0] B;
output [31:0] Alu_out;
reg [31:0] result;
reg overflow_f;
reg zero_f;
reg neg_f;
reg carry_f;
output overflow;
output zero;
output neg;
output carry;

always @(opcode) begin
overflow_f = 0;
carry_f = 0;
	case(opcode)
	0: // ADD
		result = A + B;
	1: // XOR
		result = A ^ B;
	2: // AND
		result = A & B;
	3: // OR
		result = A | B;
	4: // NOR
		result = ~(A | B);
	5: // SL
		result = A << 1;
	6: //SR
		result = A >> 1;
	7: // SUB
		result = A - B;
	endcase
	
	// carry / overflow flag 
	if (opcode == 0) 
		begin
		carry_f = (A[31] ^ B[31]) ? 0: (result[31] ^ A[31]);
		end
	if (opcode == 7)
		begin
		overflow_f = (A[31] ^ B[31]) & (A[31] ^ result[31]);
		end
	// zero flag
	if (result == 0)
		begin
		zero_f <= 1;
		end
	else
		begin
		zero_f <= 0;
		end
	// neg flag
	if (result < 2147483647)
		begin
		neg_f <= 0;
		end
	else
		begin
		neg_f <= 1;
		end
end
	
	assign Alu_out = result;
	assign overflow = overflow_f;
	assign zero = zero_f;
	assign neg = neg_f;
	assign carry = carry_f;

endmodule