`ifndef pro_macros_vh_
`define pro_macros_vh_

// Registers R0-R7 for register file
`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111
// FS opcodes for ALU
`define ALU_NOP 4'b0000
`define ALU_SUB 4'b0010
`define ALU_ADD 4'b0001
`define ALU_AND 4'b0011
`define ALU_OR 4'b0100
`define ALU_JMP 4'b0101
`define ALU_AIU 4'b0110
`define ALU_SHL 4'b0111
`define ALU_CMP 4'b1000
`define ALU_CML 4'b1001
`define ALU_MOV 4'b1010
`define ALU_ADI 4'b1011
`define ALU_LD  4'b1100
`define ALU_XOR 4'b1101
`define ALU_XRI 4'b1110
// OPCodes for Instruction decoder
`define NOP 5'b00000
`define SUB 5'b00010
`define ADD 5'b00001
`define AND 5'b00011
`define OR  5'b00100
`define JMP 5'b00101
`define ORI 5'b00110
`define STR 5'b00111
`define CMP 5'b01000
`define CML 5'b01001
`define MOV 5'b01010
`define ADI 5'b01011
`define LD  5'b01100
`define INP 5'b01101
`define XRI 5'b01110
`define XOR 5'b01111
`define BZ  5'b10000
`define BNZ 5'b10001
`define SHL 5'b10010
`define OUT 5'b10011


`define ins_width 17
`define add_width 3
`define fs_width 4
`define sh_width 2

`define idx_FS_L 3
`define idx_FS_M 6
`define idx_SH_L 1
`define idx_SH_M 2
`define idx_OE 0
`define idx_MW 7
`define idx_PS 8
`define idx_BS_1 9
`define idx_BS_M 10
`define idx_MD_L 11
`define idx_MD_M 12
`define idx_DA_L 13
`define idx_DA_M 15
`define idx_RW 16



`endif