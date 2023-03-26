/*
   CS/ECE 552 Spring '22
  
   Filename        : execute.v
   Description     : This is the overall module for the execute stage of the processor.
*/
`default_nettype none
module execute (PC_next, ALU_out, rev_mux_out, ALU_cOut, read1OutData, read2OutData, I, PC_2, PC_2_D, 
				
				ALU_Oper, ALUsrc, I_RI_sel, PC_sel, DI_sel, rev_sel);

   // TODO: Your code here
   input wire [15:0] read1OutData, read2OutData, I, PC_2, PC_2_D;
   input wire [2:0] ALU_Oper;
   input wire ALUsrc;
   input wire I_RI_sel, PC_sel, DI_sel, rev_sel;
   
   output wire [15:0] ALU_out, PC_next, rev_mux_out;
   output wire ALU_cOut;
   
   wire [15:0] ALU_mux_out, JPB_mux_out, pc_2_JPB, add_mux_out, rev_out;
   wire ALU_Of1, cOut, zero;

   mux2_1 ALU_mux [15:0] (.out(ALU_mux_out), .inputA(read2OutData), .inputB(I), .sel(ALUsrc));
   
   alu ALU(.InA(read1OutData), .InB(ALU_mux_out), .Cin(1'b0), .Oper(ALU_Oper), .invA(1'b0), .invB(1'b0),
			.sign(1'b1), .Out(ALU_out), .Zero(zero), .Ofl(ALU_Of1), .cOut(ALU_cOut));
   reverser rev(.out(rev_out), .in(read1OutData));
   
   mux2_1 I_RI_mux [15:0](.out(JPB_mux_out), .inputA(I), .inputB(ALU_out), .sel(I_RI_sel));
   mux2_1 rev_mux [15:0](.out(rev_mux_out), .inputA(ALU_out), .inputB(rev_out), .sel(rev_sel));
   
   cla16b add_pc_2_JB (.sum(pc_2_JPB), .cOut(cOut), .inA(PC_2), .inB({JPB_mux_out[14:0], 1'b0}), .cIn(1'b0));
   
   mux2_1 DI_mux [15:0](.out(add_mux_out), .inputA(PC_2_D), .inputB(pc_2_JPB), .sel(DI_sel));
   
   mux2_1 PC_mux [15:0](.out(PC_next), .inputA(add_mux_out), .inputB(PC_2), .sel(PC_sel));
endmodule
`default_nettype wire
