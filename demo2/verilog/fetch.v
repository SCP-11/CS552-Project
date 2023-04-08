/*
   CS/ECE 552 Spring '22
  
   Filename        : fetch.v
   Description     : This is the module for the overall fetch stage of the processor.
*/
`default_nettype none
module fetch (PC_2_D,	PC_2, I_mem_out,	
				/*D*/	
				pcNext,	JPB_mux_out,	halt,	PC_sel,	DI_sel,	
				clk, rst
				);
				
				
   // TODO: Your code here
   output wire [15:0] PC_2, PC_2_D, I_mem_out; 
  
   input wire [15:0] 	pcNext, JPB_mux_out;
   input wire clk, rst, halt, PC_sel, DI_sel;   
    
   wire [15:0] pcCurrent,	add_mux_out;

   wire [15:0] data_in;
   wire [11:0] I_sl1;
   wire cOut,	pc_en;
   
   assign pc_en = (~rst)&(~halt);
   pc pc1 (.pcCurrent(pcCurrent), .pcNext(pcNext), .clk(clk), .rst(rst), .en(~halt));
   cla16b pc_add_2 (.sum(PC_2), .cOut(cOut), .inA(pcCurrent), .inB(16'h0002), .cIn(1'b0));
   
   memory2c I_mem(.data_out(I_mem_out), .data_in(), .addr(pcCurrent), .enable(1'b1), .wr(1'b0), .createdump(), .clk(clk), .rst(rst));
   assign I_sl1 = {I_mem_out[10:0], 1'b0};
   cla16b pc2D_adder (.sum(PC_2_D), .cOut(cOut), .inA(PC_2), .inB({{5{I_mem_out[10]}}, I_mem_out[10:0]}), .cIn(1'b0));
   
   //assign PC_2_D = {PC_2[15:12], I_sl1};
	mux2_1 DI_mux [15:0](.out(add_mux_out), .inputA(PC_2_D), .inputB(JPB_mux_out), .sel(DI_sel));
	assign pcNext = (PC_sel)? PC_2: add_mux_out;
endmodule
`default_nettype wire
