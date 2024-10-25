class sram_sequencer extends uvm_sequencer #(sram_seq_item);

//utility macros
`uvm_component_utils(sram_sequencer)

//constructor
function new(string name = "sram_sequencer", uvm_component parent);
super.new(name,parent);
endfunction

endclass
