// =============================================================================
// Filename: clock_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:This is testbench of clock generation module of transmitter project
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module clock_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD_1 = 8;  // clock period: ns
localparam CLK_PERIOD_2 = 5;

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg sysclk_p;
reg sysclk_n;
reg gtrefclk_p;
reg gtrefclk_n;
reg g_reset;

wire sfp_mgt_clk_set0;
wire sfp_mgt_clk_set1;
wire sfp_mgt_clk0_p_out;
wire sfp_mgt_clk0_n_out;
wire dcm_locked;
wire drp_and_sys_clk;
// ----------------------------------
// Instantiate the tested module
// ----------------------------------
clock #(
	.SFP_MGT_CLK_SET0_P(1'b0),
	.SFP_MGT_CLK_SET1_P(1'b0)
	)
	clock_inst(
	.clk_system_p(sysclk_p),//system clock signal, 200Mhz
	.clk_system_n(sysclk_n),//system clock signal, 200Mhz
	.sfp_mgt_clk0_p_in(gtrefclk_p),//GTREFCLK source input 
	.sfp_mgt_clk0_n_in(gtrefclk_n),//GTREFCLK source input
	.sfp_mgt_clk_set0(sfp_mgt_clk_set0),
	.sfp_mgt_clk_set1(sfp_mgt_clk_set1),//these two bits decide source of GTREFCLK 
	.sfp_mgt_clk0_p_out(sfp_mgt_clk0_p_out),//GTREFCLK source output
	.sfp_mgt_clk0_n_out(sfp_mgt_clk0_n_out),//GTREFCLK source output
	.g_reset(g_reset),//globle reset signal
	.dcm_locked(dcm_locked),//asynchrounous signal
	.drp_and_sys_clk(drp_and_sys_clk)//60MHz		
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  gtrefclk_p = 1'b0;
  gtrefclk_n = 1'b1;
  forever #(CLK_PERIOD_1/2.0) 
  	begin
  		gtrefclk_p = ~gtrefclk_p;
  		gtrefclk_n = ~gtrefclk_n;
  	end
end

initial begin
  sysclk_p = 1'b0;
  sysclk_n = 1'b1;
  forever #(CLK_PERIOD_2/2.0) 
  	begin
  		sysclk_p = ~sysclk_p;
  		sysclk_n = ~sysclk_n;
  	end
end

// ----------------------------------
// Input stimulus
// Generate the ad-hoc stimulus
//This is an example
//initial begin
  // Reset
  //rst         = 1'b1;
  //start       = 1'b0;
  //dividend    = 32'd0;
  //divisor     = 32'd0;
  //#(2*CLK_PERIOD) rst = 1'b0;
  //end
// ----------------------------------

initial
	begin
	//Add Your Code
		g_reset = 1'b1;
		#243 //simulate the asynchrounous scenario
		g_reset = 1'b0;
	end
// ----------------------------------
// Output monitor
//This is an example
//always @(posedge clk) begin
  //if (done) begin
    //("%0d / %0d: quotient = %0d, remainder = //%0d", dividend, divisor,
      //quotient, remainder);
  //end
// ----------------------------------
//Add Your Code

endmodule