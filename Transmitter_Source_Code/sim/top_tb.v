// =============================================================================
// Filename: top_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description: This is a testbench of top module
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module top_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam REF_CLK_PERIOD = 8;  // clock period: 8ns
localparam SYSTEM_CLK_PERIOD = 5;//clock period: 5ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg ref_clk_p, ref_clk_n;
reg sysclk_p, sysclk_n;
reg g_rst;
reg send_enable;
reg [3:0] txdiffctrl = 4'b0000;

wire sfp_mgt_clk_set0;
wire sfp_mgt_clk_set1;

wire tx_p;
wire tx_n;
// ----------------------------------
// Instantiate the tested module
// ----------------------------------
top top_inst(
	.SYSCLK_P(sysclk_p),
	.SYSCLK_N(sysclk_n),
	.SFP_MGT_CLK0_P(ref_clk_p),
	.SFP_MGT_CLK0_N(ref_clk_n),
	.G_RST(g_rst),
	.SEND_ENABLE(send_enable),//using button to send a frame prbs data, the frame length can be defined by yourself.
	.TXDIFFCTRL(txdiffctrl),//using SW to control ouput voltage of TX side
	.SFP_MGT_CLK_SET0(sfp_mgt_clk_set0),
	.SFP_MGT_CLK_SET1(sfp_mgt_clk_set1),
	.TXN_OUT(tx_p),
	.TXP_OUT(tx_n)		
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  ref_clk_p <= 1'b0;
  ref_clk_n <= 1'b1;
  forever 
  	begin
  		#(REF_CLK_PERIOD/2.0) 
  		ref_clk_p <= ~ref_clk_p;
  		ref_clk_n <= ~ref_clk_n;
  	end
end

initial begin
  sysclk_p <= 1'b0;
  sysclk_n <= 1'b1;
  forever 
  	begin
  		#(SYSTEM_CLK_PERIOD/2.0)
  		sysclk_p <= ~sysclk_p;
  		sysclk_n <= ~sysclk_n;
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
		g_rst = 1'b1;
		#100
		g_rst = 1'b0;
	end

initial
	begin
		send_enable = 1'b0;
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