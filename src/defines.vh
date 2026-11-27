`ifndef DEFINES_VH
`define DEFINES_VH

// OPCODE   (IR[15:12])

`define OP_NOP      4'h0

`define OP_ALU      4'h1    // extended subops

`define OP_MOV      4'h2
`define OP_LD       4'h3
`define OP_ST       4'h4

`define OP_LDI      4'h5
`define OP_ADDI     4'h6

`define OP_JZ       4'h7
`define OP_JNZ      4'h8
`define OP_JMP      4'h9

`define OP_EXT      4'h10   // extended subops

`define OP_HALT     4'h11
`define OP_OUT      4'h12

//  ALUCODE (OP_ALU SUBOPS)

`define ALU_ADD     4'h0
`define ALU_SUB     4'h1
`define ALU_AND     4'h2
`define ALU_OR      4'h3
`define ALU_XOR     4'h4
`define ALU_NOT     4'h5
`define ALU_SHL     4'h6
`define ALU_SHR     4'h7
`define ALU_CMP     4'h8

//  EXTCODE (OP_EXT SUBOPS)

`define EXT_PUSH    4'h0
`define EXT_POP     4'h1
`define EXT_GREAD   4'h2
`define EXT_GWRITE  4'h3

//  STATES  (state[2:0])

`define PROG        3'd0
`define PROG_WRITE  3'd1
`define FETCH_LO    3'd2
`define FETCH_HI    3'd3
`define EXECUTE     3'd4
`define MEM_CAP     3'd5
`define HALT        3'd6

//  FLAGS   (flags[3:0])

`define FLAG_Z      0
`define FLAG_N      1
`define FLAG_C      2
`define FLAG_V      3

`endif macro