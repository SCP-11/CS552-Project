
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module register (q, d, clk, rst, en);

	parameter size = 16;
    output wire [size-1:0] q;
    input wire [size-1:0] d;
    input wire     clk;
    input wire     rst;
	input wire en;

	wire [size-1:0] Qs;
	wire [size-1:0] Ds;
	wire muxSig;
	
	mux2_1 muxes [0:size-1](.out(Ds), .inputA(Qs), .inputB(d), .sel(en));
    dff dffs [0:size-1](.q(Qs), .d(Ds), .clk(clk), .rst(rst));

	assign q = Qs;
	
endmodule
`default_nettype wire