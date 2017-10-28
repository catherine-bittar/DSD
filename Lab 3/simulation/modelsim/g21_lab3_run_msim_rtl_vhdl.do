transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/g21_pop_enable.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/g21_lab2_rom1.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/lpm_mux0.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/NOP_lpm_constant.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/INIT_lpm_constant.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/POP_lpm_constant.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/PUSH_lpm_constant.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/MODE_Select_lpm_mux.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/StackCounter_lpm_counter.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/a52_lpm_constant.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/SPG_lpm_counter.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/SPG_lpm_compare.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/g21_7_segment_decoder.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 3/lpm_constantdata.vhd}

