module RegFile_tb();

reg[31:0] Data_in;
reg[4:0] DR; // Designation Register
reg[4:0] rs1; // Source register 1
reg[4:0] rs2; // Source register 2
reg clk;
reg RW;
wire[31:0] BusA; 
wire[31:0] BusB; 

RegFile dut (Data_in, DR, rs1, rs2, clk, RW, BusA, BusB);

always begin
	#10 clk =~ clk;
	end
	
initial begin

	RW=1;
	clk=0;
	#10 Data_in <= 12;
	#10 DR <= 14;
	#10 Data_in <= 42;
	#10 DR <= 17;
	#10 Data_in <= 19;
	#10 DR <= 27;
	#10 rs1 <= 27;
	rs2 <= 27;
	#10 rs1 <= 17;
	#10 rs2 <= 14;
	#100 $stop;
end
endmodule