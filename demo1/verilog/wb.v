/*
   CS/ECE 552 Spring '22
  
   Filename        : wb.v
   Description     : This is the module for the overall Write Back stage of the processor.
*/
`default_nettype none
module wb (/* TODO: Add appropriate inputs/outputs for your WB stage here*/);

   // TODO: Your code here
   output wire[15:0] rf_write
   mux2_1 WB_mux (.out(rf_write), .inputA(mem_mux_out), .inputB(/*diff*/), .sel(/*Add D mux control*/));
endmodule
`default_nettype wire
