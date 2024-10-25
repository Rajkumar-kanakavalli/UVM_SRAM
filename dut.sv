module sram_dut(sram_intf.dut intf);
		/* input clk,rst,wr,
		input [3:0]addr,
		input [7:0]din,
		output reg[7:0]dout
		); */
 reg [7:0]mem[0:15];

  always@(posedge intf.clk)
   begin
		if(intf.rst == 0)
		 intf.dout <= 0;
		else if(intf.wr==1)
			mem[intf.addr]<=intf.din;
		else 
			intf.dout<=mem[intf.addr];
   end

endmodule