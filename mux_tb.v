`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 12:07:40 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
reg [1:0]sel;
reg [7:0]inp1;
reg [7:0]inp2;
reg [7:0]inp3;
reg [7:0]inp4;
wire [7:0]out1;
wire [7:0]out2;
wire [7:0]out3;
wire [7:0]out4;

mux muxs(sel,inp1,inp2,inp3,inp4,out1,out2,out3,out4);
    initial begin
        sel=2'b00;
        inp1=8'hdf;
        inp2=8'hac;
        inp3=8'h3c;
        inp4=8'h9b;
        
        #50;
    
        sel=2'b01;
        inp1=8'hdf;
        inp2=8'hac;
        inp3=8'h3c;
        inp4=8'h9b;
        #50;
    
        sel=2'b10;
        inp1=8'hdf;
        inp2=8'hac;
        inp3=8'h3c;
        inp4=8'h9b;
        #50;
    
        sel=2'b11;
        inp1=8'hdf;
        inp2=8'hac;
        inp3=8'h3c;
        inp4=8'h9b;
        
    end
    
endmodule
