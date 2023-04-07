
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register_DEX (
	/*D*/	compare_q,	compare,
	/*EX*/	PC_2_q,	PC_2_D_q,	pcNext_q,	read1OutData_q,	read2OutData_q,	I_mux_out_q,	
			PC_2,	PC_2_D,	pcNext,	read1OutData,	read2OutData,	I_mux_out,	
	/*MEM*/	halt_q,	mem_writeEn_q,
			halt,	mem_writeEn,
			clk, rst);

						
	/*D*/	
	output wire	compare_q;
	input wire 	compare;
	
	/*EX*/
    output wire [15:0] 	PC_2_q,	PC_2_D_q,	pcNext_q,	read1OutData_q,	
						read2OutData_q,	I_mux_out_q;
	input wire [15:0]	PC_2,	PC_2_D,	pcNext,	read1OutData,	
						read2OutData,	I_mux_out;
	
	/*MEM*/	
	output wire	halt_q, mem_writeEn_q;	
	input wire 	halt,	mem_writeEn;	

    input wire     clk;
    input wire     rst;

	/*D*/
	dff compare_dffs			(.q(compare_q), .d(compare), .clk(clk), .rst(rst));
	
	/*EX*/
	dff PC_2_dffs 		[0:15]	(.q(PC_2_q), .d(PC_2), .clk(clk), .rst(rst));
	dff PC_2_D_dffs 	[0:15]	(.q(PC_2_D_q), .d(PC_2_D), .clk(clk), .rst(rst));
	dff pcNext_dffs 	[0:15]	(.q(pcNext_q), .d(pcNext), .clk(clk), .rst(rst));
	dff r1d_dffs 		[0:15]	(.q(read1OutData_q), .d(read1OutData), .clk(clk), .rst(rst));
	dff r2d_dffs 		[0:15]	(.q(read2OutData_q), .d(read2OutData), .clk(clk), .rst(rst));
	dff I_mux_out_dffs 	[0:15]	(.q(I_mux_out_q), .d(I_mux_out), .clk(clk), .rst(rst));
	dff halt_dffs 				(.q(halt_q), .d(halt), .clk(clk), .rst(rst));
	dff mem_writeEn_dffs		(.q(mem_writeEn_q), .d(mem_writeEn), .clk(clk), .rst(rst));
	
endmodule
`default_nettype wire