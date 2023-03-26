/*
   CS/ECE 552 Spring '22
  
   Filename        : memory.v
   Description     : This module contains all components in the Memory stage of the 
                     processor.
*/
`default_nettype none
module memory (mem_mem_out, read2OutData, ALU_out, clk, rst, mem_writeEn);

   // TODO: Your code here
   input wire [15:0] read2OutData, ALU_out;
	input wire [1:0] mem_writeEn;
   input wire clk, rst;
   
   output wire [15:0] mem_mem_out;
   
   memory2c mem_mem(.data_out(mem_mem_out), .data_in(read2OutData), .addr(ALU_out), .enable(mem_writeEn[1]),
						.wr(mem_writeEn[0]), .createdump(1'b0/*control*/), .clk(clk), .rst(rst));
						
endmodule
`default_nettype wire
