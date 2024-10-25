
class sram_inc_addr_seq extends uvm_sequence #(sram_seq_item);

//utility macro
`uvm_object_utils(sram_inc_addr_seq)

sram_seq_item pkt;

//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//incrementinting the address and randaom data values are stored read followed

for(int i=0;i<=15;i++)begin
`uvm_do_with(pkt,{pkt.addr==i;pkt.wr==1;}) //write
`uvm_do_with(pkt,{pkt.addr==i;pkt.wr==0;}) //read
end

endtask

endclass
