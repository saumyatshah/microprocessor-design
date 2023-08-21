`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 01:09:33 AM
// Design Name: 
// Module Name: Const_unit
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


module Const_unit(
    input CS,
    input [5:0]immediate,
    output reg [7:0]ext_immediate
    );
    
    always@(*)
    begin
    if(1==CS)
    begin
        if(1==immediate[5])
        ext_immediate={2'b11,immediate};
        else
        ext_immediate={8{1'b0}}|{2'b00,immediate};
    end
    else
        ext_immediate={2'b00,immediate};
    
    end
endmodule
