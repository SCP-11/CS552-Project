`default_nettype none
module pc(in_PC, out_PC, rst, clk);

	input wire rst, clk;
	input wire [15:0] in_PC;
	output wire [15:0] out_PC;
	
	wire cOut;
	wire pcAdd2;
	
	dff df1 (.q(out_PC), .d(in_PC), .clk(clk), .rst(rst));
	cla16b pc_add_2 (.sum(pcAdd2), .cOut(cOut), .inA(out_PC), .inB(2), .cIn(0));
	
	
endmodule
`default_nettype wire
