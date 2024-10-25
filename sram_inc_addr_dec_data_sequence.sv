class sram_inc_addr_dec_data_seq extends uvm_sequence #(sram_seq_item);

//utility macros
`uvm_object_utils(sram_inc_addr_dec_data_seq);

sram_seq_item pkt;

bit[3:0]r;
bit[3:0]k;

//body of the sequence
virtual task body();

pkt = sram_seq_item::type_id::create("pkt");

//incrementing the address and decr data values are stored

 
for(int i=0;i<=15;i++)
  begin
  `uvm_do_with(pkt,{pkt.addr==r;pkt.wr==1;})
  r++;
  end
  
  #1;
  
  for(int i=0;i<=15;i--)begin
  `uvm_do_with(pkt,{pkt.din==k;pkt.wr==0;})
  k--;
  end 
  endtask
  
 endclass
 
 /* for(int i=0;i<=15;i++)begin
  `uvm_do_with(pkt,{pkt.addr==r;pkt.din==k;pkt.wr==1;})
  `uvm_do_with(pkt,{pkt.addr==r;pkt.din==k;pkt.wr==0;})
  r++;
  k--;
  #5;
  `uvm_do_with(pkt,{pkt.addr==r;}) */
 
 
 
 
 
 
 
 
