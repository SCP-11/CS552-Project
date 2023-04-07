
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
	/*ctr*/	rf_writeEn_q,	rf_writeEn,
	/*D*/	compare_q,		compare,
			I_mux_out_q,	I_mux_out,
			memreg_q, 		memreg,
			diff_op_q,		diff_op,
	/*EX*/	ALU_out_q,		ALU_out,		
			ALU_cOut_q,		ALU_cOut,	
			bypass_q,		bypass,
			ALU_Of1_q,		ALU_Of1,	
	/*MEM*/	mem_mem_out_q,	mem_mem_out,	

			clk, rst
			);

	/*F*/
	output wire[15:0]	PC_2_q;			input wire[15:0]	PC_2;
	
	/*ctr*/
	output wire			rf_writeEn_q;	input wire 		rf_writeEn;
	
    /*D*/	
	output wire			compare_q;		input wire 			compare;
	output wire[15:0] 	I_mux_out_q;	input wire[15:0] 	I_mux_out;
	output wire[1:0]	memreg_q;		input wire[1:0]		memreg;
	output wire[1:0]	diff_op_q;		input wire[1:0]		diff_op;
	
	/*EX*/
	output wire [15:0] 	ALU_out_q;		input wire [15:0] 	ALU_out;
	output wire			ALU_cOut_q;		input wire 	ALU_cOut;
	output wire [15:0] 	bypass_q;		input wire [15:0] bypass;
	output wire			ALU_Of1_q;		input wire 			ALU_Of1;
	
	/*MEM*/	
	output wire	[15:0]	mem_mem_out_q;	input wire	[15:0]	mem_mem_out;
	
    input wire     clk;					input wire     rst;

	/*F*/
	dff PC_2_dffs 		[0:15]	(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	
	/*ctr*/
	dff rf_writeEn_dffs			(.q(rf_writeEn_q),	.d(rf_writeEn),.clk(clk), .rst(rst));
	
	/*D*/
	dff compare_dffs			(.q(compare_q), .d(compare), .clk(clk), .rst(rst));
	dff I_mux_out_dffs 	[0:15]	(.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst));
	dff memreg_dffs		[0:1]	(.q(memreg_q), 	.d(memreg), .clk(clk), .rst(rst));
	dff diff_op_dffs	[0:1]	(.q(diff_op_q),	.d(diff_op), .clk(clk), .rst(rst));
	
	/*EX*/
	dff ALU_cOut_dffs 	[0:15]	(.q(ALU_cOut_q), .d(ALU_cOut), .clk(clk), .rst(rst));
	dff ALU_out_dffs 	[0:15]	(.q(ALU_out_q), .d(ALU_out), .clk(clk), .rst(rst));
	dff bypass_dffs 	[0:15]	(.q(bypass_q), .d(bypass), .clk(clk), .rst(rst));
	dff ALU_Of1_dffs 			(.q(ALU_Of1_q), .d(ALU_Of1), .clk(clk), .rst(rst));
	
	/*MEM*/
	dff mem_mem_out_dffs[0:15]	(.q(mem_mem_out_q), .d(mem_mem_out), .clk(clk), .rst(rst));
	
	
endmodule
`default_nettype wire