#vlib work
#vlog +acc +cover=bcestf -coverfec top.sv
#vsim -coverage






vlog top.sv +incdir+C:/questasim64_10.7c/verilog_src/uvm-1.1d/src C:/questasim64_10.7c/verilog_src/uvm-1.1d/src/uvm_pkg.sv
vsim sram_top7 -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi -l run.log

