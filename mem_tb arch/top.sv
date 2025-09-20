module top;
	//instance
	bit clk,rst;
	intf pif(clk, rst);
	mem_env env;
	
	memory #(`WIDTH,`DEPTH,`ADDR_WIDTH) dut(.clk(pif.clk), .rst(pif.rst), .valid(pif.valid), .wr_rd(pif.wr_rd), .addr(pif.addr), .wdata(pif.wdata), .ready(pif.ready), .rdata(pif.rdata));

	mem_assert #(`WIDTH,`DEPTH,`ADDR_WIDTH) assert_inst (.clk(pif.clk), .rst(pif.rst), .valid(pif.valid), .wr_rd(pif.wr_rd), .addr(pif.addr), .wdata(pif.wdata), .ready(pif.ready), .rdata(pif.rdata));
	always #5 clk=~clk;

	initial begin
		rst=1;
		
		pif.wr_rd=0;
		pif.wdata=0;
		pif.addr=0;
		pif.valid=0;
		repeat(2)@(posedge clk);
		rst=0;
	end

	initial begin
		$display("********** TOP ***********");
		env=new();
		env.run();
	end

	initial begin
	//	#100;
		wait(N*2*agn_size==bfm_drive2dut);
		#50;
		$display("fc=%f",$get_coverage);
		if(match==N*agn_size && unmatch==0)begin
			$display("\n \t \t test case passed \n \t matches=%0d \t unmatches=%0d \n ",match,unmatch);
		end
		$finish;
	end

endmodule
