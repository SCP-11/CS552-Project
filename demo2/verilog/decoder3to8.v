
/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 1-bit D-flipflop (DFF).

   YOU SHALL NOT EDIT THIS FILE. ANY CHANGES TO THIS FILE WILL
   RESULT IN ZERO FOR THIS PROBLEM.
*/
`default_nettype none
module decoder3to8(
    input wire [2:0] sel,
    output wire [7:0] out
);

  and gate0 (out[0], ~sel[2], ~sel[1], ~sel[0]);
  and gate1 (out[1], ~sel[2], ~sel[1], sel[0]);
  and gate2 (out[2], ~sel[2], sel[1], ~sel[0]);
  and gate3 (out[3], ~sel[2], sel[1], sel[0]);
  and gate4 (out[4], sel[2], ~sel[1], ~sel[0]);
  and gate5 (out[5], sel[2], ~sel[1], sel[0]);
  and gate6 (out[6], sel[2], sel[1], ~sel[0]);
  and gate7 (out[7], sel[2], sel[1], sel[0]);

endmodule
`default_nettype wire