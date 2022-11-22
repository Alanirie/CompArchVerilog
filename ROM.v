module ROM(ADDR, out);
//define I/O
input [7:0] ADDR;
output reg [31:0] out;
always @(ADDR) begin
	case(ADDR)
		8'h0: out = 32'h00000000;
		8'h4: out = 32'h00450693;
		8'h8: out = 32'h00100713;
		8'hc: out = 32'h00b76463;
		8'h10: out = 32'h0006a803;
		8'h14: out = 32'h00008067;
		8'h18: out = 32'h00068613;
		8'h1c: out = 32'h00070793;
		8'h20: out = 32'hffc62883;
		8'h24: out = 32'h01185a63;
		8'h28: out = 32'h01162023;
		8'h2c: out = 32'hfff78793;
		8'h30: out = 32'hffc60613;
		8'h34: out = 32'hfe0796e3;
		8'h38: out = 32'h00279793;
		8'h3c: out = 32'h00f50763;
		8'h40: out = 32'h0107a023;
		8'h44: out = 32'h00170713;
		8'h48: out = 32'h00468693;
		8'h4c: out = 32'hfc1ff06f;
	endcase
end

endmodule