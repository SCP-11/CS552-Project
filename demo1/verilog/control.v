`default_nettype none
module control (/*F*/	halt,
				/*D*/	rf_mux, I_sel, rf_writeEn, I_op, 
				/*EX*/	ALUsrc, ALU_op, PC_sel, DI_sel, rev_sel, func, invB, invA, B_op, B, bypass_sel, B_take,
				/*MEM*/	mem_writeEn, 
				/*WB*/	memreg, diff_op, compare);
				
    output reg [1:0] rf_mux, memreg, diff_op, I_sel, mem_writeEn, B_op, bypass_sel;
	output reg rf_writeEn, PC_sel, DI_sel, compare, rev_sel, ALUsrc, B, invA, halt;
	output reg [2:0] ALU_op;
	output wire invB;
    input wire [4:0] I_op;
	input wire [1:0] func;
	input wire B_take;

    assign invB = (I_op == 5'b01011)? 1'b1: ((I_op==5'b11011) & (func == 2'b11))? 1'b1: 1'b0; 
	//assign halt = (I_op == 5'b00000)? 1'b1: 1'b0;
	always @* begin
		/*F*/	halt = 1'b0;
		rf_writeEn = 1'b0;
		mem_writeEn = 2'b0Z;
		PC_sel = 1'b1;
		I_sel = 2'b00;
		ALU_op = 3'b100;
		ALUsrc = 1'b0;
		memreg = 2'b00;
		rev_sel = 1'b0;
		compare = 1'b0;
		rf_mux = 2'b01;
		bypass_sel = 2'b00;
		invA = 1'b0;
		B = 1'b0;
		B_op = 2'b00;
		DI_sel = 1'b0;
		casex (I_op)
		5'b00000 : begin /*Halt*/ 
						/*F*/	halt = 1'b1;
								rf_writeEn = 1'b0; 
								mem_writeEn = 2'b0z;  
					end 
			
		5'b00001 : begin /*NOP*/ 
			rf_writeEn = 1'b0; 
			mem_writeEn = 2'b0z;  
			end 
		5'b0100? : begin /*ADDI, SUBI*/ 
						/*D*/ 	rf_mux = 2'b01;	I_sel = 2'b00; rf_writeEn = 1'b1; 
						/*EX*/	ALU_op = {1'b1, I_op[1:0]};	ALUsrc = 1'b1;	PC_sel = 1'b1; bypass_sel = 2'b00;
						/*MEM*/	mem_writeEn = 2'b0z; 
						/*WB*/	memreg = 2'b11;
			end 
		5'b0101? : begin /*XORI, ANDNI*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b0z; 
			PC_sel = 1'b1;
			I_sel = 2'b01;
			ALU_op = {1'b1, I_op[1:0]};
			ALUsrc = 1'b1;
			memreg = 2'b11;
			rev_sel = 1'b0;
			compare = 1'b0;
			
			
			/*D*/ rf_mux = 2'b01;
			end 
		5'b101?? : begin /*ROLI, RORI...*/ 
			rf_writeEn = 1'b1; 
			PC_sel = 1'b1;		
			ALU_op = {1'b0, ~I_op[0], I_op[1]}; //Rotate
			ALUsrc = 1'b1;
			memreg = 2'b11;
			/*D*/ rf_mux = 2'b01;
			end 
		5'b10000 : begin /*ST*/ 
			rf_writeEn = 1'b0; 
			mem_writeEn = 2'b11; 
			PC_sel = 1'b1;
			I_sel = 2'b00;
			ALU_op = 3'b100; //Add
			ALUsrc = 1'b1;
			
			end 
		5'b10001 : begin /*LD*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b10; 
			PC_sel = 1'b1;
			I_sel = 2'b00;
			ALU_op = 3'b100; //Add
			ALUsrc = 1'b1;
			memreg = 2'b00;
			compare = 1'b0;
			
			/*D*/ rf_mux = 2'b01;
			end 
		5'b10011 : begin /*STU*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b11; 
			PC_sel = 1'b1;
			ALU_op = 3'b100; //Add
			ALUsrc = 1'b1;
			memreg = 2'b11;
			compare = 1'b0;
			
			/*D*/ rf_mux = 2'b00;
			end 
		5'b11001 : begin /*BTR*/ 
			rf_writeEn = 1'b1; 
			/*EX*/bypass_sel = 2'b01;
			/*D*/ rf_mux = 2'b10;
			/*MEM*/memreg = 2'b11;
			end 
		5'b11011 : begin /*ADD, SUB...*/ 
			rf_writeEn = 1'b1; 
			mem_writeEn = 2'b0z; 
			PC_sel = 1'b1;
			/*EX*/ALU_op = {1'b1, func}; invA = func[0] & ~func[1];
			/*MEM*/memreg = 2'b11;
			/*D*/ rf_mux = 2'b10;
			end 
		5'b11010 : begin /*SLL...*/ 
						rf_writeEn = 1'b1; 
						PC_sel = 1'b1;
						ALU_op = {1'b0, func};
						/*D*/ rf_mux = 2'b10;
						/*MEM*/ memreg = 2'b11;
			end 
		5'b111?? : begin /*SEQ...*/ 
						/*D*/ 	rf_mux = 2'b10; rf_writeEn = 1'b1; 
						/*EX*/	ALU_op = 3'b100; invA = ~(I_op[1] & I_op[0]); 
						/*MEM*/	
						/*WB*/	compare = 1'b1; diff_op = I_op[1:0];
					end
		5'b011?? : begin /*BEQZ...*/ 
						/*D*/ 	rf_writeEn = 1'b0; I_sel = 2'b10;
						/*EX*/	B_op = I_op[1:0]; B = 1'b1; DI_sel = 1'b1; PC_sel = ~B_take; 
						/*MEM*/	mem_writeEn = 2'b0z; 
						/*WB*/	compare = 1'b0; 
					end
		5'b11000 : begin /*LBI*/ 
						/*D*/	rf_writeEn = 1'b1; rf_mux = 2'b00; I_sel = 2'b10;
						/*EX*/	ALU_op = 3'b100; ALUsrc = 1'b0; mem_writeEn = 2'b0z; rev_sel = 1'b0;
						/*MEM*/	PC_sel = 1'b1; 
						/*WB*/	memreg = 2'b01; compare = 1'b0;
					end 
		5'b10010 : begin /*SLBI*/ 
						/*D*/ 	rf_writeEn = 1'b1; rf_mux = 2'b00; I_sel = 2'b11;
						/*EX*/	ALU_op = {3'b000}; bypass_sel = 2'b11; ALUsrc = 1'b1;
						/*MEM*/ 
						/*WB*/	memreg = 2'b11;
					end
					
		5'b001?? : begin /*JD...*/ 
						/*D*/ 	rf_writeEn = I_op[1]; 
						/*EX*/	ALU_op = 3'b100; PC_sel = 1'b0; DI_sel = I_op[0];
						/*MEM*/	mem_writeEn = 2'b0z; 
						/*WB*/	memreg = 2'b10; compare = 1'b0; 
					end
	endcase
	end 
endmodule
`default_nettype wire
