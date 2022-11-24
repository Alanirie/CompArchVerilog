module tb(next, current, reset, clk, RD, RS1, RS2, IMM, out);
output reg clk;
output reg reset;
output [7:0] next, current;
output [31:0] out;
output [4:0] RD, RS1, RS2;
output [11:0] IMM;
integer i;

Top_PC DUT(next, current, reset, clk, RD, RS1, RS2, IMM, out);

initial begin
	reset <= 1;
	#5
	reset <= 0;
	for(i=0; i <= 20; i = i + 1) begin
		clk <= 0;
		#5
		clk <= 1;
		#5;
	end

end

endmodule
