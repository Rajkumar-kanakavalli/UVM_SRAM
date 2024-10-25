class sram_driver extends uvm_driver#(sram_seq_item);

//virtual interface
virtual sram_intf vif;

sram_seq_item pkt;

//utility macros
`uvm_component_utils(sram_driver)

//constructor
function new(string name= "sram_driver",uvm_component parent);
super.new(name,parent);
endfunction

//build phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
 //uvm_config_db#(virtual sram_intf)::get(this,"","vif",vif);
 if(!uvm_config_db#(virtual sram_intf)::get(this,"","vif",vif))  //if virtual interface is not camed uvm_fatal is displayed
	`uvm_fatal("no vif",{"virtual interface must set fot: ",get_full_name(),".vif"}) 
endfunction

//run_phase
virtual task run_phase(uvm_phase phase);
pkt=sram_seq_item::type_id::create("pkt");
forever begin
seq_item_port.get_next_item(pkt);
@(posedge vif.clk)
vif.wr<=pkt.wr;      //write operation
vif.addr<=pkt.addr;
vif.din<=pkt.din;

 //@(posedge vif.clk)
//vif.din=pkt.din;
//vif.wr=pkt.wr;
//vif.wr <= 0;    //read opeartion
seq_item_port.item_done();
//`uvm_info("Driver","Drv transaction dut",UVM_NONE);
@(posedge vif.clk);
end
endtask

endclass