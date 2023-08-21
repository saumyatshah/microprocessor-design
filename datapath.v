`timescale 1ns / 1ps
`include "pro_macros.vh"
`include "prog_mem.v"
`include "Mux.v"
`include "Const_unit.v"
`include "Registers.v"
`include "insdec.v"
`include "ALU.v"
`include "data_mem.v"


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 02:07:45 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk,
    input rst);
    ////////////registers for fetch///////////////////
    reg [16:0]IR;
    reg [7:0]PC;
    reg [7:0]PC_1;
    ///////////registers for decode///////////////////
    
    reg [7:0]PC_2;
    reg PS;
    reg [3:0]FS;
    reg [1:0]SH;
    reg [1:0]BS;
    reg MW;
    reg [7:0]BUS_A;
    reg [7:0]BUS_B;
    reg RW;
    reg [2:0]DA;
    reg [1:0]MD;
    
    ///////////registers for execute////////////////////
    
    reg [7:0]RESULT_OUT;
    reg [7:0]DATA_OUT;
    reg [2:0]DA_ex;
    reg [1:0]MD_ex;
    reg RW_ex;    
    reg [2:0]DA_dec;   
    
    
    
    
    /////////////////////wires////////////////////////////
    wire [16:0]instruc;
    wire [7:0]PC_wire;
    wire [7:0]PC_1_w;
    wire [7:0]addr;
    wire [5:0]immediate;
    wire [3:0]w_FS;
    wire [1:0]w_BS;
    wire [1:0]w_SH;
    wire [2:0]AA;
    wire [2:0]BA;
    wire [2:0]w_DA;
    wire [2:0]DA_ex_w;
    wire [7:0]PC_2_w;
    wire PS_w;
    wire MA;
    wire MB;
    wire CS;
    wire w_RW;
    wire w_MW;
    wire RW_wb_w;
    wire RW_ex_w;
    wire OE;
    wire [1:0]MD_ex_w;
    reg [1:0]MD_dec;
    wire [17:0]w_IR;
    wire [17:0]IR_b;
    
    wire [7:0]ext_immediate;
    wire [7:0]Data_A;
    wire [7:0]Data_B;
    wire N;
    wire Z;
    wire C;
    wire V;
    wire D_BIT;
    wire [7:0]I;
    wire [7:0]F_RESULT_OUT;
    wire [7:0]F_R_OUT;
    wire B_Detect;
    wire DHS;
    wire [7:0]BrA;
    wire [7:0]Cout;
    wire [7:0]PC_1_MUXA;
    wire [7:0]PC_ID;
    wire [7:0]MemD_OUT;
    wire [7:0]BUS_D;
    wire MW_dh;
    wire RW_dh;
    reg RW_dec;
    wire [2:0]DA_dh;
    wire [1:0]BS_dh;
    wire [2:0]RAA;
    wire [1:0]w_MD;
    wire [7:0]BUSA;
    wire [7:0]BUSB;
    wire [7:0]Data_in;
    wire sel0,sel1;
    wire compA;
    wire compB;
    wire daor;
    wire hA,hB;
    assign sel0 = (((PS^Z)  ||  w_BS[1])  &&  w_BS[0]);
    assign sel1 = w_BS[1];
    assign compA = ((DA_ex_w==AA)?1'b1:1'b0);
    assign compB = ((DA_ex_w==BA)?1'b1:1'b0);
    assign daor = (DA_ex_w[0]||DA_ex_w[1]||DA_ex_w[2]);
    assign hB = (compB&(~MB)&&RW_ex_w&&daor);
    assign hA = (compA&(~MA)&&RW_ex_w&&daor);
    
    
    
    
    assign addr = PC;
    assign PC_wire = PC;
    assign PC_1_w = PC_wire +7'b1;
    prog_mem pm(addr,w_IR);
    
    assign PC_2_w = PC_1;
    assign immediate = IR[5:0];
    assign w_SH = IR[1:0];
    assign instruc = IR;
    assign PC_1_w = PC_1;
    assign RW_wb = RW_ex;
    
    assign MW_dh = DHS & w_MW & B_Detect;
    assign MW_dh = DHS & w_RW & B_Detect;
    
    assign DA_dh = w_DA & {3{DHS}};
    assign BS_dh = w_BS & {2{DHS}};
    
    assign B_Detect = ~(sel0|sel1);
    assign DHS = ~(hA||hB);
    
    assign IR_b = w_IR & {17{B_Detect}};
    
     
    Const_unit cu(CS,immediate,ext_immediate);
    
    insdec id(instruc,w_DA,AA,BA,w_BS,PS_w,MW_w,w_RW,MA,MB,MD_w,FS_w,w_SH,CS,OE);
    Register regist(AA,BA,w_DA,Data_in,RW_wb,clk,rst,Data_A,Data_B);
    mux2x1 MUXA(MA,PC_1_w,Data_A,BUSA);
    mux2x1 MUXB(MB,ext_immediate,Data_B,BUSB);
    
    
    
    wire [7:0]in_b;
    
    assign PC_2_w = PC_2;
    assign RW_ex_w = RW_dec;
    assign DA_ex_w = DA_dec;
    assign MD_ex_w = MD_dec;
    assign BS_ex = BS;
    assign PS_w = PS;
    assign MW_ex = MW;
    assign FS_ex = FS;
    assign SH_ex = SH;
    assign RAA = BUS_A;
    assign in_b = BUS_B;
    
    assign BrA = PC_2_w + in_b;
    ALU fu(FS_w,RAA,in_b,I,SH_ex,F_RESULT_OUT,N,Z,C,V,D_BIT); 
    
    data_mem dm(RAA,in_b,MemD_OUT ,MW_ex);
    
    
    mux4x1 MUXC({sel0,sel1},PC_w,BrA,BrA,BUSA,Cout);
    
    mux3x1 MUXD(MD,F_RESULT_OUT,MemD_OUT,{7'b0,D_BIT},BUS_D);
    
    
always @(posedge clk or negedge rst)
    begin
    if(!rst)
    begin
        if(DHS == 0 | B_Detect == 0)
        begin
            PC_1 <= PC_1;
            IR <= IR;
        end
    else 
    begin
        PC_1 <= PC_1_w;
        IR <= IR_b;
    end
    end
    else
    begin
        PC_1 <= 8'b0;
        IR <= 17'b0;
    end
end


always @(posedge clk  or negedge rst)
begin
if(!rst)
begin
if(DHS == 0)
begin
PC_2 <= PC_2;
BS <= BS_dh;
PS <= PS_w;
MW <= MW_dh;
FS <= w_FS;
SH <= w_SH;
BUS_A <= BUSA;
BUS_B <= BUSB;
RW_dec <= RW_dh;
DA_dec <= DA_dh;
MD_dec <= w_MD;
end
else
begin
PC_2 <= PC_2_w;
BS <= BS_dh;
PS <= PS_w;
MW <= MW_dh;
FS <= w_FS;
SH <= w_SH;
BUS_A <= BUSA;
BUS_B <= BUSB;
RW_dec <= RW_dh;
DA_dec <= DA_dh;
MD_dec <= w_MD;
end
end
else
begin
PC_2 <= 8'b0;
BS <= 2'b0;
PS <= 1'b0;
MW <= 1'b0;
FS <= 4'b0;
SH <= 3'b0;
BUS_A <= 8'b0;
BUS_B <= 8'b0;
RW_dec <= 1'b0;
DA_dec <= 3'b0;
MD_dec <= 2'b0;
end
end
    
always @(posedge clk  or negedge rst)
begin
if(!rst)
begin
RW_ex <= RW_ex;
DA_ex <= DA_ex;
MD_ex <= MD_ex;
RESULT_OUT <= F_RESULT_OUT;
DATA_OUT <= MemD_OUT;
end
else
begin
RW_ex <= 1'b0;
DA_ex <= 3'b0;
MD_ex <= 2'b0;
RESULT_OUT <= 8'b0;
DATA_OUT <= 8'b0;
end
end

// write back stage 
always @(posedge clk  or negedge rst)
begin
    if(!rst)
    begin
        if(DHS == 0)
        
            PC <= PC;
        
        else
        
            PC <= Cout;
        
    end
    else
    begin
        PC <= 8'b0;
    end
    end
 
    
endmodule



