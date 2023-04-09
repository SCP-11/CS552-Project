/*
   CS/ECE 552 Spring '22
  
   Filename        : execute.v
   Description     : This is the overall module for the execute stage of the processor.
*/
`default_nettype none
module execute (
	/*OUT*/ 	/*pcNext, */JPB_mux_out,	add_mux_out,	ALU_out, bypass, ALU_cOut, ALU_Of1,
	/*IN*/		read1OutData, read2OutData, I, PC_2, PC_2_D, 		
	/*control*/ ALU_Oper, ALUsrc, PC_sel, DI_sel, 
				rev_sel, invA, invB, B_op, B, bypass_sel, B_take);

   // TODO: Your code here
   input wire [15:0] read1OutData, read2OutData, I, PC_2, PC_2_D;
   input wire [2:0] ALU_Oper;
   input wire [1:0] B_op, bypass_sel;
   input wire ALUsrc, B;
   input wire PC_sel, DI_sel, rev_sel, invB, invA;
   
   output wire [15:0] ALU_out/*, pcNext*/,	JPB_mux_out, add_mux_out,	bypass;
   output wire ALU_cOut, B_take, ALU_Of1;
   
   wire [15:0] ALU_mux_out,	pc_2_JPB, rev_out, IORShift/*,	add_mux_out*/;
   wire cOut, zero, PC2_I_sel;
	

   assign ALU_mux_out = (ALUsrc)? ((bypass_sel[1])? 16'h0008: I): read2OutData;
   
   alu ALU(.InA(read1OutData), .InB(ALU_mux_out), .Cin(1'b0), .Oper(ALU_Oper), .invA(invA), .invB(invB),
			.sign(1'b1), .Out(ALU_out), .Zero(zero), .Ofl(ALU_Of1), .cOut(ALU_cOut));
   reverser rev(.out(rev_out), .in(read1OutData));
   

   assign IORShift = I | ALU_out; 
   assign bypass = (bypass_sel[1])? (bypass_sel[0])?IORShift: 
													IORShift:
									(bypass_sel[0])?rev_out:
													ALU_out;
													
			
   assign B_take = 	((((B_op==2'b00) & (read1OutData == 16'h0000))|
						((B_op==2'b01) & ~(read1OutData == 16'h0000))|
						((B_op==2'b10) & (read1OutData[15] == 1'b1))|
						((B_op==2'b11) & (read1OutData[15] == 1'b0))) & B);

   cla16b add_pc_2_JB (.sum(pc_2_JPB), .cOut(cOut), .inA(PC_2), .inB(I), .cIn(1'b0));

	assign PC2_I_sel = ~B;
   mux2_1 PC2_I_mux [15:0](.out(JPB_mux_out), .inputA(pc_2_JPB), .inputB(ALU_out), .sel(PC2_I_sel));
   
   //cla16b add_pc_2_JB (.sum(pc_2_JPB), .cOut(cOut), .inA(PC_2), .inB({JPB_mux_out}), .cIn(1'b0));
   
   mux2_1 DI_mux [15:0](.out(add_mux_out), .inputA(PC_2_D), .inputB(JPB_mux_out), .sel(DI_sel));
   
   //mux2_1 PC_mux [15:0](.out(pcNext), .inputA(16'h0002), .inputB(PC_2), .sel(PC_sel));
   //assign pcNext = (PC_sel)? PC_2: add_mux_out;
   
endmodule
`default_nettype wire
