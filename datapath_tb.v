`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2023 02:04:47 PM
// Design Name: 
// Module Name: datapath_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath_tb;
reg clk;
reg rst;
//integer i;
//reg LE;
//wire [7:0]D_Out;
//wire [7:0]ADD_Out;
//reg [7:0]mem[16:0];
datapath mcu(clk,rst);

initial begin
    clk=1;
    forever #2 clk=~clk;
end


initial
begin



   rst =0;
        #10;
        rst =1;
        #10;
        rst =0;
        
        
      
end

endmodule
