class sram_seq_item extends uvm_sequence_item;

//payload info
rand bit[7:0] din;

//control info
rand bit[3:0] addr;
 rand bit wr;

bit [7:0] mem[0:7];

//analysis info
bit [7:0] dout;

//utility fileld macros
`uvm_object_utils_begin(sram_seq_item)
	`uvm_field_int(din,UVM_ALL_ON + UVM_DEC)
	`uvm_field_int(addr,UVM_ALL_ON + UVM_DEC)
	`uvm_field_int(wr,UVM_ALL_ON + UVM_BIN)
`uvm_object_utils_end

//construnctor
function new(string name="sram_seq_item");
super.new(name);
endfunction

endclass
