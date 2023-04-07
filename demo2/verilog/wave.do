onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /proc_hier_pbench/DUT/c0/clk
add wave -noupdate /proc_hier_pbench/DUT/c0/rst
add wave -noupdate /proc_hier_pbench/DUT/c0/cycle_count
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/pcNext
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/PC_2
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/PC_2_D
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/I_mem_out
add wave -noupdate -expand -group F -radix decimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/I_sl1
add wave -noupdate -expand -group F /proc_hier_pbench/DUT/p0/fetch0/cOut
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/I_mem_out_q
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2_q
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2_D_q
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/I_mem_out
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2_D
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/I_mem_out
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/read1OutData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/read2OutData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/I_mux_out
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/writeInData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_sel
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/I_sel
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_writeEn
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/out_rf_sel
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/read1OutData
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/read2OutData
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/I
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/PC_2
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALU_Oper
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/B_op
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/bypass_sel
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALUsrc
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/B
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/rev_sel
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/invB
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/invA
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALU_out
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/JPB_mux_out
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/bypass
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALU_cOut
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/B_take
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALU_Of1
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/ALU_mux_out
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/pc_2_JPB
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/rev_out
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/IORShift
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/cOut
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/zero
add wave -noupdate -group EX /proc_hier_pbench/DUT/p0/EX/PC2_I_sel
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/writeData
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/aluResult
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/mem_writeEn
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/mem_mem_out
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/memRead
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/memWrite
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/memReadorWrite
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_MW/rf_writeEn_q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {313 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 339
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {147 ps} {524 ps}
