module ImmGen (I, out, S);
	input [31:0] I;
	input [1:0] S;
	output reg [31:0] out;
	
	wire [11:0] x1,x2;
	wire [12:0] x3;
	
	//imm for I type
	assign x1 = I[31:20];
	
	//imm for S type
	assign x2[11:5] = I[31:25];
	assign x2[4:0] = I[11:7];
	
	//imm for B type
	assign x3[12] = I[31];
	assign x3[10:5] = I[30:25];
	assign x3[4:1] = I[11:8];
	assign x3[11] = I[7];
	assign x3[0] = 1'b0;
	
	always @(S,x1,x2,x3,I) begin //3 to 1 mux
		case (S)
			2'b00: out[11:0] = x1;
			2'b01: out[11:0] = x2;
			2'b10: out[11:0] = x3[12:1];
		endcase
		
		if(I[11]==1) //appends 20 bits to front of imm
			out[31:12] = 20'b1;
		else
			out[31:12] = 20'b0;
	end
	
endmodule