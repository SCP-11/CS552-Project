/*
   CS/ECE 552 Spring '22
  
   Filename        : wb.v
   Description     : This is the module for the overall Write Back stage of the processor.
*/
`default_nettype none
module wb (rf_write, mem_mem_out, PC_2, I, ALU_out, ALU_carry, memreg, diff_op, compare, bypass);

   // TODO: Your code here
   input wire[15:0] mem_mem_out, PC_2, I, ALU_out, bypass;
   input wire [1:0] memreg, diff_op;
   input wire compare, ALU_carry;
   output wire[15:0] rf_write;
   
   wire [15:0] mem_mux_out, diff_out;
   wire equal, less, more;
   assign equal = (ALU_out == 16'h0000)? 16'h0001: 16'h0000;
   assign less = (ALU_out[15])? 16'h0001: 16'h0000;
   assign diff_out = (diff_op[1])? (diff_op[0])? 	ALU_carry:
													equal & less: 
									(diff_op[0])? 	less: 
													equal;
   //mux4_1 WB_mux [15:0](.out(mem_mux_out), .inputA(mem_mem_out), .inputB(I), .inputC(PC_2), .inputD(rev_mux_out), .sel(memreg));
   assign mem_mux_out = (memreg[1])? (memreg[0])? bypass: PC_2:
						(memreg[0])? I: mem_mem_out;
   
   mux2_1 compare_mux [15:0](.out(rf_write), .inputA(mem_mux_out), .inputB(diff_out), .sel(compare/*Add D mux control*/));
endmodule
`default_nettype wire
