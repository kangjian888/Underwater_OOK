// =============================================================================
// Filename: debounce_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module debounce_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 16;  // clock period: 16ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk;
reg key;
wire key_pulse;

// ----------------------------------
// Instantiate the tested module
// ----------------------------------
debounce debounce_inst(
	.clk(clk),
	.key(key),//input key signal
	.key_pulse(key_pulse)//generated pulse
		
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk = 1'b0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
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
	key  = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#60000000
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	#100
	key = 1'b1;
	#100
	key = 1'b0;
	$stop;
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