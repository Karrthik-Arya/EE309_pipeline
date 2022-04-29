transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/ins_decoder.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/regs.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/pc.vhdl}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/mem.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/ir.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/DUT.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/alu.vhd}
vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/pipe_reg.vhdl}

vcom -93 -work work {/home/winston/Documents/Acads/sem_2/EE309/EE309_pipeline/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
