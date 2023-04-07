
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_DEX (
	/*F*/	PC_2_q,			PC_2,
			PC_2_D_q,		PC_2_D,
	/*ctr*/	rf_writeEn_q,	rf_writeEn,
	/*D*/	read1OutData_q,	read1OutData,
			read2OutData_q,	read2OutData,
			compare_q,		compare,	
			ALU_op_q,		ALU_op,
			ALUsrc_q,		ALUsrc,
			//PC_sel_q,		PC_sel,
			//DI_sel_q,		DI_sel,
			rev_sel_q,		rev_sel,
			invB_q,			invB,
			invA_q,			invA,
			B_op_q,			B_op,
			B_q,			B,
			memreg_q,		memreg,
			bypass_sel_q,	bypass_sel,
			diff_op_q,		diff_op,
			mem_writeEn_q,	mem_writeEn,
			halt_q,			halt,
			I_mux_out_q,	I_mux_out,	

			clk, rst);
						
	/*F*/	
	output wire [15:0] 	PC_2_q;			input wire [15:0]	PC_2;
	output wire [15:0]	PC_2_D_q;		input wire [15:0]	PC_2_D;
	
	/*ctr*/
	output wire			rf_writeEn_q;	input wire 		rf_writeEn;
	
	/*D*/
	output wire [15:0]	read1OutData_q;	input wire [15:0]	read1OutData;
	output wire [15:0]	read2OutData_q;	input wire [15:0]	read2OutData;
	output wire			compare_q;		input wire 		compare;
	output wire[2:0]	ALU_op_q;		input wire[2:0]	ALU_op;
	output wire			ALUsrc_q;		input wire 		ALUsrc;
	//output wire			PC_sel_q;		input wire 		PC_sel;
	//output wire			DI_sel_q;		input wire 		DI_sel;
	output wire			rev_sel_q;		input wire 		rev_sel;
	output wire			invB_q;			input wire 		invB;
	output wire			invA_q;			input wire 		invA;
	output wire[1:0]	B_op_q;			input wire[1:0]	B_op;
	output wire			B_q;			input wire 		B;
	output wire[1:0]	memreg_q;		input wire[1:0]	memreg;
	output wire[1:0]	bypass_sel_q;	input wire[1:0]	bypass_sel;
	output wire[1:0]	diff_op_q;		input wire[1:0]	diff_op;
	output wire[1:0]	mem_writeEn_q;	input wire[1:0] mem_writeEn;
	output wire[15:0] 	I_mux_out_q;	input wire[15:0] I_mux_out;
	output wire			halt_q;			input wire 	halt;	

    input wire     clk;					input wire     rst;

	/*F*/
	dff PC_2_dffs 		[0:15]	(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	dff PC_2_D_dffs 	[0:15]	(.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	
	/*ctr*/
	dff rf_writeEn_dffs			(.q(rf_writeEn_q),	.d(rf_writeEn),.clk(clk), .rst(rst));
	
	/*D*/
	dff r1d_dffs 		[0:15]	(.q(read1OutData_q), .d(read1OutData), .clk(clk), .rst(rst));
	dff r2d_dffs 		[0:15]	(.q(read2OutData_q), .d(read2OutData), .clk(clk), .rst(rst));
	dff compare_dffs			(.q(compare_q),	.d(compare),.clk(clk), .rst(rst));
	dff ALU_op_dffs		[0:2]	(.q(ALU_op_q), 	.d(ALU_op), .clk(clk), .rst(rst));
	dff ALU_src_dffs			(.q(ALUsrc_q), 	.d(ALUsrc), .clk(clk), .rst(rst));
	//dff PC_sel_dffs				(.q(PC_sel_q), 	.d(PC_sel), .clk(clk), .rst(rst));
	//dff DI_sel_dffs				(.q(DI_sel_q), 	.d(DI_sel), .clk(clk), .rst(rst));
	dff rev_sel_dffs			(.q(rev_sel_q), .d(rev_sel),.clk(clk), .rst(rst));
	dff invB_dffs				(.q(invB_q),	.d(invB), 	.clk(clk), .rst(rst));
	dff invA_dffs				(.q(invA_q),	.d(invA), 	.clk(clk), .rst(rst));
	dff B_op_dffs		[0:1]	(.q(B_op_q),	.d(B_op), 	.clk(clk), .rst(rst));
	dff B_q_dffs				(.q(B_q), 		.d(B), 		.clk(clk), .rst(rst));
	dff memreg_dffs		[0:1]	(.q(memreg_q), 	.d(memreg), .clk(clk), .rst(rst));
	dff bypass_sel_dffs	[0:1]	(.q(bypass_sel_q),.d(bypass_sel), .clk(clk), .rst(rst));
	dff diff_op_dffs	[0:1]	(.q(diff_op_q),	.d(diff_op), .clk(clk), .rst(rst));
	dff mem_writeEn_dffs[0:1]	(.q(mem_writeEn_q), .d(mem_writeEn), .clk(clk), .rst(rst));
	dff halt_dffs 				(.q(halt_q), .d(halt), .clk(clk), .rst(rst));
	dff I_mux_out_dffs 	[0:15]	(.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst));
	
endmodule
`default_nettype wire