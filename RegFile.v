module RegFile (A,B,Data_In,RS1,RS2,RD,clock,reset,W,x0,x2,x3,x4,x5);
	input [31:0] Data_In;
	input [4:0] RS1,RS2,RD;
	input clock,reset,W;
	output [31:0] A,B,x2,x3,x4,x5,x0;
	
	wire [31:0] D;
	decoderR dec0 (RD,D);
	
	wire [31:0] R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;
	
	//register reg0  (C, R0,  (W&D[0]),  clock, reset);
	register reg1  (Data_In, R1,  (W&D[1]),  clock, reset);
	register reg2  (Data_In, R2,  (W&D[2]),  clock, reset);
	register reg3  (Data_In, R3,  (W&D[3]),  clock, reset);
	register reg4  (Data_In, R4,  (W&D[4]),  clock, reset);
	register reg5  (Data_In, R5,  (W&D[5]),  clock, reset);
	register reg6  (Data_In, R6,  (W&D[6]),  clock, reset);
	register reg7  (Data_In, R7,  (W&D[7]),  clock, reset);
	register reg8  (Data_In, R8,  (W&D[8]),  clock, reset);
	register reg9  (Data_In, R9,  (W&D[9]),  clock, reset);
	register reg10 (Data_In, R10, (W&D[10]), clock, reset);
	register reg11 (Data_In, R11, (W&D[11]), clock, reset);
	register reg12 (Data_In, R12, (W&D[12]), clock, reset);
	register reg13 (Data_In, R13, (W&D[13]), clock, reset);
	register reg14 (Data_In, R14, (W&D[14]), clock, reset);
	register reg15 (Data_In, R15, (W&D[15]), clock, reset);
	register reg16 (Data_In, R16, (W&D[16]), clock, reset);
	register reg17 (Data_In, R17, (W&D[17]), clock, reset);
	register reg18 (Data_In, R18, (W&D[18]), clock, reset);
	register reg19 (Data_In, R19, (W&D[19]), clock, reset);
	register reg20 (Data_In, R20, (W&D[20]), clock, reset);
	register reg21 (Data_In, R21, (W&D[21]), clock, reset);
	register reg22 (Data_In, R22, (W&D[22]), clock, reset);
	register reg23 (Data_In, R23, (W&D[23]), clock, reset);
	register reg24 (Data_In, R24, (W&D[24]), clock, reset);
	register reg25 (Data_In, R25, (W&D[25]), clock, reset);
	register reg26 (Data_In, R26, (W&D[26]), clock, reset);
	register reg27 (Data_In, R27, (W&D[27]), clock, reset);
	register reg28 (Data_In, R28, (W&D[28]), clock, reset);
	register reg29 (Data_In, R29, (W&D[29]), clock, reset);
	register reg30 (Data_In, R30, (W&D[30]), clock, reset);
	register reg31 (Data_In, R31, (W&D[31]), clock, reset);

	assign R0 = 32'b0;
	assign x0 = R0;
	assign x2 = R2;
	assign x3 = R3;
	assign x4 = R4;
	assign x5 = R5;

	muxR M1 (R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,RS1,A);
	
	muxR M2 (R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,RS2,B);
	
endmodule


module decoderR (S, F);
	input [4:0] S;
	output reg [31:0] F;
	
	always @(S) begin 
	case (S)
		5'b00000: F<= 32'b00000000000000000000000000000001;
		5'b00001: F<= 32'b00000000000000000000000000000010;
		5'b00010: F<= 32'b00000000000000000000000000000100;
		5'b00011: F<= 32'b00000000000000000000000000001000;
		5'b00100: F<= 32'b00000000000000000000000000010000;
		5'b00101: F<= 32'b00000000000000000000000000100000;
		5'b00110: F<= 32'b00000000000000000000000001000000;
		5'b00111: F<= 32'b00000000000000000000000010000000;
		5'b01000: F<= 32'b00000000000000000000000100000000;
		5'b01001: F<= 32'b00000000000000000000001000000000;
		5'b01010: F<= 32'b00000000000000000000010000000000;
		5'b01011: F<= 32'b00000000000000000000100000000000;
		5'b01100: F<= 32'b00000000000000000001000000000000;
		5'b01101: F<= 32'b00000000000000000010000000000000;
		5'b01110: F<= 32'b00000000000000000100000000000000;
		5'b01111: F<= 32'b00000000000000001000000000000000;
		5'b10000: F<= 32'b00000000000000010000000000000000;
		5'b10001: F<= 32'b00000000000000100000000000000000;
		5'b10010: F<= 32'b00000000000001000000000000000000;
		5'b10011: F<= 32'b00000000000010000000000000000000;
		5'b10100: F<= 32'b00000000000100000000000000000000;
		5'b10101: F<= 32'b00000000001000000000000000000000;
		5'b10110: F<= 32'b00000000010000000000000000000000;
		5'b10111: F<= 32'b00000000100000000000000000000000;
		5'b11000: F<= 32'b00000001000000000000000000000000;
		5'b11001: F<= 32'b00000010000000000000000000000000;
		5'b11010: F<= 32'b00000100000000000000000000000000;
		5'b11011: F<= 32'b00001000000000000000000000000000;
		5'b11100: F<= 32'b00010000000000000000000000000000;
		5'b11101: F<= 32'b00100000000000000000000000000000;
		5'b11110: F<= 32'b01000000000000000000000000000000;
		5'b11111: F<= 32'b10000000000000000000000000000000;
	endcase
	end
	
endmodule


module register (C, F, load, clk, reset);
	input [31:0] C;
	input load, clk, reset;
	output reg [31:0] F;
	
	always @(posedge clk, posedge reset)
	begin
		if (reset)
			F <= 0;
		else if(load)
			F <= C;
		else 
			F <= F;
	end
	
endmodule


module muxR (R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,
R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,S,F);
	
	input [31:0] R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,
	R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;
	     
	input [4:0] S;
	output reg [31:0] F;
	
	always @(S,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,
	R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31) begin
	case (S)
		5'b00000: F <= R0;
		5'b00001: F <= R1;
		5'b00010: F <= R2;
		5'b00011: F <= R3;
		5'b00100: F <= R4;
		5'b00101: F <= R5;
		5'b00110: F <= R6;
		5'b00111: F <= R7;
		5'b01000: F <= R8;
		5'b01001: F <= R9;
		5'b01010: F <= R10;
		5'b01011: F <= R11;
		5'b01100: F <= R12;
		5'b01101: F <= R13;
		5'b01110: F <= R14;
		5'b01111: F <= R15;
		5'b10000: F <= R16;
		5'b10001: F <= R17;
		5'b10010: F <= R18;
		5'b10011: F <= R19;
		5'b10100: F <= R20;
		5'b10101: F <= R21;
		5'b10110: F <= R22;
		5'b10111: F <= R23;
		5'b11000: F <= R24;
		5'b11001: F <= R25;
		5'b11010: F <= R26;
		5'b11011: F <= R27;
		5'b11100: F <= R28;
		5'b11101: F <= R29;
		5'b11110: F <= R30;
		5'b11111: F <= R31;
		endcase
	end
endmodule