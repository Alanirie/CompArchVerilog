module PC(in, out, reset, clk);
	input [7:0] in;
input reset, clk; 
output reg [7:0] out;
always @(posedge clk or posedge reset)
begin
	if(reset) begin
		out <= 8'd0;
	end
	else begin
		out <= in; // out + 4;
		end
	end
endmodule

