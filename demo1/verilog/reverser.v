`default_nettype none
module reverser(out, in);
    	output wire [15:0] out;
    	input wire [15:0] in;

    	// YOUR CODE HERE
	assign out = {in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]};
    
endmodule
`default_nettype wire
