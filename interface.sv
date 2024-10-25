interface sram_intf(input clk,rst);

logic wr;
logic [7:0]din;
logic [3:0]addr;
logic [7:0]dout;


modport dut(input clk,rst,wr,din,addr,output dout);

endinterface