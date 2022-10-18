module RegFile
(input clk, input rst, input r, 
 input [4:0]rd, input [4:0]rs2, input [4:0]rs1, 
 input [31:0]din, output reg [31:0]rs1v, 
 output reg [31:0]rs2v);
 
    reg [31:0]mem[0:31];

    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 32; i = i + 1)
                mem[i] <= 0;
        end
        if (r) begin
            rs1v <= mem[rs1];
            rs2v <= mem[rs2];
        end
        else
            mem[rd] <= din;
    end
endmodule