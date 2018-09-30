onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+transmitter -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.transmitter xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {transmitter.udo}

run -all

endsim

quit -force
