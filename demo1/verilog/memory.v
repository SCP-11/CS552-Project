/*
   CS/ECE 552 Spring '22
  
   Filename        : memory.v
   Description     : This module contains all components in the Memory stage of the 
                     processor.
*/
`default_nettype none
module memory (/* TODO: Add appropriate inputs/outputs for your memory stage here*/);

   // TODO: Your code here
   input wire [15:0] read2OutData, ALU_out, PC_2, I_5_sign;
   input wire [1:0] WB_mux_sel;
   input wire clk, rst;
   
   output wire ALU_mux_out
   wire [15:0] mem_mem_out;
   
   memory2c mem_mem(.data_out(mem_mem_out), .data_in(read2OutData), .addr(ALU_out), .enable(1), .wr(/*control*/), .createdump(/*control*/), .clk(clk), .rst(rst));
   mux4_1 WB_mux (.out(ALU_mux_out), .inputA(mem_mem_out), .inputB(read2OutData), .inputC(PC_2), .inputD(I_5_sign), .sel(WB_mux_sel));
endmodule
`default_nettype wire
