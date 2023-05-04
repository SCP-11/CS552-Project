
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
							Done_q,			Done,
							err_q,			err,
							nop,
							
							clk, rst, en);

    output wire [15:0] 	/*D*/	I_mem_out_q,
						/*EX*/	PC_2_q,	PC_2_D_q;
	output wire					Done_q;
						
	output wire			err_q;			input wire			err;

    input wire [15:0] 	/*D*/	I_mem_out,
						/*EX*/	PC_2,	PC_2_D;
	input wire					Done;
    input wire     nop,	clk,	rst, en;
	
	wire 		[15:0]			I;
	wire 		reg_en;
	assign reg_en = en&~rst;
    //register PC_2_D_registers [0:15](.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	//register PC_2_D_registers [0:15](.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	
	assign I = (nop)? 16'h0800/*NOP*/:	I_mem_out;
	register#(.size(1)) err_registers		(.q(err_q),	.d(err),	.clk(clk), .rst(rst), .en(reg_en));
	
	/*D*/
	register	#(.size(16))	I_mem_out_registers(.q(I_mem_out_q), 
													.d(I), .clk(clk), .rst(rst), .en(reg_en));
	
	/*EX*/
	register	#(.size(16))	PC_2_registers(		.q(PC_2_q), 
													.d(PC_2), .clk(clk), .rst(rst),	.en(reg_en));											
	register	#(.size(16))	PC_2_D_registers(	.q(PC_2_D_q), 
													.d(PC_2_D), .clk(clk), .rst(rst), 	.en(reg_en));
	register	#(.size(1))		Done_registers(	.q(Done_q), 
													.d(Done), .clk(clk), .rst(rst), 	.en(reg_en));
	
endmodule
`default_nettype wire