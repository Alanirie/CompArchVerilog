//Name of module
module RegFile
//All of the inputs/outputs
(input clk, input rst, input rw,input [4:0]rd, input [4:0]rs2, input [4:0]rs1,input [31:0]din, output reg [31:0]rs1v, output reg [31:0]rs2v);
 
 //Make the value of mem equal to a 32 bit reg
    reg [31:0]mem[0:31];
	 
//If read is true then then they read the values of rs1 & rs2 in the mem 
        if (rw) begin
            rs1v <= mem[rs1];
            rs2v <= mem[rs2];
        end
//If its write then the value of din is put into the rd mem
        else
            mem[rd] <= din;
    end
	 
	 //counter for the for loop 	 
    integer i;

//This clears the mem if rst is true
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 32; i = i + 1)
                mem[i] <= 0;
        end
endmodule