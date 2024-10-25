
class sram_dec_addr_seq extends uvm_sequence #(sram_seq_item);

//utility macro
`uvm_object_utils(sram_dec_addr_seq)

sram_seq_item pkt;

//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//decrementinting the address and randaom data values are stored and read followed

for(int i=15;i>=0;i=i-1)begin

`uvm_do_with(pkt,{pkt.addr==i;pkt.wr==1;})  //write
`uvm_do_with(pkt,{pkt.addr==i;pkt.wr==0;})	//read

end
/* #1;
for(int i=15;i>=0;i=i--)begin
pkt.wr=0;
`uvm_do_with(pkt,{pkt.addr==i;})
end
 */
endtask

endclass
