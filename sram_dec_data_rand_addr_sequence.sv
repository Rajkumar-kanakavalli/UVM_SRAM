
class sram_dec_data_rand_addr_seq extends uvm_sequence #(sram_seq_item);

//utility macro
`uvm_object_utils(sram_dec_data_rand_addr_seq)

sram_seq_item pkt;

bit[7:0] c = 8'hff;
//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//decrementinting the data and random addr values are stored read followed

for(int i=255;i>=0;i=i--)begin
pkt.wr=1;
`uvm_do_with(pkt,{pkt.din==c;})
c--;
end
#1;
for(int i=255;i>=0;i=i--)begin
pkt.wr=0;
`uvm_do_with(pkt,{pkt.din==i;})
end

endtask

endclass
