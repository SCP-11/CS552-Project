/*
   CS/ECE 552 Spring '22
  
   Filename        : memory.v
   Description     : This module contains all components in the Memory stage of the 
                     processor.
*/
`default_nettype none
module memory (mem_mem_out, writeData, aluResult, clk, rst, mem_writeEn);

   // TODO: Your code here
   input wire [15:0] writeData, aluResult;
	input wire [1:0] mem_writeEn;
   input wire clk, rst;
   
   output wire [15:0] mem_mem_out;
   wire memRead, memWrite, memReadorWrite, halt;
   
   assign halt = ~mem_writeEn[1];
   assign memRead = ~mem_writeEn[0];
   assign memWrite = mem_writeEn[0];
   assign memReadorWrite = mem_writeEn[0]|~mem_writeEn[0];
   
   memory2c mem_mem(.data_out(mem_mem_out), .data_in(writeData), .addr(aluResult), .enable(mem_writeEn[1]),
						.wr(memWrite), .createdump(halt), .clk(clk), .rst(rst));
						
endmodule
`default_nettype wire
