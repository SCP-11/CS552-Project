
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_FD (/*D*/	I_mem_out_q,
							I_mem_out,
					/*EX*/	PC_2_q,	PC_2_D_q,	pcNext_q,
							PC_2,	PC_2_D,	pcNext,
							clk, rst);

    output wire [15:0] 	/*D*/	I_mem_out_q,
						/*EX*/	PC_2_q,	PC_2_D_q,	pcNext_q;
						
    input wire [15:0] 	/*D*/	I_mem_out,
						/*EX*/	PC_2,	PC_2_D,	pcNext;
    input wire     clk;
    input wire     rst;

    //dff PC_2_D_dffs [0:15](.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	//dff PC_2_D_dffs [0:15](.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	
	/*D*/
	dff I_mem_out_dffs 	[0:15](.q(I_mem_out_q), .d(I_mem_out), .clk(clk), .rst(rst));
	
	/*EX*/
	dff PC_2_dffs 		[0:15](.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	dff PC_2_D_dffs 	[0:15](.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	dff pcNext_dffs 	[0:15](.q(pcNext_q), .d(pcNext), .clk(clk), .rst(rst));
	
endmodule
`default_nettype wire