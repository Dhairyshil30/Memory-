interface intf(input reg clk, rst);
	
	bit wr_rd;
	bit valid;
	bit ready;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata;
	bit [`WIDTH-1:0]rdata;

	clocking bfm_cb @(posedge clk);
		default input #0 output #1;
		input ready;
		input rdata;
		output wr_rd;
		output valid;
		output wdata;
		output addr;
	endclocking  
	
	clocking mon_cb @(posedge clk);
		default input #1;
		input ready;
		input rdata;
		input wr_rd;
		input valid;
		input wdata;
		input addr;
	endclocking
	
endinterface

