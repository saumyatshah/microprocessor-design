`timescale 1ns / 1ps
`include "pro_macros.vh"

module IDecoder_tb;

parameter ins_width= 17;
parameter add_width=3;
parameter fs_width=4;
parameter sh_width=2;

reg [ins_width-1:0] Instruction_in;
wire [add_width-1:0] DA;
wire [add_width-1:0] AA;
wire [add_width-1:0] BA;
wire [sh_width-1:0] BS;
wire PS;
wire CS;
wire OE;
wire MW;
wire [fs_width-1:0]FS;
wire [sh_width-1:0]MD;
wire MA;
wire MB;
wire RW;
wire [sh_width-1:0] SH;
integer ins;
insdec UUT(Instruction_in,DA,AA,BA,BS,PS,MW,RW,MA,MB,MD,FS,SH,CS,OE);

initial begin
    for (ins=1;ins<20;ins=ins+1)
        begin
        Instruction_in={ins,3'b011,3'b110,3'b101,3'b000};
        #50;
        $display("OPcode is  %b    \n DA is %b  \nAA is %b  \nBA is %b",Instruction_in[16:12],DA,AA,BA);
        end
    end



endmodule
