module tb(clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);

	output reg clk, reset, pcsrc, alusrc, mrw, wb, regrw;
	output reg [3:0] aluop;
	output reg [4:0] status;
	output reg [1:0] immgen_ctrl;
	
	Top DUT(clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);
	
	initial begin
	
		clk <= 0;
		reset <= 0;
		#5
		reset <= 1;
		#5
		reset <= 0;
		#5
		
		//add
		regrw <= 1;
		alusrc <= 1;
		mrw <= 1;
		wb <= 0;
		pcsrc <= 0;
		immgen_ctrl <= 2'b00;
		aluop <= 4'b0000;
		#5
		clk <= 1;
		#5
		clk <= 0;
	
	end
	
endmodule