/*
   CS/ECE 552 Spring '22
  
   Filename        : fetch.v
   Description     : This is the module for the overall fetch stage of the processor.
*/
`default_nettype none
module fetch (in_PC, clk, rst, pc2D, pcAdd2, I_mem_out/* TODO: Add appropriate inputs/outputs for your fetch stage here*/);

   // TODO: Your code here
   input wire clk, rst;
   input wire [15:0] in_PC;
   
   output wire [15:0] pcAdd2, pc2D;
   output wire [15:0] I_mem_out; 
   
   wire [15:0] out_PC;

   wire [15:0] data_in;
   wire [11:0] I_sl1;
   wire cOut;
   
   pc pc1 (.in_PC(in_PC), .out_PC(out_PC), .clk(clk), .rst(rst));
   cla16b pc_add_2 (.sum(pcAdd2), .cOut(cOut), .inA(out_PC), .inB(2), .cIn(0));
   
   memory2c mem_fetch(.data_out(I_mem_out), .data_in(data_in), .addr(in_PC), .enable(1), .wr(0), .createdump(0), .clk(clk), .rst(rst));
   assign I_sl1 = {I_mem_out[10:0], 1'b0};
   assign pc2D = {pcAdd2[15:12], I_sl1};
   
   
endmodule
`default_nettype wire
