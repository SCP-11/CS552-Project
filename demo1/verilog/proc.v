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
	/*D*/	
	wire [1:0] rf_mux, I_sel;
	wire rf_writeEn;
	/*EX*/
	wire ALUsrc, PC_sel, DI_sel, rev_sel;
	wire [2:0] ALU_op;
	/*MEM*/
	wire [1:0] mem_writeEn;
	/*WB*/
	wire [1:0] memreg, diff_op;
	wire compare, halt, B_take;
   
   
	wire [15:0] pcNext, PC_2_D, PC_2, I_mem_out, read1OutData, read2OutData, writeInData, ALU_out, I_mux_out, bypass,
				/*MEM*/ mem_mem_out;
	wire [1:0] mux_sel, B_op, bypass_sel;
	wire writeEn, ALU_cOut, invB, B, invA;
	fetch fetch0(.pcNext(pcNext), .clk(clk), .rst(rst), .PC_2_D(PC_2_D), .PC_2(PC_2), .I_mem_out(I_mem_out), .halt(halt));
	control ctr (/*F*/	.halt(halt),
				/*D*/	.rf_mux(rf_mux), .I_sel(I_sel), .rf_writeEn(rf_writeEn), .I_op(I_mem_out[15:11]),
				/*EX*/	.ALUsrc(ALUsrc), .ALU_op(ALU_op), .PC_sel(PC_sel), .DI_sel(DI_sel), 
						.rev_sel(rev_sel), .func(I_mem_out[1:0]), .invB(invB), .invA(invA), .B_op(B_op), .B(B), .bypass_sel(bypass_sel), .B_take(B_take),
				/*MEM*/	.mem_writeEn(mem_writeEn),
				/*WB*/	.memreg(memreg), .diff_op(diff_op), .compare(compare));
				
	decode decode0(.read1OutData(read1OutData), .read2OutData(read2OutData), .I_mux_out(I_mux_out), .clk(clk), .rst(rst), .I_mem_out(I_mem_out), .writeInData(writeInData),
				/*control*/
				.rf_mux(rf_mux), .I_sel(I_sel), .rf_writeEn(rf_writeEn));
				
	execute EX(	.pcNext(pcNext), .ALU_out(ALU_out), .bypass(bypass), .ALU_cOut(ALU_cOut),
				.read1OutData(read1OutData), .read2OutData(read2OutData), .I(I_mux_out), .PC_2(PC_2), .PC_2_D(PC_2_D),
				/*control*/
				.ALU_Oper(ALU_op), .ALUsrc(ALUsrc), .PC_sel(PC_sel), .DI_sel(DI_sel),
				.rev_sel(rev_sel), .invB(invB), .invA(invA), .B_op(B_op), .B(B), .bypass_sel(bypass_sel), .B_take(B_take));
	
	memory memory0(.mem_mem_out(mem_mem_out), .writeData(read2OutData), .aluResult(ALU_out), .clk(clk), .rst(rst), 
				/*control*/.mem_writeEn(mem_writeEn), .halt(halt));
				
	wb WB (.rf_write(writeInData), .mem_mem_out(mem_mem_out), .PC_2(PC_2), .I(I_mux_out), .ALU_out(ALU_out), .ALU_carry(ALU_cOut),
				/*control*/ .memreg(memreg), .diff_op(diff_op), .compare(compare), .bypass(bypass));
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
