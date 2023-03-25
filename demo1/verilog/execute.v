/*
   CS/ECE 552 Spring '22
  
   Filename        : execute.v
   Description     : This is the overall module for the execute stage of the processor.
*/
`default_nettype none
module execute (PC_next, ALU_out, I_5_sign, read1OutData, read2OutData, I_mem_out, PC_2, PC_2_D, ALU_Oper, ALU_mux_sel, not_mux_sel/* TODO: Add appropriate inputs/outputs for your execute stage here*/);

   // TODO: Your code here
   input wire [15:0] read1OutData, read2OutData, I_mem_out, PC_2, PC_2_D;
   input wire [2:0] ALU_Oper;
   input wire [1:0] ALU_mux_sel;
   input wire not_mux_sel;
   
   output wire [15:0] ALU_out, PC_next, I_5_sign;
   
   wire [15:0] ALU_mux_out, JPB_mux_out, pc_2_JPB, add_mux_out;
   wire [7:0] not_mux_out;
   wire ALU_Of1, cOut;
   
   
   mux2_1 not_mux (.out(not_mux_out), .inputA(I_mem_out[7:0]), .inputB(~I_mem_out[7:0]), .sel(/*not_mux control*/));
   
   assign I_5_sign = {{11{I_mem_out[4]}}, I_mem_out[4:0]};
   mux4_1 ALU_mux (.out(ALU_mux_out), .inputA(read2OutData), .inputB(I_5_sign/*sign extend*/), .inputC({{8{I_mem_out[7]}}, I_mem_out[7:0]}), .inputD({8'b0, not_mux_out}), .sel(ALU_mux_sel));
   
   alu ALU(.InA(read1OutData), .InB(ALU_mux_out), .Cin(1'b0), .Oper(ALU_Oper), .invA(1'b0), .invB(1'b0), .sign(/*ALU_control*/), .Out(ALU_out), .Zero(/*ALU_control_zero*/), .Ofl(ALU_Of1));
   
   mux2_1 JPB_mux (.out(JPB_mux_out), .inputA(I_5_sign), .inputB(ALU_out), .sel(/*JP/B mux control*/));
   
   cla16b add_pc_2_JPB (.sum(pc_2_JPB), .cOut(cOut), .inA(PC_2), .inB({JPB_mux_out[14:0], 1'b0}), .cIn(0));
   
   mux2_1 add_mux (.out(add_mux_out), .inputA(pc_2_JPB), .inputB(PC_2), .sel(/*Add JPB mux control*/));
   
   mux2_1 D_mux (.out(PC_next), .inputA(PC_2_D), .inputB(add_mux_out), .sel(/*Add D mux control*/));
endmodule
`default_nettype wire
