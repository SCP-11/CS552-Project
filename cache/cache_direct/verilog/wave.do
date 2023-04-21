onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mem_system_perfbench/DUT/m0/clk
add wave -noupdate /mem_system_perfbench/DUT/m0/rst
add wave -noupdate -radixshowbase 0 /mem_system_perfbench/DUT/m0/state
add wave -noupdate -radixenum symbolic /mem_system_perfbench/DUT/m0/next_state
add wave -noupdate -radix binary /mem_system_perfbench/DUT/m0/busy
add wave -noupdate /mem_system_perfbench/DUT/m0/stall
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {46 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 242
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
WaveRestoreZoom {0 ns} {2084 ns}
