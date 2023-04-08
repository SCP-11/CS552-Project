/* $Author: sinclair $ */
/* $LastChangedDate: 2020-02-09 17:03:45 -0600 (Sun, 09 Feb 2020) $ */
/* $Rev: 46 $ */
`default_nettype none
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input wire clk;
   input wire rst;

   output reg err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here -- should include instantiations of fetch, decode, execute, mem and wb modules */
   
	/*F*/
	wire [15:0]	I_mem_out_q, pcNext,
				PC_2_D_EX,	PC_2_D_D, PC_2_D_F, 
				PC_2_WB,	PC_2_MEM,	PC_2_EX,	PC_2_DE,	PC_2_F, 
				I_mem_out, JPB_mux_out
				;
	/*Ctr*/		
	wire [2:0]		rf_sel_out_WB,		rf_sel_out_MEM,	rf_sel_out_EX,		rf_sel_out_ctr;
   	/*D*/	
	wire [15:0] read1OutData_q, writeInData_q, 
				read1OutData, writeInData, 
				read2OutData_MEM,	read2OutData_EX,	read2OutData_D,
				I_mux_out_q,	I_mux_out_MEM,	I_mux_out_EX,	 I_mux_out,	I
				;
	wire [1:0] 	rf_sel, I_sel, 
				B_op_q,	B_op, 
				bypass_sel_q,	bypass_sel;
	wire 		rf_writeEn_WB,	rf_writeEn_MEM,	rf_writeEn_EX,	rf_writeEn_ctr, 
				invB_q,	invB,
				invA_q, invA,
				B_q,	B, 
				halt_WB,	halt_MEM,	halt_EX, halt_D;
	/*EX*/
	wire [15:0] ALU_out_WB,	ALU_out_MEM,	ALU_out_EX, 
				bypass_WB, 	bypass_MEM,		bypass_EX;
	wire 		ALUsrc_q,	ALUsrc, 
				PC_sel_q,	PC_sel, 
				DI_sel_q,	DI_sel, 
				rev_sel_q,	rev_sel, 
				ALU_cOut_WB,	ALU_cOut_MEM,	ALU_cOut_EX, 
				ALU_Of1_WB,	ALU_Of1_MEM,	ALU_Of1_EX;
				
	wire [2:0] 	ALU_op_q,	ALU_op;
	/*MEM*/
	wire [15:0] mem_mem_out_q, mem_mem_out;
	wire [1:0] 	mem_writeEn_MEM,	mem_writeEn_EX,	mem_writeEn_D;
	/*WB*/
	wire [1:0] 	memreg_WB,	memreg_MEM,	memreg_EX,	memreg_D, 
				diff_op_WB,	diff_op_MEM,	diff_op_EX,	diff_op_D;
	wire compare_q,	compareM,	compareEX,	compare, B_take;
	
	wire 		en_EXMEM,	en_FD;
	
	fetch fetch0( 	.PC_2_D(PC_2_D_F), 	.PC_2(PC_2_F), 	.I_mem_out(I_mem_out),
					.pcNext(pcNext),	.JPB_mux_out(JPB_mux_out),	.halt(halt_D),	.PC_sel(PC_sel),	.DI_sel(DI_sel),
					.clk(clk), .rst(rst)
					);
	
	assign I = (rst)? 16'h0800:	I_mem_out;
	register_FD rg_FD(
	/*F*/	.I_mem_out_q(I_mem_out_q),			.I_mem_out(I),
			.PC_2_q(PC_2_DE),					.PC_2(PC_2_F),	
			.PC_2_D_q(PC_2_D_D),				.PC_2_D(PC_2_D_F),	
			
			.clk(clk), .rst(1'b0),	.en(1'b1)
			);

	control ctr (	/*F*/	.halt(halt_D),
					/*D*/	.rf_sel(rf_sel), .I_sel(I_sel), .rf_writeEn(rf_writeEn_ctr), .I_op(I_mem_out_q[15:11]),
					/*EX*/	.ALUsrc(ALUsrc), .ALU_op(ALU_op), .PC_sel(PC_sel), .DI_sel(DI_sel), 
							.rev_sel(rev_sel), .func(I_mem_out_q[1:0]), .invB(invB), .invA(invA), .B_op(B_op), .B(B), 
							.bypass_sel(bypass_sel), .B_take(B_take),
					/*MEM*/	.mem_writeEn(mem_writeEn_D),
					/*WB*/	.memreg(memreg_D), .diff_op(diff_op_D), .compare(compare));
				
	decode decode0(	.read1OutData(read1OutData), .read2OutData(read2OutData_D), .I_mux_out(I_mux_out), 
					.rf_sel_out(rf_sel_out_ctr),
					.I_mem_out(I_mem_out_q), .writeInData(writeInData), .rf_sel_in(rf_sel_out_WB),
	/*control*/		.rf_sel(rf_sel), .I_sel(I_sel), 
	/*WB*/			.rf_writeEn(rf_writeEn_WB),
					.clk(clk), .rst(rst));
						
	register_DEX rg_DEX(
	/*F*/	.PC_2_q(PC_2_EX),					.PC_2(PC_2_DE),	
			.PC_2_D_q(PC_2_D_EX),				.PC_2_D(PC_2_D_D),	
	/*ctr*/	.rf_writeEn_q(rf_writeEn_EX),		.rf_writeEn(rf_writeEn_ctr),
			.rf_sel_out_q(rf_sel_out_EX),		.rf_sel_out(rf_sel_out_ctr),
			.PC_sel_q(PC_sel_q),				.PC_sel(PC_sel),
	/*D*/	.read1OutData_q(read1OutData_q),	.read1OutData(read1OutData),	
			.read2OutData_q(read2OutData_EX),	.read2OutData(read2OutData_D),	
			.compare_q(compareEX),				.compare(compare),
			.ALU_op_q(ALU_op_q),				.ALU_op(ALU_op),
			.ALUsrc_q(ALUsrc_q),				.ALUsrc(ALUsrc),
			.DI_sel_q(DI_sel_q),				.DI_sel(DI_sel),
			.rev_sel_q(rev_sel_q),				.rev_sel(rev_sel),	
			.invB_q(invB_q),					.invB(invB),
			.invA_q(invA_q),					.invA(invA),
			.B_op_q(B_op_q),					.B_op(B_op),
			.B_q(B_q),							.B(B),
			.memreg_q(memreg_EX),				.memreg(memreg_D),
			.bypass_sel_q(bypass_sel_q),		.bypass_sel(bypass_sel),
			.diff_op_q(diff_op_EX),				.diff_op(diff_op_D),
			.mem_writeEn_q(mem_writeEn_EX),		.mem_writeEn(mem_writeEn_D),
			.halt_q(halt_EX),					.halt(halt_D),	
			.I_mux_out_q(I_mux_out_EX),			.I_mux_out(I_mux_out),	
			
			.clk(clk), .rst(rst),	.en(1'b1)
			);
				
	execute EX(	
	/*OUT*/		.pcNext(pcNext), .JPB_mux_out(JPB_mux_out),	.ALU_out(ALU_out_EX), .bypass(bypass_EX), 
				.ALU_cOut(ALU_cOut_EX), .ALU_Of1(ALU_Of1_EX),
	/*IN*/		.read1OutData(read1OutData_q), .read2OutData(read2OutData_EX), .I(I_mux_out_EX), .PC_2(PC_2_EX), .PC_2_D(PC_2_D_EX),
	/*control*/	.ALU_Oper(ALU_op_q), .ALUsrc(ALUsrc_q), .PC_sel(PC_sel_q), .DI_sel(DI_sel_q),
				.rev_sel(rev_sel_q), .invB(invB_q), .invA(invA_q), .B_op(B_op_q), .B(B_q), .bypass_sel(bypass_sel_q), .B_take(B_take));
				
	register_EXMEM rg_EXM(
	/*F*/	.PC_2_q(PC_2_MEM),					.PC_2(PC_2_EX),
	/*ctr*/	.rf_writeEn_q(rf_writeEn_MEM),		.rf_writeEn(rf_writeEn_EX),
			.rf_sel_out_q(rf_sel_out_MEM),		.rf_sel_out(rf_sel_out_EX),
			.halt_q(halt_MEM),					.halt(halt_EX),				
	/*D*/	.read2OutData_q(read2OutData_MEM),	.read2OutData(read2OutData_EX),	
			.compare_q(compareM),				.compare(compareEX),
			.I_mux_out_q(I_mux_out_MEM),		.I_mux_out(I_mux_out_EX),
			.memreg_q(memreg_MEM),				.memreg(memreg_EX),
			.diff_op_q(diff_op_MEM),			.diff_op(diff_op_EX),
			.mem_writeEn_q(mem_writeEn_MEM),	.mem_writeEn(mem_writeEn_EX),	
	/*EX*/	.bypass_q(bypass_MEM),				.bypass(bypass_EX),
			.ALU_Of1_q(ALU_Of1_MEM),			.ALU_Of1(ALU_Of1_EX),
			.ALU_out_q(ALU_out_MEM),			.ALU_out(ALU_out_EX),	
			.ALU_cOut_q(ALU_cOut_MEM),			.ALU_cOut(ALU_cOut_EX),
			
			.clk(clk), .rst(rst),	.en(1'b1)
			);
	
	memory memory0(.mem_mem_out(mem_mem_out), .writeData(read2OutData_MEM), .aluResult(ALU_out_MEM), .clk(clk), .rst(rst), 
				/*control*/.mem_writeEn(mem_writeEn_MEM), .halt(halt_MEM));
			
	register_MW rg_MW(
	/*F*/	.PC_2_q(PC_2_WB),					.PC_2(PC_2_MEM),
	/*ctr*/	.rf_writeEn_q(rf_writeEn_WB),		.rf_writeEn(rf_writeEn_MEM),
			.rf_sel_out_q(rf_sel_out_WB),		.rf_sel_out(rf_sel_out_MEM),
			.halt_q(halt_WB),					.halt(halt_MEM),				
	/*D*/	.compare_q(compare_q),				.compare(compareM),
			.I_mux_out_q(I_mux_out_q),			.I_mux_out(I_mux_out_MEM),
			.memreg_q(memreg_WB),				.memreg(memreg_MEM),
			.diff_op_q(diff_op_WB),				.diff_op(diff_op_MEM),
	/*EX*/	.ALU_out_q(ALU_out_WB),				.ALU_out(ALU_out_MEM),	
			.ALU_cOut_q(ALU_cOut_WB),			.ALU_cOut(ALU_cOut_MEM),
			.bypass_q(bypass_WB),				.bypass(bypass_MEM),
			.ALU_Of1_q(ALU_Of1_WB),				.ALU_Of1(ALU_Of1_MEM),
	/*MEM*/	.mem_mem_out_q(mem_mem_out_q),		.mem_mem_out(mem_mem_out),	
	
			.clk(clk), .rst(rst),	.en(1'b1)
			);

	wb WB (	.rf_write(writeInData), .mem_mem_out(mem_mem_out_q), .PC_2(PC_2_WB), .I(I_mux_out_q), 
			.ALU_out(ALU_out_WB), .ALU_carry(ALU_cOut_WB), .ALU_Of1(ALU_Of1_WB), 
			/*control*/ .memreg(memreg_WB), .diff_op(diff_op_WB), .compare(compare_q), .bypass(bypass_WB));
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
