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
	wire [15:0] in_PC, PC_2_D, PC_2, I_mem_out, read1OutData, read2OutData, writeInData, ALU_out;
	wire [1:0] mux_sel;
	wire writeEn;
	fetch F(.in_PC(in_PC), .clk(clk), .rst(rst), .PC_2_D(PC_2_D), .PC_2(PC_2), .I_mem_out(I_mem_out));
	decode D(.read1OutData(read1OutData), .read2OutData(read2OutData), .clk(clk), .rst(rst), .I_mem_out(I_mem_out), .writeInData(writeInData), .writeEn(writeEn), .mux_sel(mux_sel));
	execute EX(.PC_next(in_PC), .ALU_out(ALU_out), .read1OutData(read1OutData), .read2OutData(read2OutData), .I_mem_out(I_mem_out), .PC_2(PC_2), .PC_2_D(PC_2_D), .ALU_Oper(/*ALU_Oper*/), .ALU_mux_sel(/*ALU_mux_sel*/), .not_mux_sel(/*not_mux_sel*/));
	
endmodule // proc
`default_nettype wire
// DUMMY LINE FOR REV CONTROL :0:
