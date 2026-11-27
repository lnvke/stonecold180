/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

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

  `include defines.vh

  wire cpu_en;

  wire [15:0] program_word;

  wire [7:0] sram_lo_q;
  wire [7:0] sram_hi_q;
  wire [7:0] sram_lo_a;
  wire [7:0] sram_hi_a;
  wire [7:0] sram_lo_d;
  wire [7:0] sram_hi_d;
  
  reg sram_lo_cen;
  reg sram_hi_cen;
  reg sram_lo_gwen;
  reg sram_hi_gwen;

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
