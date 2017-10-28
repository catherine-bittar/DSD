vlog -work work C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/simulation/modelsim/g21_test-bed_sim.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.g21_test-bed_vlg_vec_tst
onerror {resume}
add wave {g21_test-bed_vlg_vec_tst/i1/CLK}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch1}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch1[1]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch1[0]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[5]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[4]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[3]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[2]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[1]}
add wave {g21_test-bed_vlg_vec_tst/i1/dipswitch2[0]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[6]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[5]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[4]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[3]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[2]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[1]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDfloor[0]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[6]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[5]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[4]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[3]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[2]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[1]}
add wave {g21_test-bed_vlg_vec_tst/i1/LEDmod[0]}
add wave {g21_test-bed_vlg_vec_tst/i1/pushButton}
run -all
