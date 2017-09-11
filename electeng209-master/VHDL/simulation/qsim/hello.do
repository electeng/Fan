onerror {quit -f}
vlib work
vlog -work work hello.vo
vlog -work work hello.vt
vsim -novopt -c -t 1ps -L max7000ae_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Block2_vlg_vec_tst
vcd file -direction hello.msim.vcd
vcd add -internal Block2_vlg_vec_tst/*
vcd add -internal Block2_vlg_vec_tst/i1/*
add wave /*
run -all
