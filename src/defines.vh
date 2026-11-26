`ifndef DEFINES_VH
`define DEFINES_VH

// operation codes

`define OP_NOP
`define OP_ADD
`define OP_SUB
`define OP_ADI
`define OP_AND
`define OP_OR
`define OP_XOR
`define OP_SHL
`define OP_SHR
`define OP_LDI
`define OP_MOV
`define OP_COM
`define OP_LD
`define OP_ST
`define OP_IO

`define OP_Jcc //didy jump case

// flags

`define FLAG_Z // zero, updated by logic
`define FLAG_N // negative, also updated
`define FLAG_C // carry, 
`define FLAG_V //

// jump

`define CC_JMP
`define CC_JZ
`define CC_JNZ
`define CC_JC
`define CC_JNC
`define CC_JN
`define CC_JNN
`define CC_JV

`endif