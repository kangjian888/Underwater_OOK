// =============================================================================
// Filename: top.v
// Author: 
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
`define DLY #1 //Only used in sumulation to make waveform better
//`define IMP //If the code is used to implement, the debounce module will be synthesized
`define SIM //If the code is used to simulate, the debounce module will not be synthesized
module top(
	input SYSCLK_P,
	input SYSCLK_N,
	input SFP_MGT_CLK0_P,
	input SFP_MGT_CLK0_N,
	input G_RST,
	input SEND_ENABLE,//using button to send a frame prbs data, the frame length can be defined by yourself.
	input [3:0] TXDIFFCTRL,//using SW to control ouput voltage of TX side
	output SFP_MGT_CLK_SET0,
	output SFP_MGT_CLK_SET1,
	output wire TXN_OUT,
	output wire TXP_OUT		
);
//Globol wire
wire tied_to_ground_i;
assign tied_to_ground_i = 1'b0;
wire tied_to_vcc_i;
assign tied_to_vcc_i = 1'b1; 

//Clock wire
wire sfp_mgt_clk0_p_i;
wire sfp_mgt_clk0_n_i;
wire dcm_locked;
wire drp_and_sys_clk;

//Reset wire
wire gt0_txfsmresetdone_i;
wire gt0_tx_system_reset_i;

//User clock
wire gt0_txusrclk_i;
wire gt0_txusrclk2_i;

 //DRP Ports
 wire    [8:0]   gt0_drpaddr_i;
 wire    [15:0]  gt0_drpdi_i;
 wire            gt0_drpen_i;
 wire            gt0_drpwe_i;

assign gt0_drpaddr_i = 0;
assign gt0_drpdi_i = 0;
assign gt0_drpen_i = 0;
assign gt0_drpwe_i = 0;


 //Transmit Ports - TX Configurable Driver Ports
 wire    [3:0]   gt0_txdiffctrl_i;
syn_block syn_block_0(
	.clk(gt0_txusrclk2_i),
	.enable(1'b1),
	.data_in(TXDIFFCTRL[0]),
	.data_out(gt0_txdiffctrl_i[0])
	);
syn_block syn_block_1(
	.clk(gt0_txusrclk2_i),
	.enable(1'b1),
	.data_in(TXDIFFCTRL[1]),
	.data_out(gt0_txdiffctrl_i[1])
	);
syn_block syn_block_2(
	.clk(gt0_txusrclk2_i),
	.enable(1'b1),
	.data_in(TXDIFFCTRL[2]),
	.data_out(gt0_txdiffctrl_i[2])
	);
syn_block syn_block_3(
	.clk(gt0_txusrclk2_i),
	.enable(1'b1),
	.data_in(TXDIFFCTRL[3]),
	.data_out(gt0_txdiffctrl_i[3])
	);
/*
 Value  Voltage(mV)
4'b0000 253
4'b0001 316
4'b0010 377
4'b0011 439
4'b0100 499
4'b0101 561
4'b0110 621
4'b0111 682
4'b1000 743
4'b1001 799
4'b1010 857
4'b1011 909
4'b1100 959
4'b1101 1002
4'b1110 1043
4'b1111 10748
*/
//Data Wire
wire [15:0] tx_data_i;

//Send Enable Button
wire send_enable_i;
`ifdef IMP
	debounce debounce_inst(
		.clk(gt0_txusrclk2_i),
		.key(SEND_ENABLE),//input key signal
		.key_pulse(send_enable_i)//generated pulse
			
	);
`endif

`ifdef SIM
	assign send_enable_i = SEND_ENABLE;
