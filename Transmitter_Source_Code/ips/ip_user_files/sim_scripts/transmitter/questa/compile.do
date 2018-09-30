vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../transmitter/transmitter_common_reset.v" \
"../../../../transmitter/transmitter_common.v" \
"../../../../transmitter/transmitter_gt_usrclk_source.v" \
"../../../../transmitter/transmitter_support.v" \
"../../../../transmitter/transmitter_cpll_railing.v" \
"../../../../transmitter/transmitter/example_design/transmitter_tx_startup_fsm.v" \
"../../../../transmitter/transmitter/example_design/transmitter_rx_startup_fsm.v" \
"../../../../transmitter/transmitter_init.v" \
"../../../../transmitter/transmitter_gt.v" \
"../../../../transmitter/transmitter_multi_gt.v" \
"../../../../transmitter/transmitter/example_design/transmitter_sync_block.v" \
"../../../../transmitter/transmitter.v" \


vlog -work xil_defaultlib \
"glbl.v"

