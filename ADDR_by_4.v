module ADDR_by_4(in, out); // separate increment block
input [7:0] in;
output [7:0] out;
assign out = in + 8'd4;
endmodule