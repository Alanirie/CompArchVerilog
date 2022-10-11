module RegFile(Data_in, DR, rs1, rs2, RD, WR, BusA, BusB, rst, EN, clk);      
input  [31:0]  Data_in; 
input  [4:0]  DR, rs1, rs2; 
input  RD, WR; 
input  EN, clk, rst; 

output [31:0]  BusA, BusB; 
reg  [31:0]  BusA, BusB;       
reg [31:0]  regFile [31:0]; 
integer i; 
wire  sen; 
assign sen = clk || rst; 

always @ (posedge sen) 
begin 
 if (EN == 1) 
 begin 
  if (rst == 1) //If at reset 
   begin 
   for (i = 0; i < 16; i = i + 1) begin
    regFile [i] = 32'h0; 
   end 
   BusA = 32'hx; 
   end 
  else if (rst == 0) //If not at reset 
   begin 
   case ({RD,WR}) 
    2'b00:  begin 
     end 
    2'b01:  begin //If Write only 
     regFile [DR] = Data_in; 
     end 
    2'b10:  begin //If Read only 
     BusA = regFile [rs1]; 
     BusB = regFile [rs2]; 
     end 
    2'b11:  begin //If both active 
     BusA = regFile [rs1]; 
     BusB = regFile [rs2]; 
     regFile [DR] = Data_in; 
     end 
    default: begin //If undefined 
      end 
   endcase 
   end 
  else; 
 end 
 else; 
end 
endmodule