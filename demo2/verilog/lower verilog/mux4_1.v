/*
    CS/ECE 552 Spring '23
    Homework #1, Problem 1

    4-1 mux template
*/
`default_nettype none
module mux4_1(out, inputA, inputB, inputC, inputD, sel);
    output wire      out;
    input wire       inputA, inputB, inputC, inputD;
    input wire [1:0] sel;
	wire m1_out, m2_out;

    // YOUR CODE HERE
	mux2_1 mux1 (.out(m1_out), .inputA(inputA), .inputB(inputB), .sel(sel[0]));
	mux2_1 mux2 (.out(m2_out), .inputA(inputC), .inputB(inputD), .sel(sel[0]));
	mux2_1 mux3 (.out(out), .inputA(m1_out), .inputB(m2_out), .sel(sel[1]));
      
endmodule
`default_nettype wire
