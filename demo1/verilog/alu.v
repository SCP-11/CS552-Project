/*
    CS/ECE 552 Spring '23
    Homework #2, Problem 2

    A multi-bit ALU module (defaults to 16-bit). It is designed to choose
    the correct operation to perform on 2 multi-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the multi-bit result
    of the operation, as well as drive the output signals Zero and Overflow
    (OFL).
*/
`default_nettype none
module alu (InA, InB, Cin, Oper, invA, invB, sign, Out, Zero, Ofl, cOut);

    parameter OPERAND_WIDTH = 16;    
    parameter NUM_OPERATIONS = 3;
       
    input wire  [OPERAND_WIDTH -1:0] InA ; // Input wire operand A
    input wire  [OPERAND_WIDTH -1:0] InB ; // Input wire operand B
    input wire                       Cin ; // Carry in
    input wire  [NUM_OPERATIONS-1:0] Oper; // Operation type
    input wire                       invA; // Signal to invert A
    input wire                       invB; // Signal to invert B
    input wire                       sign; // Signal for signed operation
    output wire [OPERAND_WIDTH -1:0] Out ; // Result of comput wireation
    output wire                      Ofl ; // Signal if overflow occured
    output wire                      Zero; // Signal if Out is 0
	output wire						cOut;

    /* YOUR CODE HERE */
	wire[OPERAND_WIDTH-1:0] shiterOut;
	wire[OPERAND_WIDTH-1:0] InAIn, InAf, InBIn, InBf;
	wire[OPERAND_WIDTH-1:0] addAB, andAB, orAB, xorAB;
	
	inverter inverterA (.In(InA), .Out(InAIn));
	inverter inverterB (.In(InB), .Out(InBIn));
	assign InAf = (invA)? InAIn: InA;
	assign InBf = (invB)? InBIn: InB;
	shifter shi1 (.InBS(InAf), .ShAmt(InBf[3:0]), .ShiftOper(Oper[1:0]), .OutBS(shiterOut));

	
	cla16b cla16b0(.sum(addAB), .cOut(cOut), .inA(InAf), .inB(InBf), .cIn(Cin));
	andAB a(.A(InAf), .B(InBf), .Out(andAB));
	orAB o(.A(InAf), .B(InBf), .Out(orAB));
	xorAB xo(.A(InAf), .B(InBf), .Out(xorAB));
						
    assign Out = (Oper[NUM_OPERATIONS-1])? 
					(Oper[NUM_OPERATIONS-2])?
						(Oper[NUM_OPERATIONS-3])?
							andAB
							:xorAB
						:(Oper[NUM_OPERATIONS-3])?
							addAB
							:addAB
					:shiterOut;
	overflow over0 (.Cout(cOut), .S(addAB[OPERAND_WIDTH-1]), .A(InAf[OPERAND_WIDTH-1]), .B(InBf[OPERAND_WIDTH-1]), .sign(sign), .Out(Ofl));
	assign Zero = (Out == 16'b0)? 1'b1: 1'b0;
	
endmodule
`default_nettype wire
