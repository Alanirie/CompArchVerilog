`timescale 1ns/1ps

module RegFile_tb();
    reg [31:0] din;
    reg [4:0] rs1, rs2, rd;
    reg r, clk, rst;
    wire [31:0] a, b;

    RegFile rf(.clk(clk), .rst(rst), .r(r), .rs1(rs1), .rs2(rs2), .din(din), .rd(rd), .rs1v(a), .rs2v(b));

    always begin
        #5 clk <= ~clk;
    end

    initial begin
        clk <= 0;
        rst <= 1; #5; rst <= 0; // reset
        
        // write 1
        #15 r<=0;
        din <= 150;
        rd <= 5;
        // write 2
        #15 r<=0;
        din <= 300;
        rd <= 10;
        // read 1
        #15 r<=1;
        rs1 <= 5;
        rs2 <= 10;
        // write 3
        #15 r<=0;
        din <= 53;
        rd <= 25;
        // read 2
        #15 r<=1;
        rs1 <= 10;
        rs2 <= 25;
        // read 3
        #15;
        rs1 <= 25;
        rs2 <= 5;
        #15 $stop;
    end
endmodule 