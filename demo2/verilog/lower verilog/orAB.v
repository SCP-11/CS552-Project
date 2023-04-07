`default_nettype none
module orAB (A, B, Out);

    // declare constant for size of inputs, outputs, and # bits to shift
    parameter OPERAND_WIDTH = 16;
	
	input wire [OPERAND_WIDTH-1:0] A, B;
	output wire [OPERAND_WIDTH-1:0] Out;
	
	//wire [OPERAND_WIDTH-1:0] Out;
	or2 a[OPERAND_WIDTH-1:0] (.out(Out), .in1(A), .in2(B));
endmodule
`default_nettype wire
