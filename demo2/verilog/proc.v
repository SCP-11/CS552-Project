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
				I_mem_out,	I_mem_out_D,	I_mem_out_EX,	I_mem_out_MEM,	
				JPB_mux_out
				;
	wire 		nop;
				
	/*Ctr*/		
	wire [2:0]		rf_sel_out_WB,		rf_sel_out_MEM,	rf_sel_out_EX,		rf_sel_out_ctr;
   	/*D*/	
	wire [15:0] read1OutData_EX, 	writeInData_q, 
				read1OutData_D, 	writeInData, 
				read2OutData_MEM,	read2OutData_EX,	read2OutData_D,
				I_mux_out_q,	I_mux_out_MEM,	I_mux_out_EX,	I_mux_out,	I
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
	wire [15:0]	add_mux_out,
				ALU_out_WB,	ALU_out_MEM,	ALU_out_EX, 
				bypass_WB, 	bypass_MEM,		bypass_EX;
	wire 		ALUsrc_q,	ALUsrc, 
				PC_sel_q,	PC_sel, 
				PC_sel_final,
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
	wire		J_D,	J_EX,	J_MEM;
	wire 		stall;
	
	fetch fetch0( 	.PC_2_D(PC_2_D_F), 	.PC_2(PC_2_F), 	.I_mem_out(I_mem_out),
					/*.pcNext(pcNext),*/	.JPB_mux_out(JPB_mux_out),	.add_mux_out(add_mux_out),	.en(~halt_D&~stall),	
					.PC_sel(PC_sel_final),	.DI_sel(DI_sel_q),
					.clk(clk), .rst(rst)
					);
	
	assign nop = rst|J_D|J_EX|B_take;
	
	register_FD rg_FD(
	/*F*/	.I_mem_out_q(I_mem_out_D),			.I_mem_out(I_mem_out),
			.PC_2_q(PC_2_DE),					.PC_2(PC_2_F),	
			.PC_2_D_q(PC_2_D_D),				.PC_2_D(PC_2_D_F),	
			.nop(nop),
			.clk(clk), .rst(1'b0),	.en(~stall)
			);

	control ctr (	/*F*/	.halt(halt_D),
					/*ctr*/	.J_D(J_D),
					/*D*/	.rf_sel(rf_sel), .I_sel(I_sel), .rf_writeEn(rf_writeEn_ctr), .I_op(I_mem_out_D[15:11]),
					/*EX*/	.ALUsrc(ALUsrc), .ALU_op(ALU_op), .PC_sel(PC_sel), .DI_sel(DI_sel), 
							.rev_sel(rev_sel), .func(I_mem_out_D[1:0]), .invB(invB), .invA(invA), .B_op(B_op), .B(B), 
							.bypass_sel(bypass_sel), .B_take(B_take),
					/*MEM*/	.mem_writeEn(mem_writeEn_D),
					/*WB*/	.memreg(memreg_D), .diff_op(diff_op_D), .compare(compare));
	
	decode decode0(	.read1OutData(read1OutData_D), .read2OutData(read2OutData_D), .I_mux_out(I_mux_out), 
					.rf_sel_out(rf_sel_out_ctr),
					.I_mem_out(I_mem_out_D), .writeInData(writeInData), .rf_sel_in(rf_sel_out_WB),
	/*control*/		.rf_sel(rf_sel), .I_sel(I_sel), 
	/*WB*/			.rf_writeEn(rf_writeEn_WB),
					.clk(clk), .rst(rst));
					
		
	assign stall = 	1'b0;//((~mem_writeEn_EX[0])/*ID/EX.MemRead*/ & (rf_sel_out_EX != 3'b000) & 
					//((rf_sel_out_EX == I_mem_out_q[10:8]) | (rf_sel_out_EX == I_mem_out_q[7:5])));
	assign PC_sel_final = (B_take|J_EX)? 1'b0:	PC_sel;
					
	//Forwarding
	wire [15:0]	read1OutData_DF,	read2OutData_DF;
	wire [15:0]	EE_forwarding_data;
	wire 		EE_forwarding_1,	EE_forwarding_2;
	wire [15:0]	ME_forwarding_data;
	wire 		ME_forwarding_1,	ME_forwarding_2;
	
	assign read1OutData_DF = 	(EE_forwarding_1)? EE_forwarding_data:	
								(ME_forwarding_1)?	ME_forwarding_data:	read1OutData_D;
	assign read2OutData_DF = 	(EE_forwarding_2)? EE_forwarding_data:	
								(ME_forwarding_2)?	ME_forwarding_data:	read2OutData_D;
	
	register_DEX rg_DEX(
	/*F*/	.PC_2_q(PC_2_EX),					.PC_2(PC_2_DE),	
			.PC_2_D_q(PC_2_D_EX),				.PC_2_D(PC_2_D_D),	
			.I_mem_out_q(I_mem_out_EX),			.I_mem_out(I_mem_out_D),
	/*ctr*/	.rf_writeEn_q(rf_writeEn_EX),		.rf_writeEn(rf_writeEn_ctr),
			.rf_sel_out_q(rf_sel_out_EX),		.rf_sel_out(rf_sel_out_ctr),
			.PC_sel_q(PC_sel_q),				.PC_sel(PC_sel),
			.DI_sel_q(DI_sel_q),				.DI_sel(DI_sel),
			.J_q(J_EX),							.J(J_D),
	/*D*/	.read1OutData_q(read1OutData_EX),	.read1OutData(read1OutData_DF),	
			.read2OutData_q(read2OutData_EX),	.read2OutData(read2OutData_DF),	
			.compare_q(compareEX),				.compare(compare),
			.ALU_op_q(ALU_op_q),				.ALU_op(ALU_op),
			.ALUsrc_q(ALUsrc_q),				.ALUsrc(ALUsrc),
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
			
			.clk(clk), .rst(rst|B_take),	.en(1'b1)
			);
				
	//EX->EX forwarding
	assign 		EE_forwarding_data = (memreg_EX[1])? (memreg_EX[0])? bypass_EX: PC_2_EX:
										(memreg_EX[0])? I_mux_out_EX: 16'hxxxx;
	assign 		EE_forwarding_1 = (memreg_EX !== 2'b00) & (rf_sel_out_EX === I_mem_out_D[10:8])	&	rf_writeEn_EX;
	assign 		EE_forwarding_2 = (memreg_EX !== 2'b00) & (rf_sel_out_EX === I_mem_out_D[7:5])	&	rf_writeEn_EX;
	
	/*												EXECUTE														*/				
	execute EX(	
	/*OUT*/		/*.pcNext(pcNext), */.JPB_mux_out(JPB_mux_out),	.add_mux_out(add_mux_out),
				.ALU_out(ALU_out_EX), .bypass(bypass_EX), 
				.ALU_cOut(ALU_cOut_EX), .ALU_Of1(ALU_Of1_EX),
	/*IN*/		.read1OutData(read1OutData_EX), .read2OutData(read2OutData_EX), .I(I_mux_out_EX), .diff_op(diff_op_EX),
				.PC_2(PC_2_EX), .PC_2_D(PC_2_D_EX),
	/*control*/	.ALU_Oper(ALU_op_q), .ALUsrc(ALUsrc_q), .PC_sel(PC_sel_q), .DI_sel(DI_sel_q),
				.rev_sel(rev_sel_q), .invB(invB_q), .invA(invA_q), .B_op(B_op_q), .B(B_q), .bypass_sel(bypass_sel_q), .B_take(B_take));
				

	
	
	register_EXMEM rg_EXM(
	/*F*/	.PC_2_q(PC_2_MEM),					.PC_2(PC_2_EX),
			.I_mem_out_q(I_mem_out_MEM),		.I_mem_out(I_mem_out_EX),
	/*ctr*/	.rf_writeEn_q(rf_writeEn_MEM),		.rf_writeEn(rf_writeEn_EX),
			.rf_sel_out_q(rf_sel_out_MEM),		.rf_sel_out(rf_sel_out_EX),
			.halt_q(halt_MEM),					.halt(halt_EX),
			.J_q(J_MEM),						.J(J_EX),				
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
	
	//////////////							MEM->EX forwarding							////////////////////
	assign 		ME_forwarding_data = (memreg_MEM[1])? (memreg_MEM[0])? bypass_MEM: PC_2_MEM:
										(memreg_MEM[0])? I_mux_out_MEM: mem_mem_out;
	assign 		ME_forwarding_1 = (rf_sel_out_MEM === I_mem_out_D[10:8])&	rf_writeEn_MEM;
	assign 		ME_forwarding_2 = (rf_sel_out_MEM === I_mem_out_D[7:5])&	rf_writeEn_MEM;
	
	
	/*												MEMORY														*/	
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
