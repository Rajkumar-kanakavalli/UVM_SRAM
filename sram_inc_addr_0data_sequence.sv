
class sram_inc_addr_0data_seq extends uvm_sequence #(sram_seq_item);

//utility macro
`uvm_object_utils(sram_inc_addr_0data_seq)

sram_seq_item pkt;

bit[3:0] c;
//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//incrementinting the address and data value 0 are stored read followed

for(int i=0;i<=15;i=i++)begin
`uvm_do_with(pkt,{pkt.addr==c;pkt.din==0;pkt.wr==1;})
`uvm_do_with(pkt,{pkt.addr==c;pkt.din==0;pkt.wr==0;})
c++;
end

endtask

endclass
