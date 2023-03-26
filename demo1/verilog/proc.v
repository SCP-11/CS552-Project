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
	wire ALUsrc, I_RI_sel, PC_sel, DI_sel, rev_sel;
	wire [2:0] ALU_op;
	/*MEM*/
	wire [1:0] mem_writeEn;
	/*WB*/
	wire [1:0] memreg, diff_op;
	wire compare;
   
   
	wire [15:0] in_PC, PC_2_D, PC_2, I_mem_out, read1OutData, read2OutData, writeInData, ALU_out, I_mux_out, rev_mux_out,
				/*MEM*/ mem_mem_out;
	wire [1:0] mux_sel;
	wire writeEn, ALU_cOut;
	fetch F(.in_PC(in_PC), .clk(clk), .rst(rst), .PC_2_D(PC_2_D), .PC_2(PC_2), .I_mem_out(I_mem_out));
	control ctr (/*F*/ 	//.pcEn(1'b1), 
				/*D*/	.rf_mux(rf_mux), .I_sel(I_sel), .rf_writeEn(rf_writeEn), .I_op(I_mem_out[15:11]),
				/*EX*/	.ALUsrc(ALUsrc), .ALU_op(ALU_op), .I_RI_sel(I_RI_sel), .PC_sel(PC_sel), .DI_sel(DI_sel), .rev_sel(rev_sel), 
				/*MEM*/	.mem_writeEn(mem_writeEn), 
				/*WB*/	.memreg(memreg), .diff_op(diff_op), .compare(compare));
				
	decode D(.read1OutData(read1OutData), .read2OutData(read2OutData), .I_mux_out(I_mux_out), .clk(clk), .rst(rst), .I_mem_out(I_mem_out), .writeInData(writeInData),
				/*control*/
				.rf_mux(rf_mux), .I_sel(I_sel), .rf_writeEn(rf_writeEn));
				
	execute EX(.PC_next(in_PC), .ALU_out(ALU_out), .rev_mux_out(rev_mux_out), .read1OutData(read1OutData), .read2OutData(read2OutData), .I(I_mem_out), .PC_2(PC_2), .PC_2_D(PC_2_D), .ALU_cOut(ALU_cOut), 
				/*control*/
				.ALU_Oper(ALU_op), .ALUsrc(ALUsrc), .I_RI_sel(I_RI_sel), .PC_sel(PC_sel), .DI_sel(DI_sel), .rev_sel(rev_sel));
	
	memory MEM(.mem_mem_out(mem_mem_out), .read2OutData(read2OutData), .ALU_out(ALU_out), .clk(clk), .rst(rst), 
				/*control*/.mem_writeEn(mem_writeEn));
				
	wb WB (.rf_write(writeInData), .mem_mem_out(mem_mem_out), .PC_2(PC_2), .I(I_mux_out), .ALU_out(ALU_out), .ALU_carry(ALU_cOut),
				/*control*/ .memreg(memreg), .diff_op(diff_op), .compare(compare), .rev_mux_out(rev_mux_out));
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
