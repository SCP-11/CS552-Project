
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (register).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_FD (/*D*/	I_mem_out_q, 	I_mem_out,
							PC_2_q,			PC_2,
							PC_2_D_q,		PC_2_D,
							
							clk, rst, en);

    output wire [15:0] 	/*D*/	I_mem_out_q,
						/*EX*/	PC_2_q,	PC_2_D_q;
						
    input wire [15:0] 	/*D*/	I_mem_out,
						/*EX*/	PC_2,	PC_2_D;

    input wire     clk,	rst, en;
	
	wire 		reg_en;
	assign reg_en = en&~rst;
    //register PC_2_D_registers [0:15](.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	//register PC_2_D_registers [0:15](.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	
	/*D*/
	register	#(.size(16))	I_mem_out_registers(.q(I_mem_out_q), 
													.d(I_mem_out), .clk(clk), .rst(rst), .en(reg_en));
	
	/*EX*/
	register	#(.size(16))	PC_2_registers(		.q(PC_2_q), 
													.d(PC_2), .clk(clk), .rst(rst),	.en(reg_en));											
	register	#(.size(16))	PC_2_D_registers(	.q(PC_2_D_q), 
													.d(PC_2_D), .clk(clk), .rst(rst), 	.en(reg_en));
	
endmodule
`default_nettype wire