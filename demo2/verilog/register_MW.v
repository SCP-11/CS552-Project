
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_MW (
	/*F*/	PC_2_q,	PC_2,	
	/*D*/	I_mux_out_q,	I_mux_out,
			compare_q,	compare,
	/*EX*/	ALU_out_q,	ALU_out,		
			ALU_cOut_q,	ALU_cOut,	
			bypass_q,	bypass,
	/*MEM*/	mem_mem_out_q,	mem_mem_out,	

			clk, rst
			);

	/*F*/
	output wire [15:0]	PC_2_q;		input wire [15:0] 	PC_2;
	
    /*D*/	
	output wire [15:0] 	I_mux_out_q;input wire [15:0] 	I_mux_out;
	output wire	compare_q;			input wire 	compare;
	
	/*EX*/
	output wire [15:0] 	ALU_out_q;	input wire [15:0] 	ALU_out;
	output wire	ALU_cOut_q;			input wire 	ALU_cOut;
	output wire [15:0] bypass_q;	input wire [15:0] bypass;
	
	/*MEM*/	
	output wire	[15:0]	mem_mem_out_q;	input wire	[15:0]	mem_mem_out;
	
    input wire     clk;
    input wire     rst;

	/*F*/
	dff PC_2_dffs 		[0:15]	(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	
	/*D*/
	dff compare_dffs			(.q(compare_q), .d(compare), .clk(clk), .rst(rst));
	dff I_mux_out_dffs 	[0:15]	(.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst));
	
	/*EX*/
	dff bypass_dffs 	[0:15]	(.q(bypass_q), .d(bypass), .clk(clk), .rst(rst));
	dff ALU_cOut_dffs 	[0:15]	(.q(ALU_cOut_q), .d(ALU_cOut), .clk(clk), .rst(rst));
	dff ALU_out_dffs 	[0:15]	(.q(ALU_out_q), .d(ALU_out), .clk(clk), .rst(rst));
	
	/*MEM*/
	dff mem_mem_out_dffs[0:15]	(.q(mem_mem_out_q), .d(mem_mem_out), .clk(clk), .rst(rst));
	
	
endmodule
`default_nettype wire