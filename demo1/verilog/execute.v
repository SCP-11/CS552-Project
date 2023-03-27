/*
   CS/ECE 552 Spring '22
  
   Filename        : execute.v
   Description     : This is the overall module for the execute stage of the processor.
*/
`default_nettype none
module execute (/*OUT*/ pcNext, ALU_out, bypass, ALU_cOut, 
				/*IN*/	read1OutData, read2OutData, I, PC_2, PC_2_D, 				
				/*control*/ ALU_Oper, ALUsrc, PC_sel, DI_sel, rev_sel, invB, B_op, B, bypass_sel);

   // TODO: Your code here
   input wire [15:0] read1OutData, read2OutData, I, PC_2, PC_2_D;
   input wire [2:0] ALU_Oper;
   input wire [1:0] B_op, bypass_sel;
   input wire ALUsrc, B;
   input wire PC_sel, DI_sel, rev_sel, invB;
   
   output wire [15:0] ALU_out, pcNext, bypass;
   output wire ALU_cOut;
   
   wire [15:0] ALU_mux_out, JPB_mux_out, pc_2_JPB, add_mux_out, rev_out, IORShift;
   wire ALU_Of1, cOut, zero, I_RsI_sel;
	

   assign ALU_mux_out = (ALUsrc)? (bypass_sel[1])? 16'h0008: I: read2OutData;
   
   alu ALU(.InA(read1OutData), .InB(ALU_mux_out), .Cin(1'b0), .Oper(ALU_Oper), .invA(1'b0), .invB(invB),
			.sign(1'b1), .Out(ALU_out), .Zero(zero), .Ofl(ALU_Of1), .cOut(ALU_cOut));
   reverser rev(.out(rev_out), .in(read1OutData));
   
   assign I_RsI_sel = 	((B_op==2'b00 & read1OutData == 16'h0000)|
						(B_op==2'b01 & ~(read1OutData == 16'h0000))|
						(B_op==2'b10 & read1OutData[15] == 1'b1)|
						(B_op==2'b11 & read1OutData[15] == 1'b0)) & B;

   mux2_1 I_RsI_mux [15:0](.out(JPB_mux_out), .inputA(I), .inputB(ALU_out), .sel(I_RsI_sel));
   assign IORShift = I | ALU_out; 
   assign bypass = (bypass_sel[1])? (bypass_sel[0])?IORShift: 
													IORShift:
									(bypass_sel[0])?rev_out:
													ALU_out;
   cla16b add_pc_2_JB (.sum(pc_2_JPB), .cOut(cOut), .inA(PC_2), .inB({JPB_mux_out[14:0], 1'b0}), .cIn(1'b0));
   
   mux2_1 DI_mux [15:0](.out(add_mux_out), .inputA(PC_2_D), .inputB(pc_2_JPB), .sel(DI_sel));
   
   mux2_1 PC_mux [15:0](.out(pcNext), .inputA(add_mux_out), .inputB(PC_2), .sel(PC_sel));
endmodule
`default_nettype wire
