module ALU_tb();

reg clk;
reg [2:0] opcode;
reg [31:0] A;
reg [31:0] B;
wire [31:0] Alu_out;
wire overflow;
wire zero;
wire neg;
wire carry;

ALU dut (opcode, A, B, Alu_out, overflow, zero, neg, carry);

always begin
	#10 clk =~ clk;
	end

initial begin
clk = 0;
#100 A <= 5;
#100 B <= 10;
#200 opcode <= 0; // ADD, result = 15 (1111) in binary
#300 A <= 26;
#300 B <= 17;
#400 opcode <= 1;	// XOR, result = 11 (1011) in binary
#500 A <= 100;
#500 B <= 900;
#600 opcode <= 2; // AND, result = 4 (100) in binary
#700 A <= 36;
#700 B <= 79;
#800 opcode <= 3; // OR, result = 111 (1101111) in binary
#900 A <= 46;
#900 B <= 200;
#1000 opcode <= 4; // NOR, result = 4294967057 (11111111111111111111111100010001) in binary
#1100 A <= 128;
#1200 opcode <= 5; // SL, result = 256 (100000000) in binary
#1300 A <= 256;
#1400 opcode <= 6; // SR, result = 128 (10000000) in binary
#1500 A <= 67;
#1500 B <= 55;
#1600 opcode <= 7; // SUB, result = 12 (1100) in binary
#10000 $stop;

end


	
endmodule