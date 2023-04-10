`default_nettype none
module overflow (Cout, S, A, B, sign, Out);

    // declare constant for size of inputs, outputs, and # bits to shift
    parameter OPERAND_WIDTH = 16;
	
	input wire Cout, S, A, B, sign;
	output wire Out;
	
	//wire [OPERAND_WIDTH-1:0] Out;
	wire notS, notA, notB;
	wire andP, andN;
	wire signOut;
	
	not1 n0(.out(notA), .in1(A));
	not1 n1(.out(notB), .in1(B));
	not1 n2(.out(notS), .in1(S));
	
	and3 a0(.out(andP),.in1(S),.in2(notA),.in3(notB));
	and3 a1(.out(andN),.in1(notS),.in2(A),.in3(B));
	or2 o0 (.out(signOut),.in1(andP),.in2(andN));
   
	assign Out = (sign)? signOut: Cout;
endmodule
`default_nettype wire
