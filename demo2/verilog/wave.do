onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /proc_hier_pbench/DUT/c0/clk
add wave -noupdate /proc_hier_pbench/DUT/c0/rst
add wave -noupdate /proc_hier_pbench/DUT/c0/cycle_count
add wave -noupdate -expand -group F -radix decimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -expand -group F -radix binary /proc_hier_pbench/DUT/p0/fetch0/I_mem_out
add wave -noupdate -group F_rg -radix binary /proc_hier_pbench/DUT/p0/rg_FD/I_mem_out_q
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2_q
add wave -noupdate -group F_rg -radix hexadecimal /proc_hier_pbench/DUT/p0/rg_FD/I_mem_out
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/PC_2
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/en
add wave -noupdate -group F_rg /proc_hier_pbench/DUT/p0/rg_FD/reg_en
add wave -noupdate -expand -group D -radix binary /proc_hier_pbench/DUT/p0/decode0/I_mem_out
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/read1OutData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/read2OutData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/writeInData
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_sel
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/I_sel
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_writeEn
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_sel_out
add wave -noupdate -expand -group D /proc_hier_pbench/DUT/p0/decode0/rf_sel_in
add wave -noupdate /proc_hier_pbench/DUT/p0/decode0/I_mux_out
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
add wave -noupdate -expand -group MEM /proc_hier_pbench/DUT/p0/memory0/halt
add wave -noupdate -expand -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_WB
add wave -noupdate -expand -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_MEM
add wave -noupdate -expand -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_EX
add wave -noupdate -expand -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_ctr
add wave -noupdate -expand -group halt /proc_hier_pbench/DUT/p0/halt_D
add wave -noupdate -expand -group halt /proc_hier_pbench/DUT/p0/halt_EX
add wave -noupdate -expand -group halt /proc_hier_pbench/DUT/p0/halt_MEM
add wave -noupdate -expand -group halt /proc_hier_pbench/DUT/p0/halt_WB
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/halt
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/I_op
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/rf_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/memreg
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/diff_op
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/I_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/mem_writeEn
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/B_op
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/bypass_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/rf_writeEn
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/PC_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/DI_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/compare
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/rev_sel
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/ALUsrc
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/B
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/invA
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/halt
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/ALU_op
add wave -noupdate -group Ctr /proc_hier_pbench/DUT/p0/ctr/invB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {855 ns} 0}
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
WaveRestoreZoom {813 ns} {1267 ns}
