onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib transmitter_system_clock_pll_opt

do {wave.do}

view wave
view structure
view signals

do {transmitter_system_clock_pll.udo}

run -all

quit -force
