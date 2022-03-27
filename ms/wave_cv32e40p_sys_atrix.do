onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Instr bus}
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_DatBus/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_DatBus/wdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_DatBus/be
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/rdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/we
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/req
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/rvalid
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/gnt
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/instr_CtrBus/err
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/wrapper_i/irq_i
add wave -noupdate -divider {Data bus}
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_DatBus/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_DatBus/wdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_DatBus/be
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/rdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/we
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/req
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/rvalid
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/gnt
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/data_CtrBus/err
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/bus_mux_inst/sel_UART0
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/bus_mux_inst/sel_Timer1
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/bus_mux_inst/sel_Timer
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/bus_mux_inst/sel_RAM
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/bus_mux_inst/sel_IO
add wave -noupdate -divider {New Divider}
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/IOreg
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/IntCl
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/TmPrSh
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HCLK
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HRESETn
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HSEL
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HADDR
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HWDATA
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HRDATA
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HWRITE
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HSIZE
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HBURST
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HPROT
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HTRANS
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HMASTLOCK
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HREADY
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HREADYOUT
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/CPUbus/HRESP
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/wr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/Timer_inst/TmPr
add wave -noupdate -divider UART
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/TX
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/RX
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/addr_rd
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/rd
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/wrdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/wr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/ISR
add wave -noupdate -expand /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/FCR
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/ESR
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/DLR
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/genblk2/fifo_tx_inst/wr_en
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/UART_inst/genblk2/fifo_tx_inst/din
add wave -noupdate -divider {New Divider}
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/DatBus/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/DatBus/wdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/DatBus/be
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/CtrBus/rdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/CtrBus/we
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/CtrBus/req
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/IOmodule_inst/CtrBus/rvalid
add wave -noupdate -divider mtimer
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/rdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/we
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/req
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/rvalid
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/gnt
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUctr/err
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUdat/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUdat/wdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/CPUdat/be
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/addrBase
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/mtime
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/mtimecmp
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/wrdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/RDdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/addr_rd
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/addr_low
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/rd
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/mtimer_inst/wr
add wave -noupdate -divider RAm
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_DatBus/addr
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_DatBus/wdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_DatBus/be
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/rdata
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/we
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/req
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/rvalid
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/gnt
add wave -noupdate /cv32e40p_sys_tb/cv32e40p_sys_atrix7_inst/cv32e40p_sys_inst/u_ram_instr/RAM_CtrBus/err
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31272318 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 128
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {31236154 ps} {31364754 ps}
