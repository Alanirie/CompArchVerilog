module CU(status, inst, alusrc, rw, mrw, wb, pcsrc, imm_sel, alu_op, rst);
	input [31:0] inst;
	input [3:0] status;
	input rst;
	output reg alusrc, rw, mrw, wb, pcsrc;
	output reg [1:0] imm_sel;
	output reg [3:0] alu_op;

always @(inst or rst) begin
	if(rst ==0)
		case(inst [6:0])
		7'b0110011 : begin
			alusrc = 1'b0;
			rw = 1'b1;
			mrw = 1'b0;
			wb = 1'b0;
			pcsrc = 1'b0;
			imm_sel = 2'b00;
			alu_op = {inst[30], inst[14:12]}; // For R/I-Type
			end
			
			7'b0010011 : begin
			alusrc = 1'b0;
			rw = 1'b1;
			mrw = 1'b0;
			wb = 1'b0;
			pcsrc = 1'b0;
			imm_sel = 2'b00;
			alu_op = {inst[30], inst[14:12]}; // For R/I-Type		
			end
			
		7'b0000011 : begin
			alusrc = 1'b1;
			rw = 1'b1;
			mrw = 1'b0;
			wb = 1'b1;
			pcsrc = 1'b0;
			imm_sel = 2'b01;
			alu_op = 4'b0000;
			end
			
		7'b0100011 : begin
			alusrc = 1'b1;
			rw = 1'b1;
			mrw = 1'b0;
			wb = 1'b1;
			pcsrc = 1'b0;
			imm_sel = 2'b10;
			alu_op = 4'b0000;
			end
		
		7'b1100011 : begin // For Branch Instructions
			alusrc = 1'b0;
			rw = 1'b0;
			mrw = 1'b1;
			pcsrc = 1'b1;
			imm_sel = 2'b11;
			alu_op = 4'b1000;
			end
endcase

case (inst[14:12])
			3'b000 : begin
			pcsrc = status[0] ? 1'b1 : 1'b0;
			end
			3'b100 : begin
			pcsrc = status[1] ? 1'b1 : 1'b0;
			end
			endcase

case(inst[6:0])
			7'b0000000 : begin
			alusrc = 1'b0;
			rw = 1'b0;
			mrw = 1'b0;
			wb = 1'b0;
			imm_sel = 2'b0;
			alu_op = 4'b0000;
			end

endcase
end
endmodule