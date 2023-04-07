`default_nettype none
module pc(pcNext, pcCurrent, rst, clk, en);

	input wire rst, clk, en;
	input wire [15:0] pcNext;
	output wire [15:0] pcCurrent;
	
	wire cOut;
	wire pcAdd2;
	
	wire [15:0] pcD;
	
	assign pcD = (en)? pcNext: pcCurrent;
	dff df1 [15:0] (.q(pcCurrent), .d(pcD), .clk(clk), .rst(rst));
	
	
	
endmodule
`default_nettype wire
