// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Sep 15 18:48:17 2018
// Host        : DESKTOP-B3RT09T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ transmitter_stub.v
// Design      : transmitter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "transmitter,gtwizard_v3_6_8,{protocol_file=Start_from_scratch}" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(soft_reset_tx_in, 
  dont_reset_on_data_error_in, q0_clk1_gtrefclk_pad_n_in, q0_clk1_gtrefclk_pad_p_in, 
  gt0_tx_fsm_reset_done_out, gt0_rx_fsm_reset_done_out, gt0_data_valid_in, 
  gt1_tx_fsm_reset_done_out, gt1_rx_fsm_reset_done_out, gt1_data_valid_in, 
  gt0_txusrclk_out, gt0_txusrclk2_out, gt1_txusrclk_out, gt1_txusrclk2_out, gt0_drpaddr_in, 
  gt0_drpdi_in, gt0_drpdo_out, gt0_drpen_in, gt0_drprdy_out, gt0_drpwe_in, 
  gt0_eyescanreset_in, gt0_eyescandataerror_out, gt0_eyescantrigger_in, 
  gt0_dmonitorout_out, gt0_gtrxreset_in, gt0_rxlpmreset_in, gt0_gttxreset_in, 
  gt0_txuserrdy_in, gt0_txdata_in, gt0_gtptxn_out, gt0_gtptxp_out, gt0_txdiffctrl_in, 
  gt0_txoutclkfabric_out, gt0_txoutclkpcs_out, gt0_txresetdone_out, gt1_drpaddr_in, 
  gt1_drpdi_in, gt1_drpdo_out, gt1_drpen_in, gt1_drprdy_out, gt1_drpwe_in, 
  gt1_eyescanreset_in, gt1_eyescandataerror_out, gt1_eyescantrigger_in, 
  gt1_dmonitorout_out, gt1_gtrxreset_in, gt1_rxlpmreset_in, gt1_gttxreset_in, 
  gt1_txuserrdy_in, gt1_txdata_in, gt1_gtptxn_out, gt1_gtptxp_out, gt1_txdiffctrl_in, 
  gt1_txoutclkfabric_out, gt1_txoutclkpcs_out, gt1_txresetdone_out, gt0_pll0outclk_out, 
  gt0_pll0outrefclk_out, gt0_pll0lock_out, gt0_pll0refclklost_out, gt0_pll1outclk_out, 
  gt0_pll1outrefclk_out, sysclk_in)
/* synthesis syn_black_box black_box_pad_pin="soft_reset_tx_in,dont_reset_on_data_error_in,q0_clk1_gtrefclk_pad_n_in,q0_clk1_gtrefclk_pad_p_in,gt0_tx_fsm_reset_done_out,gt0_rx_fsm_reset_done_out,gt0_data_valid_in,gt1_tx_fsm_reset_done_out,gt1_rx_fsm_reset_done_out,gt1_data_valid_in,gt0_txusrclk_out,gt0_txusrclk2_out,gt1_txusrclk_out,gt1_txusrclk2_out,gt0_drpaddr_in[8:0],gt0_drpdi_in[15:0],gt0_drpdo_out[15:0],gt0_drpen_in,gt0_drprdy_out,gt0_drpwe_in,gt0_eyescanreset_in,gt0_eyescandataerror_out,gt0_eyescantrigger_in,gt0_dmonitorout_out[14:0],gt0_gtrxreset_in,gt0_rxlpmreset_in,gt0_gttxreset_in,gt0_txuserrdy_in,gt0_txdata_in[15:0],gt0_gtptxn_out,gt0_gtptxp_out,gt0_txdiffctrl_in[3:0],gt0_txoutclkfabric_out,gt0_txoutclkpcs_out,gt0_txresetdone_out,gt1_drpaddr_in[8:0],gt1_drpdi_in[15:0],gt1_drpdo_out[15:0],gt1_drpen_in,gt1_drprdy_out,gt1_drpwe_in,gt1_eyescanreset_in,gt1_eyescandataerror_out,gt1_eyescantrigger_in,gt1_dmonitorout_out[14:0],gt1_gtrxreset_in,gt1_rxlpmreset_in,gt1_gttxreset_in,gt1_txuserrdy_in,gt1_txdata_in[15:0],gt1_gtptxn_out,gt1_gtptxp_out,gt1_txdiffctrl_in[3:0],gt1_txoutclkfabric_out,gt1_txoutclkpcs_out,gt1_txresetdone_out,gt0_pll0outclk_out,gt0_pll0outrefclk_out,gt0_pll0lock_out,gt0_pll0refclklost_out,gt0_pll1outclk_out,gt0_pll1outrefclk_out,sysclk_in" */;
  input soft_reset_tx_in;
  input dont_reset_on_data_error_in;
  input q0_clk1_gtrefclk_pad_n_in;
  input q0_clk1_gtrefclk_pad_p_in;
  output gt0_tx_fsm_reset_done_out;
  output gt0_rx_fsm_reset_done_out;
  input gt0_data_valid_in;
  output gt1_tx_fsm_reset_done_out;
  output gt1_rx_fsm_reset_done_out;
  input gt1_data_valid_in;
  output gt0_txusrclk_out;
  output gt0_txusrclk2_out;
  output gt1_txusrclk_out;
  output gt1_txusrclk2_out;
  input [8:0]gt0_drpaddr_in;
  input [15:0]gt0_drpdi_in;
  output [15:0]gt0_drpdo_out;
  input gt0_drpen_in;
  output gt0_drprdy_out;
  input gt0_drpwe_in;
  input gt0_eyescanreset_in;
  output gt0_eyescandataerror_out;
  input gt0_eyescantrigger_in;
  output [14:0]gt0_dmonitorout_out;
  input gt0_gtrxreset_in;
  input gt0_rxlpmreset_in;
  input gt0_gttxreset_in;
  input gt0_txuserrdy_in;
  input [15:0]gt0_txdata_in;
  output gt0_gtptxn_out;
  output gt0_gtptxp_out;
  input [3:0]gt0_txdiffctrl_in;
  output gt0_txoutclkfabric_out;
  output gt0_txoutclkpcs_out;
  output gt0_txresetdone_out;
  input [8:0]gt1_drpaddr_in;
  input [15:0]gt1_drpdi_in;
  output [15:0]gt1_drpdo_out;
  input gt1_drpen_in;
  output gt1_drprdy_out;
  input gt1_drpwe_in;
  input gt1_eyescanreset_in;
  output gt1_eyescandataerror_out;
  input gt1_eyescantrigger_in;
  output [14:0]gt1_dmonitorout_out;
  input gt1_gtrxreset_in;
  input gt1_rxlpmreset_in;
  input gt1_gttxreset_in;
  input gt1_txuserrdy_in;
  input [15:0]gt1_txdata_in;
  output gt1_gtptxn_out;
  output gt1_gtptxp_out;
  input [3:0]gt1_txdiffctrl_in;
  output gt1_txoutclkfabric_out;
  output gt1_txoutclkpcs_out;
  output gt1_txresetdone_out;
  output gt0_pll0outclk_out;
  output gt0_pll0outrefclk_out;
  output gt0_pll0lock_out;
  output gt0_pll0refclklost_out;
  output gt0_pll1outclk_out;
  output gt0_pll1outrefclk_out;
  input sysclk_in;
endmodule
