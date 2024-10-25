class sram_mon2 extends uvm_monitor;

//utility macros
`uvm_component_utils(sram_mon2)

sram_seq_item pkt1;//seq_item handle

virtual sram_intf vif; //virtual interface

uvm_analysis_port #(sram_seq_item) item_collected_port1; //analysis port to connect the mon2 with scoreboard

//constructor
function new(string name = "sram_mon2",uvm_component parent);
  super.new(name,parent);
endfunction

//build phase
virtual function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual sram_intf)::get(this,"","vif",vif); //config_db to get virtual interface from top
  item_collected_port1=new("item_collected_port1",this);
endfunction 

task run_phase(uvm_phase phase);
 pkt1=sram_seq_item::type_id::create("pkt1");
 forever begin
  #1;
	@(posedge vif.clk)
	pkt1.dout=vif.dout;

	//`uvm_info("mon2","mon2 transactions",UVM_NONE);
	@(posedge vif.clk)
	item_collected_port1.write(pkt1);
  end

endtask

endclass
