`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:01 06/29/2016
// Design Name:   VGA_Control
// Module Name:   D:/ISE/OExp13/OExp13/test1.v
// Project Name:  OExp03-IP2SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg [2:0] blockState;
	reg [9:0] x_ptr;
	reg [9:0] y_ptr;
	reg valid;
	reg clk;

	// Outputs
	wire [11:0] RGB;

	// Instantiate the Unit Under Test (UUT)
	VGA_Control uut (
		.blockState(blockState), 
		.x_ptr(x_ptr), 
		.y_ptr(y_ptr), 
		.valid(valid), 
		.clk(clka), 
		.RGB(RGB)
	);

	initial begin
		// Initialize Inputs
		blockState = 0;
		x_ptr = 0;
		y_ptr = 0;
		valid = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
       valid = 1;
		 blockState = 3'b000;
		
		x_ptr = 300;
		y_ptr = 200;
		// Add stimulus here

	end
      
	always #10 clka = ~clka; //模拟时钟周期
endmodule

