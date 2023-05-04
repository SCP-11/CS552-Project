/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 1

    2-1 mux template
*/
`default_nettype none
module mux2_1(out, inputA, inputB, sel);
    	output wire  out;
    	input wire  inputA, inputB;
    	input wire  sel;

    	// YOUR CODE HERE
	assign out = (sel == 0) ? inputA:inputB;
    
endmodule
`default_nettype wire
