`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 12:09:58 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input [7:0] add,
    input [7:0] data_in,
    output reg [7:0] data_out,
    input wr
    );
    reg [7:0]mem[7:0];
    initial begin
    data_out=0;
    end
    always@(*)
    begin
    
        if(wr)begin
            mem[add]<=data_in;
        end
    if(wr==0) begin
    data_out<=mem[add];
    $monitor("address_in=%h,data_out=%d",add,data_out);
    end
    end
endmodule
