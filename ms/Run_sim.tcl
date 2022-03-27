set SRC     "vlog -O0 +acc ../rtl"
set BHV		"vlog -O0 +acc ../bhv"
set SVA		"vlog -O0 +acc ../sva"
set TB		"vlog -O0 +acc ../example_tb/core"
set FP		"vlog -O0 +acc ../fpnew-develop/src"
set PRF		"vlog -O0 +acc ../example_tb/fpga_sys/source"
set VIVpr   "vlog -O0 +acc ../example_tb/fpga_sys/VIVpr"
set QUApr   "vlog -O0 +acc ../example_tb/fpga_sys/qua_pr"

alias c "


#Core source 
	$SRC/include/cv32e40p_apu_core_pkg.sv
	$SRC/include/cv32e40p_fpu_pkg.sv
	$SRC/include/cv32e40p_pkg.sv

	
	$SRC/cv32e40p_core.sv
		$SRC/cv32e40p_sleep_unit.sv
			$BHV/cv32e40p_sim_clock_gate.sv
		$SRC/cv32e40p_if_stage.sv
			$SRC/cv32e40p_prefetch_buffer.sv
				$SRC/cv32e40p_prefetch_controller.sv
				$SRC/cv32e40p_prefetch_buffer.sv
				$SRC/cv32e40p_fifo.sv
			$SRC/cv32e40p_aligner.sv
			$SRC/cv32e40p_compressed_decoder.sv
		$SRC/cv32e40p_id_stage.sv
			$SRC/cv32e40p_register_file_ff.sv
			$SRC/cv32e40p_decoder.sv
			$SRC/cv32e40p_controller.sv
			$SRC/cv32e40p_int_controller.sv
			$SRC/cv32e40p_hwloop_regs.sv
		$SRC/cv32e40p_ex_stage.sv
			$SRC/cv32e40p_alu.sv
				$SRC/cv32e40p_popcnt.sv
				$SRC/cv32e40p_ff_one.sv
				$SRC/cv32e40p_alu_div.sv
			$SRC/cv32e40p_mult.sv
			$SRC/cv32e40p_apu_disp.sv
		$SRC/cv32e40p_load_store_unit.sv
			$SRC/cv32e40p_obi_interface.sv
		$SRC/cv32e40p_cs_registers.sv
		#$SRC/cv32e40p_pmp.sv

#tb source 
	$TB/include/perturbation_pkg.sv
	$FP/fpnew_pkg.sv
	$BHV/include/cv32e40p_tracer_pkg.sv

	$TB/tb_top.sv
		$TB/cv32e40p_tb_subsystem.sv
			#$BHV/cv32e40p_core_log.sv 
			$SVA/cv32e40p_prefetch_controller_sva.sv
			#$BHV/cv32e40p_apu_tracer.sv
			#$BHV/cv32e40p_tracer.sv
			$BHV/cv32e40p_wrapper.sv +incdir+../bhv +incdir+../sva
			
			$TB/cv32e40p_fp_wrapper.sv
			$TB/mm_ram.sv
				$TB/amo_shim.sv
				$TB/dp_ram.sv
				$TB/riscv_rvalid_stall.sv
				$TB/riscv_gnt_stall.sv
				$TB/cv32e40p_random_interrupt_generator.sv

	
#FPGA base system
	$PRF/ram/ram_1p.sv
	$PRF/ram/rom_1p.sv 
	$PRF/bus_mux/bus_mux.sv
	
	$PRF/peripherial/IOmodule/IOmodule.sv
	$PRF/peripherial/uart_module/UART.sv +define+Sim
	$PRF/peripherial/uart_module/asinhFIFOa_sim.sv
	$PRF/peripherial/Timer/Timer.sv
	$PRF/peripherial/BootLoader/BootLoader.sv
	$PRF/peripherial/BootLoader/BootLoader_tb.sv
	$PRF/peripherial/LED8x4/LED8x8.sv
	$PRF/peripherial/LED8x4/LED8x4.sv
	$PRF/mtimer/mtimer.sv
	
	$PRF/cv32e40p_sys.sv 
	$PRF/tb/cv32e40p_sys_tb.sv 
	
	$VIVpr/cv32e40p_sys_atrix7.sv
	
	$QUApr/cv32e40p_sys_cycloneIV.sv

	
"
alias s "
	#vopt +acc -novopt -O0 work.tb_top -o tb_top_opt
	#vsim  work.tb_top_opt -t 1ps +firmware=../example_tb/core/program.hex
	#do wave.do
	
	vopt +acc -O0 work.cv32e40p_sys_tb -o cv32e40p_sys_tb_opt 
	#-debugdb
	vsim  work.cv32e40p_sys_tb_opt -t 1ps 
	#-debugDB
	#do wave_cv32e40p_sys_Cyclone.do
	do wave_cv32e40p_sys_atrix.do
	
	run 1 us
	wave zoom full
	"

alias d "
	vopt +acc -novopt -O0 work.tb_top -o tb_top_opt
	vsim  work.tb_top_opt -t 1ps +firmware=../example_tb/core/program.hex
	do wave.do
	
	#vopt +acc -novopt -O0 work.cv32e40p_sys_tb -o cv32e40p_sys_tb_opt
	#vsim  work.cv32e40p_sys_tb_opt -t 1ps
	#do wave_cv32e40p_sys_Cyclone.do
	
	run 1 us
	wave zoom full
	"
