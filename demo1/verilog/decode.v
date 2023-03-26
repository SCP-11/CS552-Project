/*
   CS/ECE 552 Spring '22
  
   Filename        : decode.v
   Description     : This is the module for the overall decode stage of the processor.
*/
`default_nettype none
module decode (read1OutData, read2OutData, I_mux_out, clk, rst, I_mem_out, writeInData,
				/*Control*/
				rf_mux, I_sel, rf_writeEn);

	output wire [15:0] read1OutData, read2OutData, I_mux_out;
	
	input wire [15:0] I_mem_out, writeInData;
	input wire [1:0] rf_mux, I_sel;
	input wire clk, rst, rf_writeEn;
	
	wire err;
	wire [2:0] out_rf_mux;
   // TODO: Your code here
   assign out_rf_mux = (rf_mux[1])? (rf_mux[0])? 16'h0007: I_mem_out[4:2]:
						(rf_mux[0])? rf_mux[10:8]: I_mem_out[10:8];
   rf rf1(.read1OutData(read1OutData), .read2OutData(read2OutData), 
			.err(err), .clk(clk), .rst(rst), .read1RegSel(I_mem_out[10:8]), 
			.read2RegSel(I_mem_out[7:5]), .writeRegSel(out_rf_mux), .writeInData(writeInData),
			.writeEn(rf_writeEn));
   
   mux4_1 I_mux [0:15] (.out(I_mux_out), .inputA({{11{I_mem_out[4]}}, I_mem_out[4:0]}),
			.inputB({11'b0, I_mem_out[4:0]}), .inputC({{8{I_mem_out[7]}}, I_mem_out[7:0]}),
			.inputD({8'b0, I_mem_out[7:0]}), .sel(I_sel));
endmodule
`default_nettype wire
