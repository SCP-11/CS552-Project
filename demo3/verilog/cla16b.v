/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 2
    
    a 16-bit CLA module
*/
`default_nettype none
module cla16b(sum, cOut, inA, inB, cIn);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 16;

    output wire [N-1:0] sum;
    output wire         cOut;
    input wire [N-1: 0] inA, inB;
    input wire          cIn;

    // YOUR CODE HERE
	wire [N/4-1:0] P, G;
	wire [N/4-1:0] cin;
	wire [N/4-1:0] cout;
	wire [N-1:0] p,g;
	wire dummy;
	wire [N-1:0] pTempS, pTempP, pTempG;
	wire [N-1:0] gTempS, gTempP, gTempG;
	wire [N/4-1:0]andpc;
	
	assign cin[N/4-1:1] = cout[N/4-2:0];
	assign cin[0] = cIn;
	
	cla4b c4_1[N/4-1:0](.sum(sum), .cOut(dummy), .p(p), .g(g), .inA(inA), .inB(inB), .cIn(cin));
	cla4b c4_2[N/4-1:0](.sum(pTempS), .cOut(P), .p(pTempP), .g(pTempG), .inA(p), .inB(4'b0001), .cIn(1'b0));
	cla4b c4_3[N/4-1:0](.sum(gTempS), .cOut(G), .p(gTempP), .g(gTempG), .inA(p), .inB(g), .cIn(1'b0));
	and2 a_3[N/4-1:0](.out(andpc), .in1(P), .in2(cin));
	or2 o_2[N/4-1:0](.out(cout), .in1(andpc), .in2(G));
	assign cOut = cout[N/4-1];
endmodule
`default_nettype wire
