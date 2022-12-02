module RAM(clk, writeEn, rst, dataIn, addy, dataOut);
	input clk, writeEn, rst;
	input [31:0] dataIn;
	input [10:0] addy;
	 output reg [31:0] dataOut;
 
	MemBlock mem0(.clk(clk), .rst(rst), .writeEn(writeEn), .en(enSel),
	wire [7:0] enSel;
	decoder3to8(.sel(addy[10:8], .one_hot(enSel);

	
endmodule

module decoder3to8(input [3:0] sel, output reg [7:0] one_hot);
	always @(sel) begin
		one_hot <= 8`b0000_0001 << sel;
	end
endmodule
 
module MemBlock(writeEn, enable, clk, rst, dataIn, byteAddy, dataOut); 
	input WriteEn, enable, clk, rst;
	input [7:0] byteAddy;
	input [31:0] dataIn;
	
	output reg [31:0] dataOut;
	
	reg[7:0] Mem[255:0];
	
	always @(posedge clk) begin
		if (rst)
			//insert rst function here, some for loop action 
	;
	
		if (enable) begin
			if (writeEn && byteAddy < 253) begin //for writing
				Mem[byteAddy] <= dataIn[31:24];
				Mem[byteAddy +1] <= dataIn[23:16];
				Mem[byteAddy +2] <= dataIn[15:8];
				Mem[byteAddy +3] <= dataIn[7:0];
			end
				
			else if (~writeEn) begin //for reading
				case (byteAddy) begin
					255: dataOut <= {Mem[255], 24b`0};
					254: dataOut <= {Mem[254], Mem[255], 16b`0};
					253: dataOut <= {Mem[253], Mem[254], Mem[255], 8b`0};
					default: dataOut <= {Mem[byteAddy], Mem[byteAddy +1], byteAddy +2], byteAddy +3]};
				endcase 
			end
		end
	end
	

	
	
endmodule