`define WIDTH 16
`define DEPTH 64
`define ADDR_WIDTH $clog2(`DEPTH)

 static mailbox gen2bfm = new();
 static mailbox mon2cov = new();
 static mailbox mon2sbd = new();
 string testcase="consecutive_wr_rd";
 static int N=5;							
 static int agn_size=1;							
 static int bfm_drive2dut;							
 static int match;							
 static int unmatch;
 static semaphore smp= new(1);

