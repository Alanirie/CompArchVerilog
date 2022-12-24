module tb();
	reg clk1, clk2, clk3, reset;
	wire [31:0] x0, x2, x3, x4, x5, C, I;
	wire [7:0] count;
	
	toplevel DUT(clk1, clk2, clk3, reset, x0, x2, x3, x4, x5, count, C, I);
	
	initial 
		clk1 = 1'b1;
	always begin 
		#3 clk1 = 1'b0;
		#3 clk1 = 1'b1;
	end
	
	always @(clk1) begin
		#1 clk2 = clk1;
		#1 clk3 = clk1;
	end
	
	initial begin
		reset = 1'b1;
		#6 reset = 1'b0;
	end
	
	initial begin
		#1000000000 $stop;
	end
	
endmodule