module Top_PC(next, current, reset, clk, RD, RS1, RS2, IMM, out);
input reset;
input clk;
output [7:0] next, current;
output [4:0] RD, RS1, RS2;
output [11:0] IMM;
output [31:0] out;

wire [7:0] PC; // Current Address
wire [7:0] PC4; // Looks @ next address


PC DPC(PC4, PC, reset, clk);
ADDR_by_4 ADDR(PC, PC4);
ROM DROM(PC, out);
ID DID(out, RD, RS1, RS2, IMM);

assign current = PC;
assign next = PC4;


endmodule