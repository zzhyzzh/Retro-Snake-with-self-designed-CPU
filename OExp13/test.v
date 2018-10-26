`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:35 06/30/2016
// Design Name:   StateReg
// Module Name:   D:/ISE/OExp13/OExp13/test.v
// Project Name:  OExp03-IP2SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateReg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg rst;
	reg L_S;
	reg [9:0] reg_addr;
	reg [4:0] xBlockNum;
	reg [4:0] yBlockNum;
	reg [31:0] data_in;

	// Outputs
	wire [31:0] data_out;
	wire [3:0] BlockState;

	// Instantiate the Unit Under Test (UUT)
	StateReg uut (
		.clk(clk), 
		.rst(rst), 
		.L_S(L_S), 
		.reg_addr(reg_addr), 
		.xBlockNum(xBlockNum), 
		.yBlockNum(yBlockNum), 
		.data_in(data_in), 
		.data_out(data_out), 
		.BlockState(BlockState)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		L_S = 0;
		reg_addr = 0;
		xBlockNum = 0;
		yBlockNum = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;        
		rst = 1;
		
		#100;        
		rst = 0;				
		L_S = 1;
		data_in = 32'b0000_0000_0000_0000_0000_0100_0001_1001;
		#100;        		
		L_S = 0;
		yBlockNum = 5'b00010;
		xBlockNum = 5'b00001;
		reg_addr = 10'b00010_00001;
		// Add stimulus here

	end
      always #10 clk = ~clk;
endmodule

