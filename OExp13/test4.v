`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:36 06/29/2016
// Design Name:   VGA
// Module Name:   D:/ISE/OExp13/OExp13/test4.v
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

module test4;

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
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset = 1;
		#100; 
       reset = 0;
		// Add stimulus here

	end
      
	always #10 clk = ~clk; //模拟时钟周期
endmodule

