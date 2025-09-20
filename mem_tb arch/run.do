#vlog list.svh
#vsim -novopt -suppress 12110 top -sv_seed 87121
#add wave -position insertpoint  sim:/dut/*
#run -all


vlog list.svh
#vopt work.top +cover=fcbest -o nwr_nrd
#vsim -coverage nwr_nrd
vsim -assertdebug -novopt -coverage -suppress 12110 top
#coverage save -onexit nwr_nrd.ucdb
#add wave -r sim:/dut/*
do exclusion.do
do wave.do
run -all
