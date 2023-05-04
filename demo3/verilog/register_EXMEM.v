
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_EXMEM (
	/*F*/	PC_2_q,			PC_2,
			I_mem_out_q,	I_mem_out,
			err_q,			err,
	/*ctr*/	rf_writeEn_q,	rf_writeEn,
			rf_sel_out_q,	rf_sel_out,
			J_q,			J,
	/*D*/	read2OutData_q,	read2OutData,	
			compare_q,		compare,
			I_mux_out_q,	I_mux_out,
			memreg_q, 		memreg,
			diff_op_q,		diff_op,
			mem_writeEn_q,	mem_writeEn,
			halt_q,			halt,	
	/*EX*/	bypass_q,		bypass,	
			ALU_Of1_q,		ALU_Of1,	
			//pcNext_q,		pcNext,	
			ALU_out_q,		ALU_out,	
			ALU_cOut_q,		ALU_cOut,
			B_take_q,		B_take,
			
			clk, rst, en
			);
			
	/*F*/
	output wire[15:0]	PC_2_q;			input wire[15:0]	PC_2;
	output wire [15:0]	I_mem_out_q;	input wire [15:0]	I_mem_out;
	output wire			err_q;			input wire			err;
	
	/*ctr*/
	output wire			rf_writeEn_q;	input wire 		rf_writeEn;
	output wire	[2:0]	rf_sel_out_q;	input wire 	[2:0]		rf_sel_out;
	output wire 		J_q;			input wire		J;
	
	/*D*/	
	output wire[15:0]	read2OutData_q;	input wire[15:0]	read2OutData;
	output wire			compare_q;		input wire 			compare;
	output wire[15:0]	I_mux_out_q;	input wire[15:0]	I_mux_out;
	output wire[1:0]	memreg_q;		input wire[1:0]		memreg;
	output wire[1:0]	diff_op_q;		input wire[1:0]		diff_op;
	output wire[1:0]	mem_writeEn_q;	input wire[1:0]		mem_writeEn;
	output wire			halt_q;			input wire 			halt;
	/*EX*/
	output wire [15:0] 	bypass_q;		input wire [15:0] 	bypass;
	output wire			ALU_Of1_q;		input wire 			ALU_Of1;
	//output wire [15:0] 	pcNext_q;		input wire[15:0]	pcNext;
	output wire [15:0]	ALU_out_q;		input wire [15:0] 	ALU_out;
	output wire	 		ALU_cOut_q;		input wire 			ALU_cOut;
	output wire	 		B_take_q;		input wire 			B_take;
	
    input wire	clk;	input wire	rst;	input wire	en;
	
	wire 		reg_en;
	assign reg_en = en&~rst;
    
	
	/*F*/
	register#(.size(16)) PC_2_dffs 		(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(16)) I_mem_out_dffs 	(.q(I_mem_out_q), .d(I_mem_out), .clk(clk), .rst(rst), .en(reg_en));
	register#(.size(1)) err_registers		(.q(err_q),	.d(err),	.clk(clk), .rst(rst), .en(reg_en));
	
	
	/*ctr*/
	register#(.size(1)) rf_writeEn_dffs	(.q(rf_writeEn_q),	.d(rf_writeEn),.clk(clk), .rst(rst),.en(reg_en));
	register#(.size(3)) rf_sel_out_dffs		(.q(rf_sel_out_q),	.d(rf_sel_out),.clk(clk), .rst(rst), .en(reg_en));
	register#(.size(1)) J_dffs		(.q(J_q),			.d(J),.clk(clk), .rst(rst), .en(reg_en));
	
	/*D*/
	register#(.size(16)) r2d_dffs 		(.q(read2OutData_q), .d(read2OutData), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(1)) compare_dffs	(.q(compare_q), .d(compare), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(16)) I_mux_out_dffs (.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(2)) memreg_dffs		(.q(memreg_q), 	.d(memreg), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(2)) diff_op_dffs	(.q(diff_op_q),	.d(diff_op), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(2)) mem_writeEn_dffs(.q(mem_writeEn_q), .d(mem_writeEn), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(1)) halt_dffs 		(.q(halt_q), .d(halt), .clk(clk), .rst(rst),.en(reg_en));
	
	/*EX*/
	register#(.size(16))bypass_dffs 	(.q(bypass_q), .d(bypass), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(1)) ALU_Of1_dffs 	(.q(ALU_Of1_q), .d(ALU_Of1), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(16))ALU_out_dffs 	(.q(ALU_out_q), .d(ALU_out), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(1)) ALU_cOut_dffs 	(.q(ALU_cOut_q), .d(ALU_cOut), .clk(clk), .rst(rst),.en(reg_en));
	register#(.size(1)) B_take_dffs 	(.q(B_take_q), .d(B_take), .clk(clk), .rst(rst),.en(reg_en));
endmodule
`default_nettype wire