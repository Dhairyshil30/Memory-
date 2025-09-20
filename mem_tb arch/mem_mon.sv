class mem_mon;
	mem_txs tx;
	virtual intf vif;

	function new();
		vif=$root.top.pif;
	endfunction
	
	task run();
		$display("********** MEM-MON ***********");
		forever begin
				tx=new();
		@(vif.mon_cb);
			if(vif.mon_cb.valid && vif.mon_cb.ready)begin
				
				tx.addr=vif.mon_cb.addr;
				tx.data=vif.wr_rd?vif.mon_cb.wdata:vif.mon_cb.rdata;
				tx.wr_rd=vif.mon_cb.wr_rd;
				
				tx.print("MEM-MON");
				mon2cov.put(tx);
				mon2sbd.put(tx);
			end	
		end
	endtask
	
endclass
