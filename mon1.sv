class sram_mon1 extends uvm_monitor;

//utility macros
`uvm_component_utils(sram_mon1)

sram_seq_item pkt; //seq_item handle for pin to pkt level conversion

virtual sram_intf vif; ///virtual interface to access the pin level activity

uvm_analysis_port #(sram_seq_item) item_collected_port; //to connect the mon1 to scoreboard

//constructor
function new(string name = "sram_mon1",uvm_component parent);
super.new(name,parent);
endfunction

//build phase
virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual sram_intf)::get(this,"","vif",vif);//config db to get virtual interface from top
item_collected_port=new("item_collected_port",this);  //analysis port 
endfunction 

//run phase
task run_phase(uvm_phase phase);
pkt=sram_seq_item::type_id::create("pkt");
forever begin
@(posedge vif.clk)
pkt.addr=vif.addr;		//pin to pkt level conversion
pkt.wr=vif.wr;
pkt.din=vif.din;
pkt.dout=vif.dout;
//`uvm_info("mon1","mon1 transactions",UVM_NONE);
//@(posedge vif.clk)
item_collected_port.write(pkt); //sending data to scoreboard
end

endtask
endclass


//analysis port pakka use cheyali -------one to many connections

//driver consumer& sequencer producer-----
//