onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /proc_hier_pbench/DUT/p0/clk
add wave -noupdate /proc_hier_pbench/DUT/p0/rst
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/state
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/DataOut
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/Addr
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/add_mux_out
add wave -noupdate /proc_hier_pbench/DUT/p0/decode0/rf_sel_in
add wave -noupdate /proc_hier_pbench/DUT/p0/decode0/writeInData
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/hit_cache_0
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/hit_cache_1
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/CacheHit
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/I_mem/cache_sel
add wave -noupdate /proc_hier_pbench/DCacheReq
add wave -noupdate /proc_hier_pbench/DCacheHit
add wave -noupdate /proc_hier_pbench/ICacheReq
add wave -noupdate /proc_hier_pbench/DUT/p0/nop
add wave -noupdate /proc_hier_pbench/DUT/p0/B_take
add wave -noupdate /proc_hier_pbench/DUT/p0/decode0/I_mem_out
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/I
add wave -noupdate /proc_hier_pbench/DUT/p0/Istall
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_DEX/en
add wave -noupdate /proc_hier_pbench/DUT/p0/fetch0/Done
add wave -noupdate -expand -group Enable /proc_hier_pbench/DUT/p0/en_FD
add wave -noupdate -expand -group Enable /proc_hier_pbench/DUT/p0/en_DX
add wave -noupdate -expand -group Enable /proc_hier_pbench/DUT/p0/en_XM
add wave -noupdate -expand -group Enable /proc_hier_pbench/DUT/p0/en_MW
add wave -noupdate -expand -group haly /proc_hier_pbench/DUT/p0/halt_WB
add wave -noupdate -expand -group haly /proc_hier_pbench/DUT/p0/halt_MEM
add wave -noupdate -expand -group haly /proc_hier_pbench/DUT/p0/halt_EX
add wave -noupdate -expand -group haly /proc_hier_pbench/DUT/p0/halt_D
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/state
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/memRead
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/memWrite
add wave -noupdate /proc_hier_pbench/DUT/p0/D_Done
add wave -noupdate /proc_hier_pbench/DUT/p0/Dstall
add wave -noupdate /proc_hier_pbench/MemWrite
add wave -noupdate /proc_hier_pbench/MemRead
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/Rd
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/Wr
add wave -noupdate -radix binary /proc_hier_pbench/DUT/p0/mem_writeEn_D
add wave -noupdate -radix binary /proc_hier_pbench/DUT/p0/mem_writeEn_EX
add wave -noupdate -radix binary /proc_hier_pbench/DUT/p0/mem_writeEn_MEM
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/I
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/ALU_mux_out
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/ALU_out
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_ctr
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_D_harzard
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_EX
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_MEM
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/rf_writeEn_WB
add wave -noupdate -group rf_writeEn /proc_hier_pbench/DUT/p0/decode0/rf_writeEn
add wave -noupdate /proc_hier_pbench/DUT/p0/WB/ALU_out
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/B
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/B_take
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_DEX/B
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_DEX/B_q
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Ierr_F
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Ierr_D
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Ierr_X
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Ierr_M
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Ierr_W
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Derr_M
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/Derr_W
add wave -noupdate -group err /proc_hier_pbench/DUT/p0/err_W
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/err_mem
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/err_cache_0
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_mem/err_cache_1
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_EXM/ALU_out_q
add wave -noupdate /proc_hier_pbench/DUT/p0/rg_EXM/ALU_out
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/ALU_mux_out
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/read1OutData
add wave -noupdate /proc_hier_pbench/DUT/p0/EX/read2OutData
add wave -noupdate /proc_hier_pbench/DUT/p0/memory0/mem_address
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 321
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {3255 ns}
