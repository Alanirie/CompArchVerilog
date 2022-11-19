//Elise Heim

/*8 memory modules, one ram module */

module RAM_Lab3(clk, writeEn, rst, dataIn, addr, dataOut);
	input clk, writeEn, rst;
	input [31:0] dataIn;
	input [10:0] addr;
	output reg [31:0] dataOut;
 
	wire [7:0] enSel;
	wire[31:0] dataOuts [7:0];
	Decoder3to8 decoder(.sel(addr[10:8]), .one_hot(enSel));

	MemBlock mem0(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[0]), .dataIn(dataIn), .dataOut(dataOuts[0]));
	MemBlock mem1(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[1]), .dataIn(dataIn), .dataOut(dataOuts[1]));
	MemBlock mem2(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[2]), .dataIn(dataIn), .dataOut(dataOuts[2]));
	MemBlock mem3(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[3]), .dataIn(dataIn), .dataOut(dataOuts[3]));
	MemBlock mem4(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[4]), .dataIn(dataIn), .dataOut(dataOuts[4]));
	MemBlock mem5(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[5]), .dataIn(dataIn), .dataOut(dataOuts[5]));
	MemBlock mem6(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[6]), .dataIn(dataIn), .dataOut(dataOuts[6]));
	MemBlock mem7(.clk(clk), .rst(rst), .writeEn(writeEn), .addr(addr[7:0]), .enable(enSel[7]), .dataIn(dataIn), .dataOut(dataOuts[7]));
	
	always @(addr or writeEn or
	dataOuts[0] or dataOuts[1] or dataOuts[2] or dataOuts[3] or 
	dataOuts[4] or dataOuts[5] or dataOuts[6] or dataOuts[7]) begin
		dataOut <= dataOuts[addr[10:8]];
	end
	
endmodule

module Decoder3to8(input [2:0] sel, output reg [7:0] one_hot);
	always @(sel) begin	
		one_hot <= 8'b0000_0001 << sel;
	end
endmodule
 
module MemBlock(writeEn, enable, clk, rst, dataIn, addr, dataOut); 
	input writeEn, enable, clk, rst;
	input [7:0] addr;
	input [31:0] dataIn;
	
	output reg [31:0] dataOut;
	
	integer i;
	
	reg[7:0] Mem[255:0];
	
	always @(posedge clk) begin
		if (rst) begin  
			for(i=0; i < 32; i = i + 1)
				Mem[i] = 0;//inserted rst function here, some for loop action 
		end
	
		if (enable) begin
			if (writeEn && addr < 253) begin //for writing
				Mem[addr] <= dataIn[31:24];
				Mem[addr +1] <= dataIn[23:16];
				Mem[addr +2] <= dataIn[15:8];
				Mem[addr +3] <= dataIn[7:0];
			end
				
			else if (~writeEn) begin //for reading
				case (addr)
					255: dataOut <= {Mem[255], 24'b0};
					254: dataOut <= {Mem[254], Mem[255], 16'b0};
					253: dataOut <= {Mem[253], Mem[254], Mem[255], 8'b0};
					default: dataOut <= {Mem[addr], Mem[addr +1], Mem[addr +2], Mem[addr +3]};
				endcase 
			end
		end
	end
endmodule 