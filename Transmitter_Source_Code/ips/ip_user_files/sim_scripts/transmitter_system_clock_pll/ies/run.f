-makelib ies_lib/xil_defaultlib -sv \
  "F:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "F:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../transmitter_system_clock_pll/transmitter_system_clock_pll_clk_wiz.v" \
  "../../../../transmitter_system_clock_pll/transmitter_system_clock_pll.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

