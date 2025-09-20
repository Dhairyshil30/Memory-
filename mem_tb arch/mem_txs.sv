class mem_txs;

	rand bit wr_rd;
	randc bit [`ADDR_WIDTH-1:0]addr;
	rand bit [`WIDTH-1:0]data;

	function void print(string str = "MEM-TXS");
		$display("-- %0s -- doing %0s in/from addr=%0h data=%0h",str,wr_rd?"WRITE":"READ",addr,data);
	endfunction
	
 
endclass
