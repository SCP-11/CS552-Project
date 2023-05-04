/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 2
    
    a 1-bit full adder
*/
`default_nettype none
module fullAdder1b(s, cOut, inA, inB, cIn);
    output wire s;
    output wire cOut;
    input  wire inA, inB;
    input  wire cIn;
	wire x1_out, a1_out, a2_out, o1_out;

    // YOUR CODE HERE

	assign cOut = o1_out;
	xor2 xor2_1 (.out(x1_out),.in1(inA),.in2(inB));
	and2 and2_1 (.out(a1_out),.in1(inA),.in2(inB));
	xor2 xor2_2 (.out(s),.in1(x1_out),.in2(cIn));
	and2 and2_2 (.out(a2_out),.in1(x1_out),.in2(cIn));
	or2  or2_1  (.out(o1_out), .in1(a1_out), .in2(a2_out));
	

endmodule
`default_nettype wire
