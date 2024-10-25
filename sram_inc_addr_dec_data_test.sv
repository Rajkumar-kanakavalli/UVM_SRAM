class sram_inc_addr_dec_data_test extends base_test;

`uvm_component_utils(sram_inc_addr_dec_data_test)

sram_inc_addr_dec_data_seq   inc_addr_dec_data_seq;


function new(string name ="sram_inc_addr_dec_data_test",uvm_component parent);
super.new(name,parent);
endfunction

//Build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

inc_addr_dec_data_seq =sram_inc_addr_dec_data_seq::type_id::create("inc_addr_dec_data_seq",this);

endfunction:build_phase

//Run_phase
task run_phase(uvm_phase phase);
phase.raise_objection(this);
      inc_addr_dec_data_seq.start(env.agent1.seqr);
	  #1;
	  
phase.drop_objection(this);
endtask

endclass
     