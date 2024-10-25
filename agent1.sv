class sram_agent1 extends uvm_agent;//active agent

//utility macros
`uvm_component_utils(sram_agent1)

//active agent components
sram_sequencer seqr;
sram_driver    drv;
sram_mon1      mon1;

//constructor
function new(string name = "sram_agent1",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);

super.build_phase(phase);
seqr = sram_sequencer::type_id::create("seqr",this);
drv  = sram_driver::type_id::create("drv",this);
mon1 = sram_mon1::type_id::create("mon1",this);
endfunction

//connect phase to connect the driver and sequencer
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export); //connecting the driver with sequencer
endfunction

endclass
