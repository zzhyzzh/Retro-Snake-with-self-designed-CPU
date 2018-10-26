`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:15:34 06/30/2016
// Design Name:   FruitReg
// Module Name:   D:/ISE/OExp13/OExp13/tset.v
// Project Name:  OExp03-IP2SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FruitReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tset;

	// Inputs
	reg clk;
	reg rst;
	reg L_S;

	// Outputs
	wire [31:0] fruit_next;

	// Instantiate the Unit Under Test (UUT)
	FruitReg uut (
		.clk(clk), 
		.rst(rst), 
		.L_S(L_S), 
		.fruit_next(fruit_next)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		L_S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		#100;
      rst = 1;
		#100
		rst = 0;
		L_S = 0;
		// Add stimulus here

	end
      always #10 clk = ~clk;	
endmodule

