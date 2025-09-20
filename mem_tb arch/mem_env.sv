class mem_env;
 agent agn[];
 mem_mon mon;
 mem_cov cov;
 mem_sbd sbd;
	
	task run();	
		$display("********** MEM-ENV ***********");
		
		 mon = new();
		 cov = new();
		 sbd = new();
	
		 agn=new[agn_size];
		 
		 foreach(agn[i])begin
		 	agn[i]=new();
		 end
		
		foreach(agn[i])begin
			fork
				agn[i].run();
			join_none
				#1;

		end
			fork
			mon.run();
			cov.run();
			sbd.run();
		join
	endtask
endclass
