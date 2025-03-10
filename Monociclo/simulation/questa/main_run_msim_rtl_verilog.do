transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/main.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/mux_regdst.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/mux_alusrc.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/mux_memtoreg.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/mux_branch.v}
vlog -vlog01compat -work work +incdir+C:/Users/thiag/Documents/Projeto\ 2\ -\ Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo {C:/Users/thiag/Documents/Projeto 2 - Arquitetura/PROJETO-2-VA---PROCESSADOR-MONOCICLO-VERILOG/Monociclo/i_mem.v}

