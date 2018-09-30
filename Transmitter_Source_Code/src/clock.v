// =============================================================================
// Filename: clock.v
// Author: 
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module is used to manage all clock source in this project
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module clock#(
	parameter SFP_MGT_CLK_SET0_P = 0,
	parameter SFP_MGT_CLK_SET1_P = 0
	)
	(
	input clk_system_p,//system clock signal, 200Mhz
	input clk_system_n,//system clock signal, 200Mhz
	input sfp_mgt_clk0_p_in,//GTREFCLK source input 
	input sfp_mgt_clk0_n_in,//GTREFCLK source input
	output sfp_mgt_clk_set0,
	output sfp_mgt_clk_set1,//these two bits decide source of GTREFCLK 
	output sfp_mgt_clk0_p_out,//GTREFCLK source output
	output sfp_mgt_clk0_n_out,//GTREFCLK source output
	input g_reset,//globle reset signal
	output dcm_locked,//asynchrounous signal
	output drp_and_sys_clk//60MHz		
);

wire clk_system_in;
wire clk_system_bufg;
wire dcm_locked_init;
wire dcm_locked_sync;
wire pll_reset;

reg dcm_locked_edge = 1'b1;
reg dcm_locked_reg = 1'b1;

//GTREFCLK 
assign sfp_mgt_clk_set0 = SFP_MGT_CLK_SET0_P;
assign sfp_mgt_clk_set1 = SFP_MGT_CLK_SET1_P;//GTREFCLK source is from ICS844021, 0.45ps RMS jitter

assign sfp_mgt_clk0_n_out = sfp_mgt_clk0_n_in;
assign sfp_mgt_clk0_p_out = sfp_mgt_clk0_p_in;


//System Clock
IBUFGDS ibufgds_0(
	.O(clk_system_in),
	.I(clk_system_p),
	.IB(clk_system_n)
	);
BUFG bufg_0(
	.I(clk_system_in),
	.O(clk_system_bufg)
	);

syn_block syn_block_0(
 	.clk (clk_system_bufg),
    .enable(1'b1),
 	.data_in(dcm_locked_init),
 	.data_out(dcm_locked_sync)
 	);

//Detect falling edge of dcm_locked signal
always @ (posedge clk_system_bufg)
    begin
    	dcm_locked_reg <= dcm_locked_sync;
    	dcm_locked_edge <= dcm_locked_reg & !dcm_locked_sync;
    end
//Generate pll_reset signal
syn_block syn_block_1(
	.clk(clk_system_bufg),
	.enable(1'b1),
	.data_in(g_reset|dcm_locked_edge),
	.data_out(pll_reset)
	);
transmitter_system_clock_pll transmitter_system_clock_pll_inst(
  // Clock out ports
  .sys_clk(drp_and_sys_clk),     // output sys_clk
  // Status and control signals
  .reset(pll_reset), // input reset
  .locked(dcm_locked_init),       // output locked
 // Clock in ports
  .clk_in1(clk_system_bufg)
  );      // input clk_in1

assign dcm_locked = dcm_locked_init;
endmodule