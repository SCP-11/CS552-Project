/*
   CS/ECE 552 Spring '22
  
   Filename        : decode.v
   Description     : This is the module for the overall decode stage of the processor.
*/
`default_nettype none
module decode (read1OutData, read2OutData, I_mux_out, rf_sel_out,
				I_mem_out, writeInData,	rf_sel_in,
				/*Control*/
				rf_sel, I_sel, rf_writeEn,
				clk, rst
				);

	output wire [15:0] read1OutData, read2OutData, I_mux_out;
	output wire [2:0] rf_sel_out;
	input wire [15:0] I_mem_out, writeInData;
	input wire [2:0]	rf_sel_in;
	input wire [1:0] rf_sel, I_sel;
	input wire clk, rst, rf_writeEn;
	
	wire err;
	
   // TODO: Your code here
   assign rf_sel_out = (rf_sel[1])? (rf_sel[0])? 3'b111: I_mem_out[4:2]:
						(rf_sel[0])? I_mem_out[7:5]: I_mem_out[10:8];
   rf_bypass regFile0(.read1OutData(read1OutData), .read2OutData(read2OutData), 
			.err(err), .clk(clk), .rst(rst), .read1RegSel(I_mem_out[10:8]), 
			.read2RegSel(I_mem_out[7:5]), .writeRegSel(rf_sel_in), .writeInData(writeInData),
			.writeEn(rf_writeEn));
   
	/*mux4_1 I_mux [0:15] (.out(I_mux_out), .inputA({{11{I_mem_out[4]}}, I_mem_out[4:0]}),
			.inputB({11'b0, I_mem_out[4:0]}), .inputC({{8{I_mem_out[7]}}, I_mem_out[7:0]}),
			.inputD({8'b0, I_mem_out[7:0]}), .sel(I_sel));*/
			
	assign I_mux_out = (I_sel[1])? (I_sel[0])? {8'b0, I_mem_out[7:0]} 				//11, 8 zero
											: {{8{I_mem_out[7]}}, I_mem_out[7:0]} 	//10, 8 sign
								:(I_sel[0])? {11'b0, I_mem_out[4:0]} 				//01, 5 zero
								: {{11{I_mem_out[4]}}, I_mem_out[4:0]}; 			//00, 5 sign
endmodule
`default_nettype wire
