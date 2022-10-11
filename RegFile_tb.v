`timescale 1ns / 1ps
module RegFile_tb;
 // Inputs
 reg [31:0] Data_in;
 reg [4:0] DR;
 reg [4:0] rs1;
 reg [4:0] rs2;
 reg RD;
 reg WR;
 reg rst;
 reg EN;
 reg clk;

 // Outputs
 wire [31:0] BusA;
 wire [31:0] BusB;

 // Instantiate the Unit Under Test (UUT)
 RegFile uut (.Data_in(Data_in), .DR(DR), .BusA(BusA), .rs1(rs1), .BusB(BusB), .rs2(rs2), .RD(RD), .WR(WR), .rst(rst), .EN(EN), .clk(clk));

 initial begin
  // Initialize Inputs
  Data_in  = 32'b0;
  DR  = 5'b0;
  rs1  = 5'b0;
  rs2  = 5'b0;
  RD  = 1'b0;
  WR  = 1'b0;
  rst  = 1'b1;
  EN  = 1'b0;
  clk  = 1'b0;
  // Wait 100 ns for global reset to finish
  #100;        
  // Add stimulus here
   rst  = 1'b0;
   EN  = 1'b1;
   #20;
   WR  = 1'b1;
   RD = 1'b0;
   Data_in  = 32'habcd_efab;
   DR  = 5'h0;
   #20;
   Data_in  = 32'h0123_4567;
   DR  = 5'h1;
   #20;
   WR  = 1'b0;
   RD     = 1'b1;
   rs1  = 5'h0;
   rs2  = 5'h1;
 end 

   always begin
  #10;
  clk = ~clk;
 end 
endmodule