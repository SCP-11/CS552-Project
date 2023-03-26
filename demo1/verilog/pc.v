`default_nettype none
module pc(in_PC, out_PC, rst, clk);

	input wire rst, clk;
	input wire [15:0] in_PC;
	output wire [15:0] out_PC;
	
	wire cOut;
	wire pcAdd2;
	
	
	dff df1 [15:0] (.q(out_PC), .d(in_PC), .clk(clk), .rst(rst));
	
	
	
endmodule
`default_nettype wire
