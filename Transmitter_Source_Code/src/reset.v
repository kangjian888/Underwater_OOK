// =============================================================================
// Filename: reset.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module is to generate reset signal for the tranmitter project
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
`define DLY #1 //Just useful in simulation environment

module reset(
	input clk,
	input gt0_txfsmresetdone,
	output gt0_tx_system_reset	
);

(*ASYNC_REG = "TRUE"*) reg gt0_txfsmresetdone_r;
(*ASYNC_REG = "TRUE"*) reg gt0_txfsmresetdone_r2;


always @(posedge clk or negedge gt0_txfsmresetdone)
    begin
        if (!gt0_txfsmresetdone)
        begin
            gt0_txfsmresetdone_r    <=   `DLY 1'b0;
            gt0_txfsmresetdone_r2   <=   `DLY 1'b0;
        end
        else
        begin
            gt0_txfsmresetdone_r    <=   `DLY gt0_txfsmresetdone;
            gt0_txfsmresetdone_r2   <=   `DLY gt0_txfsmresetdone_r;
        end
    end

assign gt0_tx_system_reset = !gt0_txfsmresetdone_r2;
endmodule