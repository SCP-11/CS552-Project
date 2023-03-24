/*
   CS/ECE 552, Spring '23
   Homework #3, Problem #1
  
   This module creates a 16-bit register file.  It has 1 write port, 2 read
   ports, 3 register select inputs, a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock. 
*/
`default_nettype none
module rf (
           // Outputs
           read1OutData, read2OutData, err,
           // Inputs
           clk, rst, read1RegSel, read2RegSel, writeRegSel, writeInData, writeEn
           );

	input wire       clk, rst;
	input wire [2:0] read1RegSel;
	input wire [2:0] read2RegSel;
	input wire [2:0] writeRegSel;
	input wire [15:0] writeInData;
	input wire        writeEn;

	output wire [15:0] read1OutData;
	output wire [15:0] read2OutData;
	output wire        err;

	/* YOUR CODE HERE */
    wire [15:0] r_out [7:0];
	wire [7:0] writeDec;
	wire [7:0] writeSigs;
	
	decoder3to8 decoder (.sel(writeRegSel), .out(writeDec));
	and2 ands [0:7] (.out(writeSigs),.in1(writeDec),.in2(writeEn));
	register rs0(.q(r_out[0]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[0]));
	register rs1(.q(r_out[1]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[1]));
	register rs2(.q(r_out[2]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[2]));
	register rs3(.q(r_out[3]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[3]));
	register rs4(.q(r_out[4]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[4]));
	register rs5(.q(r_out[5]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[5]));
	register rs6(.q(r_out[6]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[6]));
	register rs7(.q(r_out[7]), .data(writeInData), .clk(clk), .rst(rst), .write(writeSigs[7]));
	
	assign err = ((read1RegSel === 3'bxxx | read1RegSel === 3'bzzz)| 
					(read2RegSel === 3'bxxx| read2RegSel === 3'bzzz)| 
					(writeRegSel === 3'bxxx| writeRegSel === 3'bzzz)| 
					(writeInData === 16'hxxxx| writeInData === 16'hzzzz)| 
					(writeEn === 1'bx| writeEn === 1'bz))? 1'b1: 1'b0; //Unknown
	
	
	assign read1OutData = r_out[read1RegSel];
	assign read2OutData = r_out[read2RegSel];

endmodule
`default_nettype wire