`endif


//Clock generation module
clock #(
	.SFP_MGT_CLK_SET0_P(0),
	.SFP_MGT_CLK_SET1_P(0)//These parameter could choose the GTREFCLK source
	)
	clock_inst(
	.clk_system_p(SYSCLK_P),//system clock signal, 200Mhz
	.clk_system_n(SYSCLK_N),//system clock signal, 200Mhz
	.sfp_mgt_clk0_p_in(SFP_MGT_CLK0_P),//GTREFCLK source input 
	.sfp_mgt_clk0_n_in(SFP_MGT_CLK0_N),//GTREFCLK source input
	.sfp_mgt_clk_set0(SFP_MGT_CLK_SET0),
	.sfp_mgt_clk_set1(SFP_MGT_CLK_SET1),//these two bits decide source of GTREFCLK 
	.sfp_mgt_clk0_p_out(sfp_mgt_clk0_p_i),//GTREFCLK source output
	.sfp_mgt_clk0_n_out(sfp_mgt_clk0_n_i),//GTREFCLK source output
	.g_reset(G_RST),//globle reset signal
	.dcm_locked(dcm_locked),//asynchrounous signal
	.drp_and_sys_clk(drp_and_sys_clk)//60MHz		
);

reset reset(
	.clk(gt0_txusrclk2_i),
	.gt0_txfsmresetdone(gt0_txfsmresetdone_i),
	.gt0_tx_system_reset(gt0_tx_system_reset_i)
	);

transmitter  transmitter_inst(
 .soft_reset_tx_in(tied_to_ground_i), // input wire soft_reset_tx_in
 .dont_reset_on_data_error_in(tied_to_ground_i), // set to 0, the FSM auto-resets when an error is detected
 .q0_clk1_gtrefclk_pad_n_in(sfp_mgt_clk0_n_i), // 
 .q0_clk1_gtrefclk_pad_p_in(sfp_mgt_clk0_p_i), // external differential clock input pin pair for the reference clock of 7 series FPGA transceiver Quad
 .gt0_tx_fsm_reset_done_out(gt0_txfsmresetdone_i), // output wire gt0_tx_fsm_reset_done_out
 .gt0_rx_fsm_reset_done_out(), // RX is not used in this module
 .gt0_data_valid_in(tied_to_ground_i), // No connection to inner part
 .gt0_txusrclk_out(gt0_txusrclk_i), // output wire gt0_txusrclk_out
 .gt0_txusrclk2_out(gt0_txusrclk2_i), // output wire gt0_txusrclk2_out
 //_________________________________________________________________________
 //GT0  (X0Y3)
 //____________________________CHANNEL PORTS________________________________
 //-------------------------- Channel - DRP Ports  --------------------------
 //DRP is not used in this application, the input is tied to ground and the output is floated
    .gt0_drpaddr_in                 (gt0_drpaddr_i), // input wire [8:0] gt0_drpaddr_in
    .gt0_drpdi_in                   (gt0_drpdi_i), // input wire [15:0] gt0_drpdi_in
    .gt0_drpdo_out                  (), // output wire [15:0] gt0_drpdo_out
    .gt0_drpen_in                   (gt0_drpen_i), // input wire gt0_drpen_in
    .gt0_drprdy_out                 (), // output wire gt0_drprdy_out
    .gt0_drpwe_in                   (gt0_drpwe_i), // input wire gt0_drpwe_in
//------------------- RX Initialization and Reset Ports --------------------
    .gt0_eyescanreset_in            (tied_to_ground_i), // input wire gt0_eyescanreset_in
//------------------------ RX Margin Analysis Ports ------------------------
    .gt0_eyescandataerror_out       (), // not used in this application
    .gt0_eyescantrigger_in          (tied_to_ground_i), // not used in this application
//---------- Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
    .gt0_dmonitorout_out            (), // not used in this application
//----------- Receive Ports - RX Initialization and Reset Ports ------------
    .gt0_gtrxreset_in               (tied_to_ground_i), // input wire gt0_gtrxreset_in
    .gt0_rxlpmreset_in              (tied_to_ground_i), // input wire gt0_rxlpmreset_in
//------------------- TX Initialization and Reset Ports --------------------
    .gt0_gttxreset_in               (tied_to_ground_i), // input wire gt0_gttxreset_in
    .gt0_txuserrdy_in               (tied_to_vcc_i), // input wire gt0_txuserrdy_in
//---------------- Transmit Ports - FPGA TX Interface Ports ----------------
    .gt0_txdata_in                  (tx_data_i), // input wire [15:0] gt0_txdata_in
//------------- Transmit Ports - TX Configurable Driver Ports --------------
    .gt0_gtptxn_out                 (TXN_OUT), // output wire gt0_gtptxn_out
    .gt0_gtptxp_out                 (TXP_OUT), // output wire gt0_gtptxp_out
    .gt0_txdiffctrl_in              (gt0_txdiffctrl_i), // input wire [3:0] gt0_txdiffctrl_in
//--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    .gt0_txoutclkfabric_out         (), // not used in this application
    .gt0_txoutclkpcs_out            (), // not used in this application
//----------- Transmit Ports - TX Initialization and Reset Ports -----------
    .gt0_txresetdone_out            (), // Do not have any reset signal in the transmitter

//____________________________COMMON PORTS________________________________
  	.gt0_pll0outclk_out(), // output wire gt0_pll0outclk_out
  	.gt0_pll0outrefclk_out(), // output wire gt0_pll0outrefclk_out
  	.gt0_pll0lock_out(), // output wire gt0_pll0lock_out
  	.gt0_pll0refclklost_out(), // output wire  gt0_pll0refclklost_out
  	.gt0_pll1outclk_out(), // output wire gt0_pll1outclk_out
  	.gt0_pll1outrefclk_out(), // output wire gt0_pll1outrefclk_out
  	.sysclk_in(drp_and_sys_clk) // input wire sysclk_in
);


//PRBS Generation Module
data_gen #(
	.PRBS_LENGTH(20)

)
data_gen_inst
(
	.clk(gt0_txusrclk2_i),
	.rst(gt0_tx_system_reset_i),
	.send_enable(send_enable_i), //begin to send a frame data
	.data_out(tx_data_i)
);
endmodule