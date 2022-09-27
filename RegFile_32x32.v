module RegFile_32x32;
//wire D,A,B; wire RegisterToMux0 - RegisterToMux31?

input [31:0]D;
output [31:0]A;
output [31:0]B;

wire[31:0] RegisterToMux0;
wire[31:0] RegisterToMux1;
wire[31:0] RegisterToMux2;
wire[31:0] RegisterToMux3;
wire[31:0] RegisterToMux4;
wire[31:0] RegisterToMux5;
wire[31:0] RegisterToMux6;
wire[31:0] RegisterToMux7;
wire[31:0] RegisterToMux8;
wire[31:0] RegisterToMux9;
wire[31:0] RegisterToMux10;
wire[31:0] RegisterToMux11;
wire[31:0] RegisterToMux12;
wire[31:0] RegisterToMux13;
wire[31:0] RegisterToMux14;
wire[31:0] RegisterToMux15;
wire[31:0] RegisterToMux16;
wire[31:0] RegisterToMux17;
wire[31:0] RegisterToMux18;
wire[31:0] RegisterToMux19;
wire[31:0] RegisterToMux20;
wire[31:0] RegisterToMux21;
wire[31:0] RegisterToMux22;
wire[31:0] RegisterToMux23;
wire[31:0] RegisterToMux24;
wire[31:0] RegisterToMux25;
wire[31:0] RegisterToMux26;
wire[31:0] RegisterToMux27;
wire[31:0] RegisterToMux28;
wire[31:0] RegisterToMux29;
wire[31:0] RegisterToMux30;
wire[31:0] RegisterToMux31;

wire[31:0] DecoderToReg;