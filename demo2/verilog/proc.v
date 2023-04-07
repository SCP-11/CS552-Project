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
	wire [15:0]	PC_2_D_q, PC_2_q, I_mem_out_q, pcNext_q,
				PC_2_D, PC_2, I_mem_out, pcNext
				;
   	/*D*/	
	wire [15:0] read1OutData_q, read2OutData_q, writeInData_q, I_mux_out_q,
				read1OutData, read2OutData, writeInData, I_mux_out
				;
	wire [1:0] rf_sel, I_sel, B_op, bypass_sel;
	wire rf_writeEn, invB, invA, B, halt_q, halt;
	/*EX*/
	wire [15:0] ALU_out_q,	ALU_out, bypass_q, bypass;
	wire ALUsrc, PC_sel, DI_sel, rev_sel, ALU_cOut_q,	ALU_cOut, ALU_Of1;
	wire [2:0] ALU_op;
	/*MEM*/
	wire [15:0] mem_mem_out_q, mem_mem_out;
	wire [1:0] mem_writeEn_q, mem_writeEn;
	/*WB*/
	wire [1:0] memreg, diff_op;
	wire compare_q, compare, B_take;
   
	fetch fetch0(.pcNext(pcNext), .clk(clk), .rst(rst), .PC_2_D(PC_2_D), .PC_2(PC_2), .I_mem_out(I_mem_out), .halt(halt));
	
	register_FD rg_FD(/*D*/	.I_mem_out_q(I_mem_out_q),
							.I_mem_out(I_mem_out),
					/*EX*/	.PC_2_q(PC_2_q),	.PC_2_D_q(PC_2_D_q),	.pcNext_q(pcNext_q),
							.PC_2(PC_2),	.PC_2_D(PC_2_D),	.pcNext(PC_2_D),
					.clk(clk), .rst(rst));
					
	control ctr (	/*F*/	.halt(halt),
					/*D*/	.rf_sel(rf_sel), .I_sel(I_sel), .rf_writeEn(rf_writeEn), .I_op(I_mem_out_q[15:11]),
					/*EX*/	.ALUsrc(ALUsrc), .ALU_op(ALU_op), .PC_sel(PC_sel), .DI_sel(DI_sel), 
							.rev_sel(rev_sel), .func(I_mem_out_q[1:0]), .invB(invB), .invA(invA), .B_op(B_op), .B(B), .bypass_sel(bypass_sel), .B_take(B_take),
					/*MEM*/	.mem_writeEn(mem_writeEn),
					/*WB*/	.memreg(memreg), .diff_op(diff_op), .compare(compare));
				
	decode decode0(.read1OutData(read1OutData), .read2OutData(read2OutData), .I_mux_out(I_mux_out), .clk(clk), .rst(rst), .I_mem_out(I_mem_out), .writeInData(writeInData),
				/*control*/
				.rf_sel(rf_sel), .I_sel(I_sel), .rf_writeEn(rf_writeEn));
						
	register_DEX rg_DEX(
	/*D*/	.compare_q(compare_q),
			.compare(compare),
	/*EX*/	.PC_2_q(PC_2_q),	.PC_2_D_q(PC_2_D_q),	.pcNext_q(pcNext_q),	.read1OutData_q(read1OutData_q),
				.read2OutData_q(read2OutData_q),	.I_mux_out_q(I_mux_out_q),	
			.PC_2(PC_2),	.PC_2_D(PC_2_D),	.pcNext(pcNext),	.read1OutData(read1OutData),	
				.read2OutData(read2OutData),	.I_mux_out(I_mux_out),	
	/*MEM*/	.halt_q(halt_q),	.mem_writeEn_q(mem_writeEn_q),
			.halt(halt),	.mem_writeEn(mem_writeEn),
			.clk(clk), .rst(rst));
				
	execute EX(	.pcNext(pcNext), .ALU_out(ALU_out), .bypass(bypass), .ALU_cOut(ALU_cOut), .ALU_Of1(ALU_Of1),
				.read1OutData(read1OutData), .read2OutData(read2OutData), .I(I_mux_out), .PC_2(PC_2), .PC_2_D(PC_2_D),
				/*control*/
				.ALU_Oper(ALU_op), .ALUsrc(ALUsrc), .PC_sel(PC_sel), .DI_sel(DI_sel),
				.rev_sel(rev_sel), .invB(invB), .invA(invA), .B_op(B_op), .B(B), .bypass_sel(bypass_sel), .B_take(B_take));
				
	register_EXMEM rg_EXM(
	/*D*/	.compare_q(compare_q),	.compare(compare),
	/*EX*/	.bypass_q(bypass_q),	.bypass(bypass),
	/*MEM*/	.pcNext_q(pcNext_q),	.read2OutData_q(read2OutData_q),	.halt_q(halt_q),	.mem_writeEn_q(mem_writeEn_q),	
			.ALU_out_q(ALU_out_q),	.ALU_out(ALU_out),	
			.ALU_cOut_q(ALU_cOut_q),	.ALU_cOut(ALU_cOut),
			.pcNext(pcNext),	.read2OutData(read2OutData),	.halt(halt),	.mem_writeEn(mem_writeEn),		
	/*WB*/	.PC_2_q(PC_2_q),	.PC_2(PC_2),
			.I_mux_out_q(I_mux_out_q),	.I_mux_out(I_mux_out),
			.clk(clk), .rst(rst)
			);
	
	memory memory0(.mem_mem_out(mem_mem_out), .writeData(read2OutData), .aluResult(ALU_out), .clk(clk), .rst(rst), 
				/*control*/.mem_writeEn(mem_writeEn), .halt(halt));
			
	register_MW rg_MW(
	/*F*/	.PC_2_q(PC_2_q),	.PC_2(PC_2),
	/*D*/	.I_mux_out_q(I_mux_out_q),	.I_mux_out(I_mux_out),
			.compare_q(compare_q),	.compare(compare),
	/*EX*/	.ALU_out_q(ALU_out_q),	.ALU_out(ALU_out),	
			.ALU_cOut_q(ALU_cOut_q),.ALU_cOut(ALU_cOut),
			.bypass_q(bypass_q),	.bypass(bypass),
	/*MEM*/	.mem_mem_out_q(mem_mem_out_q),	.mem_mem_out(mem_mem_out),	
			.clk(clk), .rst(rst)
			);

	wb WB (.rf_write(writeInData), .mem_mem_out(mem_mem_out), .PC_2(PC_2), .I(I_mux_out), .ALU_out(ALU_out), .ALU_carry(ALU_cOut), .ALU_Of1(ALU_Of1), 
				/*control*/ .memreg(memreg), .diff_op(diff_op), .compare(compare), .bypass(bypass));
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
