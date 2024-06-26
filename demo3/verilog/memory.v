/*
   CS/ECE 552 Spring '22
  
   Filename        : memory.v
   Description     : This module contains all components in the Memory stage of the 
                     processor.
*/
`default_nettype none
module memory (mem_mem_out, Stall, Done, err, writeData, mem_address, clk, rst, mem_writeEn, halt);

   // TODO: Your code here
   input wire [15:0] writeData, mem_address;
	input wire [1:0] mem_writeEn;
   input wire clk, rst, halt;
   
   output wire [15:0] mem_mem_out;
   output wire Stall,   Done, err;
   wire memRead, memWrite, memReadorWrite;
   
   //assign halt = ~mem_writeEn[1];
   assign memRead = ~mem_writeEn[0] & mem_writeEn[1];
   assign memWrite = mem_writeEn[0] & mem_writeEn[1];
   assign memReadorWrite = mem_writeEn[0]|~mem_writeEn[0];
   
   //memory2c mem_mem(.data_out(mem_mem_out), .data_in(writeData), .addr(mem_address), .enable(mem_writeEn[1]),
	//					.wr(memWrite), .createdump(halt), .clk(clk), .rst(rst));
   wire DCacheHit;

   mem_system #(.memtype(1'b1)) mem_mem (/*AUTOARG*/
   // Outputs
   .DataOut(mem_mem_out), .Done(Done), .Stall(Stall), .CacheHit(DCacheHit), .err(err),
   // Inputs
   .Addr(mem_address), .DataIn(writeData), .Rd(memRead), .Wr(memWrite), .createdump(halt), .clk(clk), .rst(rst)
   );

endmodule
`default_nettype wire

