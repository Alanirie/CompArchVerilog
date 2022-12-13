module Ram_256x32(addr, rw, clk, din, dout);
input [7:0] addr;
input [31:0] din;
input clk, rw;
output [31:0] dout;

wire [3:0] cs;
wire [31:0] RAM_OUT_1, RAM_OUT_2, RAM_OUT_3, RAM_OUT_4;

decoder2x4 dut(addr[7:6], cs);

RAMCell_64x8 aow(din[31:24], addr[5:0], cs[0], rw, clk, RAM_OUT_1[31:24]);
RAMCell_64x8 bow(din[23:16], addr[5:0], cs[0], rw, clk, RAM_OUT_1[23:16]);
RAMCell_64x8 cow(din[15:8], addr[5:0], cs[0], rw, clk, RAM_OUT_1[15:8]);
RAMCell_64x8 dow(din[7:0], addr[5:0], cs[0], rw, clk, RAM_OUT_1[7:0]);

RAMCell_64x8 eow(din[31:24], addr[5:0], cs[1], rw, clk, RAM_OUT_2[31:24]);
RAMCell_64x8 fow(din[23:16], addr[5:0], cs[1], rw, clk, RAM_OUT_2[23:16]);
RAMCell_64x8 gow(din[15:8], addr[5:0], cs[1], rw, clk, RAM_OUT_2[15:8]);
RAMCell_64x8 how(din[7:0], addr[5:0], cs[1], rw, clk, RAM_OUT_2[7:0]);

RAMCell_64x8 jow(din[31:24], addr[5:0], cs[2], rw, clk, RAM_OUT_3[31:24]);
RAMCell_64x8 iow(din[23:16], addr[5:0], cs[2], rw, clk, RAM_OUT_3[23:16]);
RAMCell_64x8 kow(din[15:8], addr[5:0], cs[2], rw, clk, RAM_OUT_3[15:8]);
RAMCell_64x8 low(din[7:0], addr[5:0], cs[2], rw, clk, RAM_OUT_3[7:0]);

RAMCell_64x8 mow(din[31:24], addr[5:0], cs[3], rw, clk, RAM_OUT_4[31:24]);
RAMCell_64x8 row(din[23:16], addr[5:0], cs[3], rw, clk, RAM_OUT_4[23:16]);
RAMCell_64x8 oow(din[15:8], addr[5:0], cs[3], rw, clk, RAM_OUT_4[15:8]);
RAMCell_64x8 pow(din[7:0], addr[5:0], cs[3], rw, clk, RAM_OUT_4[7:0]);

assign dout = cs[0]?RAM_OUT_1:32'bz;
assign dout = cs[1]?RAM_OUT_2:32'bz;
assign dout = cs[2]?RAM_OUT_3:32'bz;
assign dout = cs[3]?RAM_OUT_4:32'bz;


endmodule



module decoder2x4(select, out);
input [1:0] select;
output reg [3:0] out;

always @(select) begin
	case(select)
	2'b00 : out=4'b0001;
	2'b01 : out=4'b0010;
	2'b10 : out=4'b0100;
	2'b11 : out=4'b1000;
	default : out=4'b0001;
	endcase
end
endmodule

module RAMCell_64x8(din, addr, cs, rw, clk, RAM_OUT);
input [7:0] din;
input clk, rw, cs;
input [5:0] addr;
output reg[7:0] RAM_OUT;
reg [7:0] mem[5:0];
reg [7:0] mem_out;



always @(posedge clk) begin
    if(cs && rw)
        mem[addr] <= din;
end

always @(posedge clk) begin
	if(rw == 0)
	mem_out = mem[addr];
	RAM_OUT <= cs?mem_out:8'b0;
end

endmodule