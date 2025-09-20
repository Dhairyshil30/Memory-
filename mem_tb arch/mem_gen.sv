class mem_gen;
	mem_txs tx, temp_q[$],temp_t;
	bit [`ADDR_WIDTH-1:0]temp;
	
	task run();
		$display("********** MEM-GEN ***********");
		case(testcase)
			"1wr_1rd":begin
			//write oper
			tx=new();
			tx.randomize()with{wr_rd==1;};
			temp=tx.addr;
			//temp.push_back(tx.addr);
			tx.print("MEM-GEN");
			gen2bfm.put(tx);

			//read oper
			tx=new();
			tx.randomize()with{wr_rd==0;data==0;addr==temp;};
			tx.print("MEM-GEN");
			gen2bfm.put(tx);
			end
			
			"nwr_nrd":begin
					tx=new();
				repeat(N)begin
				//write oper
					tx.randomize()with{wr_rd==1;};
					 temp_t=new tx;
					temp_q.push_front(temp_t);
					//tx.print("MEM-GEN");
					gen2bfm.put(temp_t);
				end
				
				repeat(N)begin
				//read oper
					tx=new();
					temp_t=temp_q.pop_back();
					tx.randomize()with{wr_rd==0;data==0;addr==temp_t.addr;};
					//tx.print("MEM-GEN");
					gen2bfm.put(tx);
				end
			end	
			"consecutive_wr_rd":begin
				repeat(N)begin
					tx=new();
				//write oper
					tx.randomize()with{wr_rd==1;};
					 temp_t=new tx;
					temp_q.push_front(temp_t);
					//tx.print("MEM-GEN");
					gen2bfm.put(temp_t);
				//read oper
					//tx=new();
					temp_t=temp_q.pop_back();
					tx.randomize()with{wr_rd==0;data==0;addr==temp_t.addr;};
					//tx.print("MEM-GEN");
					gen2bfm.put(tx);
				end
			end
		endcase
	endtask
endclass 

/* class mem_gen;
	mem_txs tx,temp,temp_q[$];
	//bit [`ADDR_WIDTH-1:0]temp;
	//bit [`ADDR_WIDTH-1:0]temp_q[$];
	
	task run();
		$display("********** MEM-GEN ***********");
		case(testcase)
			"1wr_1rd":begin
			//write oper
			tx=new();
			tx.randomize()with{wr_rd==1;};
			temp=tx.addr;
			//temp.push_back(tx.addr);
			tx.print("MEM-GEN");
			gen2bfm.put(tx);

			//read oper
			tx=new();
			tx.randomize()with{wr_rd==0;data==0;addr==temp;};
			tx.print("MEM-GEN");
			gen2bfm.put(tx);
			end
		
			"nwr_nrd":begin
					tx=new();
				repeat(N)begin
				//write oper
					tx.randomize()with{wr_rd==1;};
					temp = new tx;//shallow copy whole txs to temp and access only addr data from it
					temp_q.push_front(temp.addr);
					tx.print("MEM-GEN");
					gen2bfm.put(temp);
				end
				
				repeat(N)begin
				//read oper
					tx=new();
					temp=temp_q.pop_back();
					tx.randomize()with{wr_rd==0;data==0;addr==temp;};
					$display(" q=%p",temp_q);
					tx.print("MEM-GEN");
					gen2bfm.put(tx);
				end
			end
		endcase
	endtask
endclass */
