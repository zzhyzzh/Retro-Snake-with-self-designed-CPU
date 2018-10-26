`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:33:05 07/01/2016
// Design Name:   VGA
// Module Name:   D:/ISE/OExp13/OExp13/test_VGA.v
// Project Name:  OExp03-IP2SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_VGA;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire hs;
	wire vs;
	wire [9:0] x_ptr;
	wire [9:0] y_ptr;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	VGA uut (
		.clk(clk), 
		.reset(reset), 
		.hs(hs), 
		.vs(vs), 
		.x_ptr(x_ptr), 
		.y_ptr(y_ptr), 
		.valid(valid)
	);

	initial begin
		clk = 0;
		reset = 0;
		#100;        
		reset = 1;
		#100;        
		reset = 0;
	end
   always #10 clk  = ~clk;
endmodule

