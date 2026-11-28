/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`include "defines.vh"

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path                                  bidirectional
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output) bidirectional
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

reg [7:0]  regfile [0:7];
reg [15:0] ir;
reg [7:0]  pc;
reg [7:0]  sp;
reg [6:0]  write_pointer;
reg        byte_sel;
reg [2:0]  state;
reg [3:0]  flags;
reg [7:0]  gpio_out;
reg [7:0]  gpio_uio_out;
reg [7:0]  gpio_uio_oe;

assign uo_out  = gpio_out;
assign uio_out = gpio_uio_out;
assign uio_oe  = gpio_uio_oe;\

wire [3:0] opcode  = ir[15:12];
wire [3:0] a_field = ir[11:8];
wire [3:0] b_field = ir[7:4];
wire [3:0] c_field = ir[3:0];

wire is_ld    = (opcode == `OP_LD);
wire is_st    = (opcode == `OP_ST);
wire is_halt  = (opcode == `OP_HALT);
wire is_ext   = (opcode == `OP_EXT);
wire is_jz    = (opcode == `OP_JZ);
wire is_jnz   = (opcode == `OP_JNZ);
wire is_jmp   = (opcode == `OP_JMP);
wire is_alu   = (opcode == `OP_ALU);
wire is_addi  = (opcode == `OP_ADDI);

wire is_push  = is_ext && (c_field == `EXT_PUSH);
wire is_pop   = is_ext && (c_field == `EXT_POP);
wire is_gread = is_ext && (c_field == `EXT_GREAD);
wire is_gwrite= is_ext && (c_field == `EXT_GWRITE);

wire branch_taken = is_jmp
                 || (is_jz  &&  flags[`FLAG_Z])
                 || (is_jnz && !flags[`FLAG_Z]);

wire prefetch_ok = !is_ld && !is_st && !is_halt && !is_push && !is_pop && !branch_taken;

wire [7:0] mem_addr =
      is_push    ? sp
    : is_pop     ? (sp + 8'd1)
    : a_field[3] ? reg_b
    :              {b_field, c_field};

wire [7:0] reg_a = regfile[ir[10:8]];
wire [7:0] reg_b = regfile[ir[6:4]];

reg [7:0] reg_wdata;
reg [2:0] reg_waddr;
reg       reg_we;

endmodule
