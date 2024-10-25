`include "uvm_macros.svh"
import uvm_pkg::*;

`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "dut.sv"
`include "mon1.sv"
`include "agent1.sv"
`include "mon2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
//Test case-1
`include "sram_inc_addr_sequence.sv"
`include "sram_inc_addr_test.sv"
//Test case-2
`include "sram_dec_addr_sequence.sv"
`include "sram_dec_addr_test.sv"
//Test case-3
`include "sram_inc_data_rand_addr_sequence.sv"
`include "sram_inc_data_rand_addr_test.sv"
//Test case-4
`include "sram_dec_data_rand_addr_sequence.sv"
`include "sram_dec_data_rand_addr_test.sv"
//Test case-5
`include "sram_inc_addr_0data_sequence.sv"
`include "sram_inc_addr_0data_test.sv" 
//Test case-6
`include "sram_inc_addr_dec_data_sequence.sv"
`include "sram_inc_addr_dec_data_test.sv"
//Test Case-7
//`include "sram_inc_addr_rand_data_sequence.sv"
//`include "sram_inc_addr_rand_data_test.sv"


module sram_top7;

bit rst;
bit clk;

initial begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial begin 
rst = 0;
#1;
rst = 1'b1;
end

sram_intf vif(clk,rst);
sram_dut DUT(vif);

initial begin
uvm_config_db #(virtual sram_intf)::set(uvm_root::get(),"*","vif",vif);

$dumpfile("dump.vcd"); $dumpvars;
end

initial begin

run_test("sram_inc_addr_test");

//#500; $finish;
end

endmodule