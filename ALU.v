module ALU (A,B,Cin,opcode,sub,F,Cout,Z,N,M);
	input [31:0] A,B;
	input [2:0] opcode;
	input sub;
	input Cin;
	output [31:0] F;
	output Cout,Z,N,M;
	
	wire [31:0] W;
	wire [31:0] ADD,XOR,AND,OR,NOR,LS,RS;
	
	twoscomplement ALU0 (B,W,sub); //finds two complement of B if subtracting, output W
	adder32bit ALU1 (A,W,Cin,ADD,Cout); //adds A and W, output ADD
	 
	assign XOR = A^B; //A xor B
	assign AND = A&B; //A and B
	assign OR = A|B;  //A or  B
	assign NOR = ~OR; //A nor B
	
	shifter ALU2 (A,B,LS,RS); //A shift left B, A shift Right B
	
	muxALU ALU3 (opcode, F, ADD, LS, 32'b0, NOR, XOR, RS, OR, AND); //Mux for choosing operation
	
	//status bits
	assign N = ADD[31];
	assign M = (A[31]&B[31]&~ADD[31])|(~A[31]&~B[31]&ADD[31]);
	assign Z = (ADD==32'b0)? 1'b1:1'b0;
	
endmodule


module twoscomplement (D,F,S); //finds twos complements of number
	input [31:0]D;
	input S;
	output reg [31:0]F;
	
	always @(S,D)
	begin
		if(S)
			F[31:0] = ~D[31:0] + 1'b1;
		else
			F = D;
	end
endmodule



module adder32bit (a,b,cin,out,cout); //32 bit adder
	input [31:0] a,b;
	input cin;
	output cout;
	output [31:0] out;
	
	wire [31:0] c;
	adder a0 (a[0], b[0], cin, out[0], c[0]);
	adder a1 (a[1], b[1], c[0], out[1], c[1]);
	adder a2 (a[2], b[2], c[1], out[2], c[2]);
	adder a3 (a[3], b[3], c[2], out[3], c[3]);
	adder a4 (a[4], b[4], c[3], out[4], c[4]);
	adder a5 (a[5], b[5], c[4], out[5], c[5]);
	adder a6 (a[6], b[6], c[5], out[6], c[6]);
	adder a7 (a[7], b[7], c[6], out[7], c[7]);
	adder a8 (a[8], b[8], c[7], out[8], c[8]);
	adder a9 (a[9], b[9], c[8], out[9], c[9]);
	adder a10 (a[10], b[10], c[9], out[10], c[10]);
	adder a11 (a[11], b[11], c[10], out[11], c[11]);
	adder a12 (a[12], b[12], c[11], out[12], c[12]);
	adder a13 (a[13], b[13], c[12], out[13], c[13]);
	adder a14 (a[14], b[14], c[13], out[14], c[14]);
	adder a15 (a[15], b[15], c[14], out[15], c[15]);
	adder a16 (a[16], b[16], c[15], out[16], c[16]);
	adder a17 (a[17], b[17], c[16], out[17], c[17]);
	adder a18 (a[18], b[18], c[17], out[18], c[18]);
	adder a19 (a[19], b[19], c[18], out[19], c[19]);
	adder a20 (a[20], b[20], c[19], out[20], c[20]);
	adder a21 (a[21], b[21], c[20], out[21], c[21]);
	adder a22 (a[22], b[22], c[21], out[22], c[22]);
	adder a23 (a[23], b[23], c[22], out[23], c[23]);
	adder a24 (a[24], b[24], c[23], out[24], c[24]);
	adder a25 (a[25], b[25], c[24], out[25], c[25]);
	adder a26 (a[26], b[26], c[25], out[26], c[26]);
	adder a27 (a[27], b[27], c[26], out[27], c[27]);
	adder a28 (a[28], b[28], c[27], out[28], c[28]);
	adder a29 (a[29], b[29], c[28], out[29], c[29]);
	adder a30 (a[30], b[30], c[29], out[30], c[30]);
	adder a31 (a[31], b[31], c[30], out[31], cout);

endmodule

module adder (a,b,cin,out,cout); //full single bit adder
	input a,b,cin;
	output cout, out;
	
	assign out = (a^b)^cin;
	assign cout = ((a^b)&cin)|(a&b);

endmodule


module shifter (a,b,l,r); //shift A to the left and right B times
	input [31:0] a,b;
	output [31:0] l,r;
	
	assign l = a <<< b;
	assign r = a >>> b;

endmodule


module muxALU (S,F,D0,D1,D2,D3,D4,D5,D6,D7); //8 to 1 mux
	input [2:0] S;
	input [31:0] D0,D1,D2,D3,D4,D5,D6,D7;
	output reg[31:0] F;
	
	always @(S,D0,D1,D2,D3,D4,D5,D6,D7) begin
	case (S)
		3'b000: F <= D0;
		3'b001: F <= D1;
		3'b010: F <= D2;
		3'b011: F <= D3;
		3'b100: F <= D4;
		3'b101: F <= D5;
		3'b110: F <= D6;
		3'b111: F <= D7;
		endcase
	end
endmodule