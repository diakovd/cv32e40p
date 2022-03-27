onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/wrapper_i/instr_addr
add wave -noupdate /tb_top/wrapper_i/instr_rdata
add wave -noupdate /tb_top/wrapper_i/instr_req
add wave -noupdate /tb_top/wrapper_i/instr_rvalid
add wave -noupdate /tb_top/wrapper_i/instr_gnt
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb_top/wrapper_i/data_addr
add wave -noupdate /tb_top/wrapper_i/data_wdata
add wave -noupdate /tb_top/wrapper_i/data_we
add wave -noupdate /tb_top/wrapper_i/data_req
add wave -noupdate /tb_top/wrapper_i/data_rdata
add wave -noupdate /tb_top/wrapper_i/data_rvalid
add wave -noupdate /tb_top/wrapper_i/data_gnt
add wave -noupdate /tb_top/wrapper_i/data_be
add wave -noupdate /tb_top/wrapper_i/data_atop
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {377593 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1853309 ps}
