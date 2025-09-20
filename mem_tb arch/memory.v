module memory #(parameter WIDTH=16, DEPTH=64, ADDR_WIDTH=$clog2(DEPTH))(
	input clk, rst, valid, wr_rd, [ADDR_WIDTH-1:0]addr, [WIDTH-1:0]wdata, 
	output reg ready,[WIDTH-1:0]rdata);

	reg [WIDTH-1:0]mem[DEPTH-1:0];
	integer i;

	always@(posedge clk)begin
		if(rst)begin
			rdata=0;
			ready=0;
			for(i=0;i<DEPTH;i=i+1)mem[i]=0;
		end
		else begin
		if(valid)begin
			 ready=1;
			 if(wr_rd)mem[addr]=wdata;
			 else rdata=mem[addr];
		end
		else ready=0;
	end
	end
endmodule

