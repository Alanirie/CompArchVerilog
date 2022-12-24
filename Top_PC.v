module Top_PC(next, current, rst, CLK, RD, RS1, RS2, out);
	input rst, CLK;
	output [7:0] next, current;
	output[4:0] RD, RS1, RS2;
	output[31:0] out;
	wire [7:0] PC;
	wire [7:0] PC4;
	
	PC DUT(CLK, rst, PC4 ,PC);
	ADDR_by_4 HUT(PC, PC4);
	ROM JUT(PC, out);
	ID SUT(out, RD, RS1, RS2);
	
	assign current = PC;
	assign next = PC4;
endmodule


module ROM(ADDR, out);
	input [7:0] ADDR;
	output reg [31:0] out;


always @(ADDR) begin
case(ADDR)
	8'h00: out = 32'b0; 
	8'h04: out = 32'h00f00193; //addi x3, x0, 15
	8'h08: out = 32'h00700213; //addi x4, x0, 7
	8'h0c: out = 32'h004182b3; //add  x5, x3, x4
	8'h10: out = 32'h06502223; //sw   x5, 100(x0)
	8'h14: out = 32'h05d22183; //lw   x3, 93(x4)
	8'h18: out = 32'h00518863; //beq  x3, x5, 8
	8'h20: out = 32'h00200113; //addi x2, x0, 2
	8'h24: out = 32'h00221233; //sll  x4, x4, x2
	8'h28: out = 32'h00125213; //slri x4, x4, 1
default: out = 32'b0;
endcase
end
endmodule

module PC(clk, rst, PC4, PC);
	input [7:0]PC4;
	input rst, clk;
	output reg[7:0]PC;

always @(posedge clk) begin
	if(rst) begin
	PC = 8'd0;
	end
	else begin
	PC = PC4;
	end
end

endmodule 

module ID(instr, RD, RS1, RS2);
	input[31:0] instr;
	output [4:0] RD, RS1, RS2;

	assign RD = instr[11:7];
	assign RS1 = instr[19:15];
	assign RS2 = instr[24:20];
endmodule 

module ADDR_by_4(PC, PC4);
	input [7:0] PC;
	output [7:0] PC4;
	assign PC4 = PC + 8'd4;
endmodule