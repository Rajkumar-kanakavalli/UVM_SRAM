
class sram_scb extends uvm_scoreboard;

//utility macros
`uvm_component_utils(sram_scb)

sram_seq_item pkt1,pkt2; //seq_item handles for comparison

uvm_tlm_analysis_fifo#(sram_seq_item)ip_fifo;//for connection of mon1 to scoreboard
uvm_tlm_analysis_fifo#(sram_seq_item)op_fifo;//for connection of mon2 to scoreboard

//constructor
function new(string name = "sram_scb",uvm_component parent);
super.new(name,parent);
ip_fifo=new("ip_fifo",this);
op_fifo=new("op_fifo",this);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
pkt1 = sram_seq_item::type_id::create("pkt1",this);
pkt2 = sram_seq_item::type_id::create("pkt2",this);
endfunction

//run_phase
task run_phase(uvm_phase phase);
forever begin 

fork
ip_fifo.get(pkt1);//taking the data from mon1
op_fifo.get(pkt2);//taking the data from mon2
join

if(pkt2.dout==pkt1.dout)//comparision of dout in mon1 and mon2
  begin 
	`uvm_info("SCB: DATA MATCHED",$sformatf("dut dout = %d, ref dout =%d",pkt2.dout,pkt1.dout),UVM_NONE);
   end
else 
	begin
	 `uvm_info("SCB: DATA MISMATCHED",$sformatf("dut dout = %d, ref dout =%d",pkt2.dout,pkt1.dout),UVM_NONE);
	end
	`uvm_info("----------------------------------------------------------------------------------","",UVM_NONE)
end
endtask

endclass