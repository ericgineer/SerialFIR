onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -group tb /SerialFIR_tb/clk
add wave -noupdate -group tb /SerialFIR_tb/rst
add wave -noupdate -group tb /SerialFIR_tb/v
add wave -noupdate -group tb /SerialFIR_tb/x
add wave -noupdate -group tb -height 17 -max 42815.0 -min -44688.0 /SerialFIR_tb/y_s
add wave -noupdate -group tb -height 17 -max 42815.0 -min -44688.0 /SerialFIR_tb/y_p
add wave -noupdate -group tb /SerialFIR_tb/x_in
add wave -noupdate -group tb /SerialFIR_tb/x_read
add wave -noupdate -group tb /SerialFIR_tb/count
add wave -noupdate -group tb /SerialFIR_tb/clk_out
add wave -noupdate -divider SerialFIR
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/clk
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/rst
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/x
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/y
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/clk_out
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d1
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d2
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d3
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d4
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d5
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/d_mux_out
add wave -noupdate -group SerialFIR -radix decimal /SerialFIR_tb/SerialFIR/h_mux_out
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/mult_out
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/sum_out
add wave -noupdate -group SerialFIR /SerialFIR_tb/SerialFIR/sum_clr
add wave -noupdate -group SerialFIR -radix decimal /SerialFIR_tb/SerialFIR/select
add wave -noupdate -group SerialFIR -radix decimal /SerialFIR_tb/SerialFIR/state
add wave -noupdate -divider ParallelFIR
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/clk
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/y
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x1
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x2
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x3
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x4
add wave -noupdate -group ParallelFIR /SerialFIR_tb/ParallelFIR/x5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {217 ns} 0}
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
WaveRestoreZoom {0 ns} {16059 ns}
