transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 2/g21_RANDU.vhd}
vcom -93 -work work {C:/Users/kevin/Desktop/McGill Work/F2017/ECSE 323/DSD/Lab 2/add_sub.vhd}

