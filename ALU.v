
//`define ALU_ADD 4'b0000
//`define ALU_SUB 4'b0001
//`define ALU_XOR 4'b0010
//`define ALU_AND 4'b0011
//`define ALU_OR  4'b0100
//`define ALU_JMP 4'b0101
//`define ALU_SHR 4'b0110
//`define ALU_SHL 4'b0111
//`define ALU_CMP 4'b1000
//`define ALU_CML 4'b1001
//`define ALU_MOV 4'b1010
//`define ALU_INC 4'b1011
//`define ALU_LD  4'b1100
`include "pro_macros.vh"


module ALU (
    FS,
    A,
    B,
    inpport,
    shift,
    out,
    N,
    Z,
    C,
    V, 
    D
    );
    
    parameter cmd=4;
    parameter data=8;
    parameter sh=3;
    
    input wire [cmd-1:0]FS;
    input wire [data-1:0]A;
    input wire [data-1:0]B;
    input wire [data-1:0]inpport;
    input wire [sh-1:0]shift;
    output reg [data-1:0]out;
    output reg N;
    output reg Z;
    output reg C;
    output reg V;
    output reg D;
    
    always@(*) begin
    case(FS) 
    `ALU_ADD: assign out=A+B;
    `ALU_SUB: assign out=A-B;
    `ALU_XOR: assign out=A^B;
    `ALU_AND: assign out=A&B;
    `ALU_OR:  assign out=A|B;
    `ALU_CMP: assign out=(A<B)?1:0;
    `ALU_SHL: assign out=A<<1;
    `ALU_CML: assign out=~A;
   // `ALU_ADI: assign out=A+inpport;
    
     default: assign out=0;
    endcase
    assign Z=(out==0)?1:0;
    assign N=(out<0)?1:0;
    assign V=((~A+1)&(~B+1)&((~A+1)+(~B+1)))?0:1;
    assign C=((A[7]==B[7])&(A[7]!=out[7]))?1:0;
    assign D=V^N;
    
    end
    

endmodule
