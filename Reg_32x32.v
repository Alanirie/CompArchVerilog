module Reg_32x32(sa, sb, da, din, rst, en, clk, a, b, rw);
	input [31:0] din;
	input clk, rw, en, rst;
	input [4:0] da, sa, sb;
	output reg [31:0] a;
	output reg [31:0] b;
	integer i;
	reg [31:0] register[31:0];

always @(posedge clk) begin
	if(en) begin
		if(rst)
			for(i=0; i<=31; i= i+1)
				register[i] <= 32'b0;
		else if(rw)
			register[da] <= din;
		end
end

always @(en or sa or sb) begin
	if(en) begin
		a <= register[sa];
		b <= register[sb];
	
	end
end

endmodule