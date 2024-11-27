transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Components_package.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Zero_Check.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Temporary_Register_8bit.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Temporary_Register_3bit.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Temporary_Register.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/T1.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/SE9.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/SE6.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Register_File.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/PE.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/PC.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/op_code_finder.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/memory.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/decoder_for_Encoder.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/data_postfix.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/continue_flag_tracker.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/AND_Gate.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/ALU.vhd}
vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/data_path.vhd}

vcom -93 -work work {D:/IITB/Academics/Semester3/EE224/Project/Final/EE224_Course_Project/CPU/Testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
