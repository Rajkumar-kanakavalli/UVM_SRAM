
class sram_inc_data_rand_addr_seq extends uvm_sequence #(sram_seq_item);

//utility macro
`uvm_object_utils(sram_inc_data_rand_addr_seq)

sram_seq_item pkt;

//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//incrementinting the data and random addr values are stored read followed

for(int i=0;i<=15;i=i+1)begin
//pkt.wr=1;
`uvm_do_with(pkt,{pkt.din==i;pkt.wr==1;pkt.addr inside {[1:8]};})
//`uvm_do_with(pkt,{pkt.din==i;pkt.wr==0;})
end
for(int i=0;i<=15;i=i+1)begin
//pkt.wr=1;
//`uvm_do_with(pkt,{pkt.din==i;pkt.wr==1;})
`uvm_do_with(pkt,{pkt.din==i;pkt.wr==0;pkt.addr inside {[1:8]};})
end

endtask

endclass
