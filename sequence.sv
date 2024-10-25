
class sram_sequence extends uvm_sequence #(sram_seq_item);

//utility macros
`uvm_object_utils(sram_sequence)

sram_seq_item pkt;

/* function new(string name = "sram_sequence");
super.new(name);
endfunction */

//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");
repeat(10)
begin
start_item(pkt);
void'(pkt.randomize());  //randomized addr and data
//`uvm_info("sequence",$sformatf("din = %0d, addr = %0d",pkt.din,pkt.addr),UVM_LOW)
finish_item(pkt);
end
endtask

endclass
