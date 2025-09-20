class mem_cov;
	mem_txs tx;

	
	covergroup cg;
		coverpoint tx.wr_rd{
				}
		coverpoint tx.addr{
			//option.auto_bin_max=8;
				}
	endgroup
	
	function new();
		cg=new();
	endfunction
	
	task run();
		$display("********** MEM-COV ***********");
		forever begin
			mon2cov.get(tx);
			cg.sample();
		
		end
	endtask
	

endclass
