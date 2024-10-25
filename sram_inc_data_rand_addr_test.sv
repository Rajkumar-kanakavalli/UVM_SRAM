class sram_inc_data_rand_addr_test extends base_test;
`uvm_component_utils(sram_inc_data_rand_addr_test)

sram_inc_data_rand_addr_seq inc_data_seq;

function new(string name="sram_inc_data_rand_addr_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
inc_data_seq=sram_inc_data_rand_addr_seq::type_id::create("inc_data_seq",this);
endfunction:build_phase

task run_phase(uvm_phase phase);
phase.raise_objection(this);
	inc_data_seq.start(env.agent1.seqr);
	#10;
phase.drop_objection(this);
endtask

endclass