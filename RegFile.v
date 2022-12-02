module RegFile (Data_in, DR, rs1, rs2, clk, RW, BusA, BusB);

input[31:0] Data_in;
input[4:0] DR; // Designation Register
input[4:0] rs1; // Source register 1
input[4:0] rs2; // Source register 2
input clk; 
input RW; 
output[31:0] BusA;
reg [31:0] BusA;
output[31:0] BusB;
reg [31:0] BusB;
reg[31:0] mem[31:0];

always @(posedge clk) begin

	if(RW) begin
		case (DR)
		0:mem[0] <= Data_in;
		1:mem[1] <= Data_in;
		2:mem[2] <= Data_in;
		3:mem[3] <= Data_in;
		4:mem[4] <= Data_in;
		5:mem[5] <= Data_in;
		6:mem[6] <= Data_in;
		7:mem[7] <= Data_in;
		8:mem[8] <= Data_in;
		9:mem[9] <= Data_in;
		10:mem[10] <= Data_in;
		11:mem[11] <= Data_in;
		12:mem[12] <= Data_in;
		13:mem[13] <= Data_in;
		14:mem[14] <= Data_in;
		15:mem[15] <= Data_in;
		16:mem[16] <= Data_in;
		17:mem[17] <= Data_in;
		18:mem[18] <= Data_in;
		19:mem[19] <= Data_in;
		20:mem[20] <= Data_in;
		21:mem[21] <= Data_in;
		22:mem[22] <= Data_in;
		23:mem[23] <= Data_in;
		24:mem[24] <= Data_in;
		25:mem[25] <= Data_in;
		26:mem[26] <= Data_in;
		27:mem[27] <= Data_in;
		28:mem[28] <= Data_in;
		29:mem[29] <= Data_in;
		30:mem[30] <= Data_in;
		31:mem[31] <= Data_in;
		endcase

		case(rs1)
			0:BusA <= mem[0];
			1:BusA <= mem[1];
			2:BusA <= mem[2];
			3:BusA <= mem[3];
			4:BusA <= mem[4];
			5:BusA <= mem[5];
			6:BusA <= mem[6];
			7:BusA <= mem[7];
			8:BusA <= mem[8];
			9:BusA <= mem[9];
			10:BusA <= mem[10];
			11:BusA <= mem[11];
			12:BusA <= mem[12];
			13:BusA <= mem[13];
			14:BusA <= mem[14];
			15:BusA <= mem[15];
			16:BusA <= mem[16];
			17:BusA <= mem[17];
			18:BusA <= mem[18];
			19:BusA <= mem[19];
			20:BusA <= mem[20];
			21:BusA <= mem[21];
			22:BusA <= mem[22];
			23:BusA <= mem[23];
			24:BusA <= mem[24];
			25:BusA <= mem[25];
			26:BusA <= mem[26];
			27:BusA <= mem[27];
			28:BusA <= mem[28];
			29:BusA <= mem[29];
			30:BusA <= mem[30];
			31:BusA <= mem[31];
		endcase 

		case(rs2)
			0:BusB <= mem[0];
			1:BusB <= mem[1];
			2:BusB <= mem[2];
			3:BusB <= mem[3];
			4:BusB <= mem[4];
			5:BusB <= mem[5];
			6:BusB <= mem[6];
			7:BusB <= mem[7];
			8:BusB <= mem[8];
			9:BusB <= mem[9];
			10:BusB <= mem[10];
			11:BusB <= mem[11];
			12:BusB <= mem[12];
			13:BusB <= mem[13];
			14:BusB <= mem[14];
			15:BusB <= mem[15];
			16:BusB <= mem[16];
			17:BusB <= mem[17];
			18:BusB <= mem[18];
			19:BusB <= mem[19];
			20:BusB <= mem[20];
			21:BusB <= mem[21];
			22:BusB <= mem[22];
			23:BusB <= mem[23];
			24:BusB <= mem[24];
			25:BusB <= mem[25];
			26:BusB <= mem[26];
			27:BusB <= mem[27];
			28:BusB <= mem[28];
			29:BusB <= mem[29];
			30:BusB <= mem[30];
			31:BusB <= mem[31];
		endcase 
	end
end
endmodule