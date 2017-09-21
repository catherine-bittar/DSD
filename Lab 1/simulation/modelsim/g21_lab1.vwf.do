vlog -work work C:/Users/bitta/Documents/GitHub/DSD/Lab 1/simulation/modelsim/g21_lab1.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.g21_lab1_vlg_vec_tst
onerror {resume}
add wave {g21_lab1_vlg_vec_tst/i1/A}
add wave {g21_lab1_vlg_vec_tst/i1/A[6]}
add wave {g21_lab1_vlg_vec_tst/i1/A[5]}
add wave {g21_lab1_vlg_vec_tst/i1/A[4]}
add wave {g21_lab1_vlg_vec_tst/i1/A[3]}
add wave {g21_lab1_vlg_vec_tst/i1/A[2]}
add wave {g21_lab1_vlg_vec_tst/i1/A[1]}
add wave {g21_lab1_vlg_vec_tst/i1/A[0]}
add wave {g21_lab1_vlg_vec_tst/i1/B}
add wave {g21_lab1_vlg_vec_tst/i1/B[6]}
add wave {g21_lab1_vlg_vec_tst/i1/B[5]}
add wave {g21_lab1_vlg_vec_tst/i1/B[4]}
add wave {g21_lab1_vlg_vec_tst/i1/B[3]}
add wave {g21_lab1_vlg_vec_tst/i1/B[2]}
add wave {g21_lab1_vlg_vec_tst/i1/B[1]}
add wave {g21_lab1_vlg_vec_tst/i1/B[0]}
add wave {g21_lab1_vlg_vec_tst/i1/AeqB}
run -all
