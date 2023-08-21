`timescale 1ns / 1ps

`include "pro_macros.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 11:13:42 AM
// Design Name: 
// Module Name: insdec
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


module insdec(
    Instruction_in,
    DA,
    AA,
    BA,
    BS,
    PS,
    MW,
    RW,
    MA,
    MB,
    MD,
    FS,
    SH,
    CS,
    OE
    );
parameter ins_width= 17;
parameter add_width=3;
parameter fs_width=4;
parameter sh_width=2;

input wire [ins_width-1:0] Instruction_in;
output reg [add_width-1:0] DA;
output reg [add_width-1:0] AA;
output reg [add_width-1:0] BA;
output reg [sh_width-1:0] BS;
output reg PS;
output reg CS;
output reg OE;
output reg MW;
output reg [fs_width-1:0]FS;
output reg [sh_width-1:0]MD;
output reg MA;
output reg MB;
output reg RW;
output reg [sh_width-1:0] SH;

initial begin
CS=0;
PS=0;
end
always@(*) begin
DA=Instruction_in[11:9];
BA=Instruction_in[8:6];
AA=Instruction_in[5:3];
case(Instruction_in[16:12])


    `ADD: 
    begin
        FS=`ALU_ADD;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `SUB:
    begin
        FS=`ALU_SUB;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `XOR: 
    begin
        FS=`ALU_XOR;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `AND: 
    begin
        FS=`ALU_AND;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `ORI:  
    begin
        FS=`ALU_OR; 
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MB=1;
        MA=0;
        OE=0;
    end
    `JMP:
    begin
        RW=0;
        MW=0;
        BS=3;
        MB=1;
        CS=1;
        OE=0;
    end
    
    `CMP: 
    begin
        FS=`ALU_CMP;
        RW=1;
        MD=2;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    
    end
    
    `CML: 
    begin
        FS=`ALU_CML;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MA=0;
        OE=0;
    end
    `MOV: 
    begin
        FS=`ALU_MOV;
        RW=1;
        MD=0;
        MW=0;
        BS=0;
        MA=0;
        OE=0;
    end
    `ADI: 
    begin
        FS=`ALU_ADD;
        RW=1;
        CS=1;
        MD=0;
        MW=0;
        BS=0;
        MB=1;
        MA=0;
        OE=0;
    end
    `LD:
    begin
        RW=1;
        CS=1;
        MD=1;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `INP:
    begin
        RW=1;
        CS=0;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `XRI: 
    begin
        FS=`ALU_XOR;
        RW=1;
        CS=0;
        MD=0;
        MW=0;
        BS=0;
        MB=1;
        MA=0;
        OE=0;
    end
    `NOP:
    begin
        FS=`ALU_NOP;
        RW=0;
        CS=0;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    `BZ:
    begin
        RW=0;
        CS=1;
        MD=0;
        MW=0;
        BS=1;
        MB=1;
        MA=0;
        OE=0;
    end
    `BNZ:
    begin
        RW=0;
        CS=1;
        MD=0;
        MW=0;
        BS=1;
        PS=1;
        MB=1;
        MA=0;
        OE=0;
    end
    `SHL: 
    begin
        FS=`ALU_SHL;
        MD=0;
        MW=0;
        BS=0;
        MB=0;
        MA=0;
        OE=0;
    end
    default: FS=`NOP;
endcase
end

 
endmodule
