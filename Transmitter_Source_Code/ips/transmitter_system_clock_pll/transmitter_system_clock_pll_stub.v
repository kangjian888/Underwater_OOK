// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Sep 17 18:06:17 2018
// Host        : DESKTOP-B3RT09T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/KANG
//               Jian/Desktop/Underwater_OOK/Transmitter_Source_Code/ips/transmitter_system_clock_pll/transmitter_system_clock_pll_stub.v}
// Design      : transmitter_system_clock_pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module transmitter_system_clock_pll(sys_clk, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="sys_clk,reset,locked,clk_in1" */;
  output sys_clk;
  input reset;
  output locked;
  input clk_in1;
endmodule
