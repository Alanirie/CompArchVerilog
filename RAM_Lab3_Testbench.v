//elise heim
`timescale 1ns/1ps

module RAM_Lab3_Testbench();
    reg clk;
    reg rst;
    reg write_en;
    reg[10:0] addr;
    reg[31:0] data_in;

    wire[31:0] data_out;

	 // module RAM_Lab3(clk, writeEn, rst, dataIn, addr, dataOut);
    RAM_Lab3 ram(.clk(clk), .rst(rst), .addr(addr), .dataIn(data_in), .writeEn(write_en), .dataOut(data_out));

    always begin
        #5 clk <= ~clk;
    end

    initial begin
        clk <= 0;
        rst <= 1; #10 rst <= 0;
        // write to RAM
        write_en <= 1;
        addr <= {3'b100, 8'b0000_0101};
        data_in <= 5;

        // read from RAM
        #10 write_en <= 0;
        #15 $stop;
    end
endmodule