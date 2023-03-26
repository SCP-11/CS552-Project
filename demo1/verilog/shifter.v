/*
    CS/ECE 552 Spring '23
    Homework #2, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the 'Oper' value that is passed in.  It uses these
    shifts to shift the value any number of bits.
 */
`default_nettype none
module shifter (InBS, ShAmt, ShiftOper, OutBS);

    // declare constant for size of inputs, outputs, and # bits to shift
    parameter OPERAND_WIDTH = 16;
    parameter SHAMT_WIDTH   =  4;
    parameter NUM_OPERATIONS = 2;

    input wire [OPERAND_WIDTH -1:0] InBS;  // Input operand
    input wire [SHAMT_WIDTH   -1:0] ShAmt; // Amount to shift/rotate
    input wire [NUM_OPERATIONS-1:0] ShiftOper;  // Operation type
    output wire [OPERAND_WIDTH -1:0] OutBS;  // Result of shift/rotate
	
	wire [SHAMT_WIDTH-1:0]shift;
	wire [OPERAND_WIDTH -1:0] shift1, shift2, shift4, shift8;
   /* YOUR CODE HERE */
	assign shift1 = (ShAmt[0]) ? (ShiftOper[0])?{(ShiftOper[1])?InBS[0]:1'b0, InBS[OPERAND_WIDTH-1:1]}:{InBS[OPERAND_WIDTH-2:0], (ShiftOper[1])?InBS[OPERAND_WIDTH-1]:1'b0}:InBS;
	assign shift2 = (ShAmt[1]) ? 
			(ShiftOper[0])?
				{(ShiftOper[1])?shift1[1:0]:2'b00, shift1[OPERAND_WIDTH-1:2]}:
				{shift1[OPERAND_WIDTH-3:0], (ShiftOper[1])?shift1[OPERAND_WIDTH-1:OPERAND_WIDTH-2]:2'b00}
			:shift1;
	assign shift4 = (ShAmt[2]) ? 
			(ShiftOper[0])?
				{(ShiftOper[1])?shift2[3:0]:4'b0000, shift2[OPERAND_WIDTH-1:4]}:
				{shift2[OPERAND_WIDTH-5:0], (ShiftOper[1])?shift2[OPERAND_WIDTH-1:OPERAND_WIDTH-4]:4'b0000}
			:shift2;
	assign shift8 = (ShAmt[3]) ? 
			(ShiftOper[0])?
				{(ShiftOper[1])?shift2[7:0]:8'b000, shift4[OPERAND_WIDTH-1:8]}:
				{shift4[OPERAND_WIDTH-9:0], (ShiftOper[1])?shift4[OPERAND_WIDTH-1:OPERAND_WIDTH-8]:8'b000}
			:shift4;
			
	assign OutBS = shift8;
   
endmodule
`default_nettype wire
