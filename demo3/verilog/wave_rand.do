onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mem_system_randbench/DUT/clk
add wave -noupdate /mem_system_randbench/DUT/rst
add wave -noupdate /mem_system_randbench/DUT/m0/state
add wave -noupdate -radix decimal /mem_system_randbench/n_requests
add wave -noupdate -expand -group Error /mem_system_randbench/DUT/m0/err
add wave -noupdate -expand -group Error /mem_system_randbench/DUT/m0/c0/err
add wave -noupdate -expand -group Error /mem_system_randbench/DUT/m0/c1/err
add wave -noupdate -expand -group Error /mem_system_randbench/DUT/m0/mem/err
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/enable
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/createdump
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/tag_in
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/index
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/offset
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/data_in
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/comp
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/write
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/valid_in
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/tag_out
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/data_out
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/hit
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/dirty
add wave -noupdate -expand -group {Cache 0} /mem_system_randbench/DUT/m0/c0/valid
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/enable
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/createdump
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/tag_in
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/index
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/offset
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/data_in
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/comp
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/write
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/valid_in
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/tag_out
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/data_out
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/hit
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/dirty
add wave -noupdate -expand -group {Cache 1} /mem_system_randbench/DUT/m0/c1/valid
add wave -noupdate /mem_system_randbench/DUT/m0/cache_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32583 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 305
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
WaveRestoreZoom {31583 ns} {32655 ns}
