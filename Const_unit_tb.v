`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2023 01:07:15 PM
// Design Name: 
// Module Name: Const_unit_tb
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


module Const_unit_tb;
reg CS;
reg [5:0]Immediate;
wire [7:0]ext_immediate;

Const_unit UUT(CS,Immediate,ext_immediate);
initial begin
CS=0;
Immediate=6'b010110;
#50;
$display("Value is %b  and extended immediate %b",Immediate,ext_immediate);
CS=1;
Immediate=6'b110011;
#50;
$display("Value is %b  amd extended immediate %b",Immediate,ext_immediate);
CS=1;
Immediate=6'b010011;
#50;
$display("Value is %b  amd extended immediate %b",Immediate,ext_immediate);

end
endmodule
