`default_nettype none
module inverter (In, Out);

    // declare constant for size of inputs, outputs, and # bits to shift
    parameter OPERAND_WIDTH = 16;
	
	input wire [OPERAND_WIDTH-1:0] In;
	output wire [OPERAND_WIDTH-1:0] Out;
	
	//wire [OPERAND_WIDTH-1:0] Out;
	not1 n[OPERAND_WIDTH-1:0] (.out(Out), .in1(In));
   
endmodule
`default_nettype wire
