onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib transmitter_opt

do {wave.do}

view wave
view structure
view signals

do {transmitter.udo}

run -all

quit -force
