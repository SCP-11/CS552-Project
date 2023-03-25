/*
   CS/ECE 552 Spring '22
  
   Filename        : decode.v
   Description     : This is the module for the overall decode stage of the processor.
*/
`default_nettype none
module decode (read1OutData, read2OutData, clk, rst, I_mem_out, writeInData, writeEn, mux_sel/* TODO: Add appropriate inputs/outputs for your decode stage here*/);

	output wire [15:0] read1OutData, read2OutData;
	
	input wire [15:0] I_mem_out, writeInData;
	input wire [1:0] mux_sel;
	input wire clk, rst, writeEn;
	
	wire err;
	wire [2:0] out_rf_mux;
   // TODO: Your code here
   mux4_1 rf_mux (.out(out_rf_mux), .inputA(I_mem_out[10:8]), .inputB(I_mem_out[10:8]), .inputC(I_mem_out[4:2]), .inputD(/*R7*/), .sel(mux_sel));
   rf rf1(.read1OutData(read1OutData), .read2OutData(read2OutData), .err(err), .clk(clk), .rst(rst), .read1RegSel(I_mem_out[10:8]), .read2RegSel(I_mem_out[7:5]), .writeRegSel(out_rf_mux), .writeInData(writeInData), .writeEn(writeEn));
   
endmodule
`default_nettype wire
