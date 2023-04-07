
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_EXMEM (
	/*D*/	compare_q,	compare,
	/*EX*/	bypass_q,	bypass,	
	/*MEM*/	pcNext_q,	read2OutData_q,	halt_q,	mem_writeEn_q,	ALU_out_q,	ALU_cOut_q,
			pcNext,	read2OutData,	halt,	mem_writeEn,	ALU_out,	ALU_cOut,
	/*WB*/	PC_2_q,	I_mux_out_q,
			PC_2,	I_mux_out,
			
			clk, rst
			);
	/*D*/	
	output wire	compare_q;
	input wire 	compare;
	
    output wire [15:0] 	
	/*EX*/	PC_2_q,	pcNext_q,	read2OutData_q,	I_mux_out_q,	ALU_out_q;
	input wire [15:0] 	
	/*EX*/	PC_2,	pcNext,	read2OutData,	I_mux_out,	ALU_out;
	
	/*EX*/
	output wire [15:0] bypass_q;	input wire [15:0] bypass;
	
	
	/*MEM*/	
	output wire	[1:0] 	mem_writeEn_q;
	input wire	[1:0]	mem_writeEn;
	output wire	halt_q, ALU_cOut_q;	
	input wire 	halt,	ALU_cOut;
	
    input wire     clk;
    input wire     rst;
	
	/*D*/
	dff compare_dffs			(.q(compare_q), .d(compare), .clk(clk), .rst(rst));
	
	/*EX*/
	dff bypass_dffs 	[0:15]	(.q(bypass_q), .d(bypass), .clk(clk), .rst(rst));
	
	
	/*MEM*/
	dff pcNext_dffs 	[0:15]	(.q(pcNext_q), .d(pcNext), .clk(clk), .rst(rst));
	dff r2d_dffs 		[0:15]	(.q(read2OutData_q), .d(read2OutData), .clk(clk), .rst(rst));
	dff halt_dffs 				(.q(halt_q), .d(halt), .clk(clk), .rst(rst));
	dff mem_writeEn_dffs[0:1]	(.q(mem_writeEn_q), .d(mem_writeEn), .clk(clk), .rst(rst));
	dff ALU_out_dffs 	[0:15]	(.q(ALU_out_q), .d(ALU_out), .clk(clk), .rst(rst));
	
	/*WB*/
	dff PC_2_dffs 		[0:15]	(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	dff I_mux_out_dffs 	[0:15]	(.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst));
	dff ALU_cOut_dffs 	[0:15]	(.q(ALU_cOut_q), .d(ALU_cOut), .clk(clk), .rst(rst));
	
endmodule
`default_nettype wire