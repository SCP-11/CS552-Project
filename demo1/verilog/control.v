`default_nettype none
module control (/*F*/
				/*D*/	rf_mux, I_sel, rf_writeEn, I_op,
				/*EX*/	ALUsrc, ALU_op, I_RI_sel, PC_sel, DI_sel, rev_sel, 
				/*MEM*/	mem_writeEn, 
				/*WB*/	memreg, diff_op, compare);
				
    output reg [1:0] rf_mux, memreg, diff_op, I_sel, mem_writeEn;
	output reg rf_writeEn, I_RI_sel, PC_sel, DI_sel, compare, rev_sel, ALUsrc;
	output wire [2:0] ALU_op;
    input wire [4:0] I_op;
    
	assign ALU_op = I_op[2:0];
	
	always @* casex (I_op)
		5'b00000 : begin 
			rf_writeEn = 1'b0; 
			mem_writeEn = 2'b00; 
			end
		5'b00001 : begin /*NOP*/ 
			rf_writeEn = 1'b0; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			end 
		5'b0100? : begin /*ADDI, SUBI*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			I_sel = 2'b00;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
		5'b01010 : begin /*XORI*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			I_sel = 2'b01;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
		5'b01010 : begin /*ANDNI*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			I_sel = 2'b01;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
		5'b101?? : begin /*ROLI...*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;		
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
		5'b10000 : begin /*ST*/ 
			rf_writeEn = 1'b0; 
			mem_writeEn = 2'b11; 
			PC_sel = 1'b1;
			I_sel = 2'b00;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			end 
		5'b10001 : begin /*LD*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b10; 
			PC_sel = 1'b1;
			I_sel = 2'b00;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b00;
			compare = 1'b0;
			end 
		5'b10011 : begin /*STU*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b11; 
			PC_sel = 1'b1;
			//ALU_op = I_op[2:0];
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
		5'b11001 : begin /*BTR*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b1;
			compare = 1'b0;
			end 
		5'b11011 : begin /*ADD*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b00; 
			PC_sel = 1'b1;
			//ALU_op = I_op[2:0];
			ALUsrc = 2'b01;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			end 
	endcase
endmodule
`default_nettype wire
