
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register (q, data, clk, rst, write);

    output wire [15:0] q;
    input wire [15:0] data;
    input wire     clk;
    input wire     rst;
	input wire write;

	wire [15:0] Qs;
	wire [15:0] Ds;
	wire muxSig;
	
	mux2_1 muxes [0:15](.out(Ds), .inputA(Qs), .inputB(data), .sel(write));
    dff dffs [0:15](.q(Qs), .d(Ds), .clk(clk), .rst(rst));

	assign q = Qs;
	
endmodule
`default_nettype wire