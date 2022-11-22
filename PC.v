module PC(in, out, reset, clk);
	input [7:0] in;
input reset, clk; 
output reg [7:0] out;
always @(posedge clk)
begin
	if(reset)
		out = 8'h0;
	else
		out = in;
end
endmodule

