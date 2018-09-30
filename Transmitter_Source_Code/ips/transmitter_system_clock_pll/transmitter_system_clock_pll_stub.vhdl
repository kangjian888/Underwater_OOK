-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Sep 17 18:06:17 2018
-- Host        : DESKTOP-B3RT09T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/KANG
--               Jian/Desktop/Underwater_OOK/Transmitter_Source_Code/ips/transmitter_system_clock_pll/transmitter_system_clock_pll_stub.vhdl}
-- Design      : transmitter_system_clock_pll
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity transmitter_system_clock_pll is
  Port ( 
    sys_clk : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end transmitter_system_clock_pll;

architecture stub of transmitter_system_clock_pll is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sys_clk,reset,locked,clk_in1";
begin
end;
