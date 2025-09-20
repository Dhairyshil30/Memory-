class agent;
	mem_txs tx;
	mem_gen gen = new();
	mem_bfm bfm = new();


	task run();
		$display("********** MEM-AGN ***********");
		fork
			gen.run();	
			bfm.run();
			
		join
	endtask
endclass
