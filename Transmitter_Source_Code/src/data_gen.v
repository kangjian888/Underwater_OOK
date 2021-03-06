// =============================================================================
// Filename: data_gen.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module will generate a signal pattern
//COMMA of the frame: 
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module data_gen #
(
	parameter PRBS_LENGTH = 8,//8*16bit
	parameter INV_PATTERN = 1,
	parameter POLY_LENGHT = 9,
	parameter POLY_TAP = 5//these parameter decide the PRBS PATTERN
)
(
	input clk,
	input rst,
	input send_enable, //begin to send a frame data
	output reg [15:0] data_out
);


//State definition
localparam
IDLE = 0,
SEND_COMMA = 1,
SEND_HEAD = 2,
SEND_PRBS = 3,
SEND_TAIL = 4;

reg [2:0] state_reg, state_next;
reg [4:0] counter_reg, counter_next;//the max length is 32
reg prbs_send_enable = 1'b0;
reg prbs_send_reset = 1'b1;
wire [15:0] prbs_data_wire;

//Outputs
always @ (*) 
     begin
          case (state_reg)
               IDLE:
                    begin
                        data_out = 16'd0;
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
               SEND_COMMA:
                    begin
                        data_out = 16'b0000_0001_0111_1100;//000000 + plus_comma
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
               SEND_HEAD:
                    begin
                        data_out = 16'b0101_0101_0101_0101;//define by myself
                        prbs_send_enable = 1'b1;//so in this next clock cycle there will be prbs generated from prbs_generation sub_module
                        prbs_send_reset = 1'b0;
                    end
               SEND_PRBS:
                    begin
                        data_out = prbs_data_wire;
                        if (counter_reg == PRBS_LENGTH - 1) 
                            begin
                                prbs_send_enable = 1'b0;
                                prbs_send_reset = 1'b1;
                            end
                        else 
                            begin
                                prbs_send_enable = 1'b1;
                                prbs_send_reset = 1'b0;
                            end
                    end
                SEND_TAIL:
                	begin
                		data_out = 16'b1010_1010_1010_1010;
                		prbs_send_enable = 1'b0;
                		prbs_send_reset = 1'b1;
                	end
               default:
                    begin
                        data_out = 16'd0;
                        prbs_send_enable = 1'b0;
                        prbs_send_reset = 1'b1;
                    end
          endcase
     end

//States
always @ (*)
     begin
     	state_next = state_reg;
     	counter_next = counter_reg;
        case (state_reg)
            IDLE:
                begin
                	if (send_enable) 
                	    begin
                	        state_next = SEND_COMMA;
                	    end
                	else 
                	    begin
                	        state_next = IDLE;
                	    end
                end
            SEND_COMMA:
                begin
                    state_next = SEND_HEAD;
                end
            SEND_HEAD:
                begin
                    state_next = SEND_PRBS;
                end
            SEND_PRBS:
            	begin
            		if (counter_reg == PRBS_LENGTH - 1) 
            		    begin
            		        counter_next = 4'd0;
            		        state_next = SEND_TAIL;
            		    end
            		else 
            		    begin
            		        counter_next = counter_reg + 1'b1;
            		        state_next = SEND_PRBS;
            		    end
            	end
            SEND_TAIL:
                begin
                    state_next = IDLE;
                end
            default:
                begin
                    state_next = IDLE;
                end
        endcase
     end

//Update state
always @ (posedge clk)
    begin
    	if (rst) 
    	    begin
    	        state_reg <= IDLE;
    	        counter_reg  <= 4'd0; 
    	    end
    	else 
    	    begin
    	        state_reg <= state_next;
    	        counter_reg <= counter_next;
    	    end
    end

//call PRBS generation module to generate
  PRBS_ANY #(
    .CHK_MODE(0),
    .INV_PATTERN(INV_PATTERN),
    .POLY_LENGHT(POLY_LENGHT),
    .POLY_TAP(POLY_TAP),
    .NBITS(16))
  PRBS_GENERATE(
    .RST(prbs_send_reset),
    .CLK(clk),//using general clock in this module
    .DATA_IN(16'b0),
    .EN(prbs_send_enable),
    .DATA_OUT(prbs_data_wire)
    );

endmodule