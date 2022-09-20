module Decoder_5to32_tb;  
wire Reg_rs1, Reg_rs2; reg rd, rs1, rs2; reg en; 
// Instantiate the Decoder (named DUT {device under test}) 
Decoder_5to32 DUT(rd, rs1, rs2, Reg_rs1, Reg_rs2, en); 
initial begin 
$timeformat (-9, 1, " ns", 6); #1; 
   rd = 5'b00000; // time = 0 
	rs1 = 5'b00000;
	rs2 = 5'b00000;
	en = 1'b0; 
	#9; 
		en = 1'b1; // time = 10 
		#10; 
		rd = 5'b00000; 
		rs1 = 5'b00001; // time = 20 
		rs2 = 5'b00010;
		#10; 
		rd = 5'b00011;
		rs1 = 5'b01000;
		rs2 = 5'b01001; // time = 30 
		#10; 
		rd = 5'b00110;
		rs1 = 5'b00111;
		rs2 = 5'b01000; // time = 40 
		#5; en = 1'b0; // time = 45
		#5; end 
	always @(rd or rs1 or rs2 or en) 
	#1 $display("t=%t",$time,"en=%b",en,"rd=%b",rd,"rs1=%b",rs1, 
	"rs2=%b",rs2,
	"Reg_rs1=%b",Reg_rs1, 
	"Reg_rs2=%b", Reg_rs2); 
endmodule