/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 2
    
    a 4-bit CLA module
*/
`default_nettype none
module cla4b(sum, cOut, p, g, inA, inB, cIn);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 4;

    output wire [N-1:0] sum;
    output wire         cOut;
    input wire [N-1: 0] inA, inB;
    input wire          cIn;
	output wire[N-1:0] p, g;


    // YOUR CODE HERE
	wire dummy;
	wire [N-1:0] cin;
	wire [N-1:0] cout;
	assign cin[N-1:1] = cout[N-2:0];
	assign cin[0] = cIn; 

	wire [N-1:0] andpc;
    // YOUR CODE HERE

	or2 o_1[N-1:0](.out(p), .in1(inA), .in2(inB));
	and2 a_1[N-1:0](.out(g), .in1(inA), .in2(inB));
		
	fullAdder1b f_1[N-1:0](.s(sum), .cOut(dummy), .inA(inA), .inB(inB), .cIn(cin));	
	
	and2 a_2[N-1:0](.out(andpc), .in1(p), .in2(cin));
	or2 o_2[N-1:0](.out(cout), .in1(andpc), .in2(g));

	assign cOut = cout[N-1];

endmodule
`default_nettype wire
