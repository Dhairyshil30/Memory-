class mem_bfm;
	mem_txs tx;
	virtual intf vif;
	
	function new();
		vif=$root.top.pif;
	endfunction
	
	task run();
		$display("********** MEM-bfm ***********");
		wait(vif.rst==0);
		forever begin
			tx=new();
			gen2bfm.get(tx);
			smp.get(1);
			drive2dut(tx);
			bfm_drive2dut++;
			smp.put(1);
			//tx.print("MEM-BFM");
			
		end
	endtask


	task drive2dut(mem_txs tx);
		@(vif.bfm_cb);
			vif.bfm_cb.wr_rd <= tx.wr_rd;
			vif.bfm_cb.addr <= tx.addr;

			if(tx.wr_rd)vif.bfm_cb.wdata <= tx.data;
			vif.bfm_cb.valid <= 1;


			wait(vif.bfm_cb.ready);
			
			if(!tx.wr_rd)tx.data = vif.bfm_cb.rdata  ;
			
				@(vif.bfm_cb);
				vif.bfm_cb.wdata <= 0;
				vif.bfm_cb.addr <= 0;
				vif.bfm_cb.wdata <= 0;
				vif.bfm_cb.valid <= 0;
		
	endtask
	
endclass
