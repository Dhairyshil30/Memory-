class mem_sbd;
	mem_txs tx;
	bit [`WIDTH-1:0]mem[*];
	
	task run();
		$display("********** MEM-SBD ***********");
		forever begin
			mon2sbd.get(tx);
			//tx.print("MEM-SBD");

			if(tx.wr_rd)begin //write
				mem[tx.addr]=tx.data;
			end
			else begin
				if(tx.data==mem[tx.addr])begin
					match++;
				end
				else begin unmatch++;
				end
			end
		end
	endtask
endclass
