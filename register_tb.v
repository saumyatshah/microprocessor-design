`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 02:34:47 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb;
reg [2:0]AA;
reg [2:0]BA;
reg [2:0]DA;
reg [7:0]Data_in;
reg clk;
reg rst;
reg WR;
wire [7:0]Data_A;
wire [7:0]Data_B;
integer add;
Register UUT(AA,BA,DA,Data_in,WR,clk,rst,Data_A,Data_B);
initial begin
    AA=0;
    BA=0;
    rst=0;
    WR=1;
    for(add=1;add<8;add=add+1)
    begin
        DA=add;
        Data_in=add+10;
        #10;
    end
    
    WR=0;
    for(add=1;add<8;add=add+1)
    begin
        AA=add;
        BA=0;
        #10;
        
    end
    for(add=7;add>=1;add=add-1)
    begin
        BA=add;
        AA=0;
        #10;
        
    end
    
    rst=1;
end
initial begin
    clk=1;
    forever #5 clk=~clk;
end

endmodule
