onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /proc_hier_bench/DUT/p0/clk
add wave -noupdate /proc_hier_bench/DUT/p0/rst
add wave -noupdate /proc_hier_bench/DUT/p0/err
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/rf_mux
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/I_sel
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/rf_writeEn
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/ALUsrc
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/PC_sel
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/DI_sel
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/rev_sel
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/ALU_op
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/mem_writeEn
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/memreg
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/diff_op
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/compare
add wave -noupdate -group Proc -radix decimal /proc_hier_bench/DUT/p0/pcCurrent
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/PC_2_D
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/PC_2
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/I_mem_out
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/read1OutData
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/read2OutData
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/writeInData
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/ALU_out
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/I_mux_out
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/rev_mux_out
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/mem_mem_out
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/mux_sel
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/writeEn
add wave -noupdate -group Proc /proc_hier_bench/DUT/p0/ALU_cOut
add wave -noupdate -expand -group F -radix decimal /proc_hier_bench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -expand -group F -radix decimal /proc_hier_bench/DUT/p0/fetch0/PC_2
add wave -noupdate -expand -group F -radix decimal /proc_hier_bench/DUT/p0/fetch0/PC_2_D
add wave -noupdate -expand -group F /proc_hier_bench/DUT/p0/fetch0/out_PC
add wave -noupdate -expand -group F /proc_hier_bench/DUT/p0/fetch0/I_mem_out
add wave -noupdate -expand -group F /proc_hier_bench/DUT/p0/fetch0/data_in
add wave -noupdate -expand -group F /proc_hier_bench/DUT/p0/fetch0/I_sl1
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/rf_mux
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/memreg
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/diff_op
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/I_sel
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/mem_writeEn
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/rf_writeEn
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/PC_sel
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/DI_sel
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/compare
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/rev_sel
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/ALUsrc
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/ALU_op
add wave -noupdate -expand -group Ctr /proc_hier_bench/DUT/p0/ctr/I_op
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/I_mem_out
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/read1OutData
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/read2OutData
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/writeInData
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/rf_mux
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/I_sel
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/clk
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/rst
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/rf_writeEn
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/err
add wave -noupdate -expand -group D -radix unsigned /proc_hier_bench/DUT/p0/decode0/out_rf_mux
add wave -noupdate -expand -group D /proc_hier_bench/DUT/p0/decode0/I_mux_out
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/clk
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/rst
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/read1RegSel
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/read2RegSel
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/writeRegSel
add wave -noupdate -expand -group D -expand -group RF -radix hexadecimal /proc_hier_bench/DUT/p0/decode0/regFile0/writeInData
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/writeEn
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/read1OutData
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/read2OutData
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/err
add wave -noupdate -expand -group D -expand -group RF -radix hexadecimal /proc_hier_bench/DUT/p0/decode0/regFile0/r_out
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/writeDec
add wave -noupdate -expand -group D -expand -group RF /proc_hier_bench/DUT/p0/decode0/regFile0/writeSigs
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/read1OutData
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/invB
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/read2OutData
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/I
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/PC_2
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/PC_2_D
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALU_Oper
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALUsrc
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/PC_sel
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/DI_sel
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/rev_sel
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALU_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/PC_next
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/rev_mux_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALU_cOut
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALU_mux_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/JPB_mux_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/pc_2_JPB
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/add_mux_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/rev_out
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/ALU_Of1
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/cOut
add wave -noupdate -expand -group EX /proc_hier_bench/DUT/p0/EX/zero
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InA
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InB
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/Cin
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/Oper
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/invA
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/invB
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/sign
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/Out
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/Ofl
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/Zero
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/cOut
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/shiterOut
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InAIn
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InAf
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InBIn
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/InBf
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/addAB
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/andAB
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/orAB
add wave -noupdate -expand -group EX -expand -group ALU /proc_hier_bench/DUT/p0/EX/ALU/xorAB
add wave -noupdate -expand -group WB -expand -group WB /proc_hier_bench/DUT/p0/WB/mem_mem_out
add wave -noupdate -expand -group WB -expand -group WB /proc_hier_bench/DUT/p0/WB/PC_2
add wave -noupdate -expand -group WB -expand -group WB /proc_hier_bench/DUT/p0/WB/I
add wave -noupdate -expand -group WB -expand -group WB /proc_hier_bench/DUT/p0/WB/rev_mux_out
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/memreg
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/mem_mux_out
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/compare
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/ALU_carry
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/diff_op
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/diff_out
add wave -noupdate -expand -group WB /proc_hier_bench/DUT/p0/WB/rf_write
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {749 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 413
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
WaveRestoreZoom {5 ps} {346 ps}
