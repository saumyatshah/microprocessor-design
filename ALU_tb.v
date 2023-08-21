`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2023 11:26:00 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(

    );
     parameter cmd=4;
    parameter data=8;
    parameter sh=3;
    
    reg [cmd-1:0]FS;
    reg [data-1:0]A;
    reg [data-1:0]B;
    reg [data-1:0]inpport;
    reg [sh-1:0]shift;
    wire [data-1:0]out;
    wire N;
    wire Z;
    wire C;
    wire V;
    wire D;
ALU dut (FS,A,B,inpport,shift,out,N,Z,C,V,D);
integer opc;
initial begin
  A=8'h7A;
  B=8'h52;
  #20;
  
  for(opc=0;opc<10;opc=opc+1)
  begin
  FS=opc;
//  $display();
#50;
  end
  
end

endmodule
