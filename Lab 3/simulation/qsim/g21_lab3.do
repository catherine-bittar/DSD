onerror {quit -f}
vlib work
vlog -work work g21_lab3.vo
vlog -work work g21_lab3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.g21_dealer_FSM_vlg_vec_tst
vcd file -direction g21_lab3.msim.vcd
vcd add -internal g21_dealer_FSM_vlg_vec_tst/*
vcd add -internal g21_dealer_FSM_vlg_vec_tst/i1/*
add wave /*
run -all
