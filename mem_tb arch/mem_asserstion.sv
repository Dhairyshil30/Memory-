module mem_assert #(parameter WIDTH=16, DEPTH=64, ADDR_WIDTH=$clog2(DEPTH))(input clk,rst,valid,wr_rd,ready,[ADDR_WIDTH-1:0]addr,[WIDTH-1:0]wdata,[WIDTH-1:0]rdata);

	property handshaking_pr;
		@(posedge clk) valid==1 |=> ready==1;
	endproperty
	HANDSHAKING_PR: assert property(handshaking_pr);
	
	property wdata_pr;
		@(posedge clk) wr_rd==1 |-> !($isunknown(wdata));
	endproperty
	WDATA_PR: assert property(wdata_pr);
	
	property rdata_pr;
		@(posedge clk) wr_rd==0 |=> !($isunknown(rdata));
	endproperty
	RADATA_PR: assert property(rdata_pr);

	property addr_pr;
		@(posedge clk) (valid==1&&rst==0) |-> !($isunknown(addr));
	endproperty
	ADDR_PR: assert property(addr_pr);

endmodule
