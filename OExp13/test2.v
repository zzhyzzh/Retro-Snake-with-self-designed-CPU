`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:22:08 06/30/2016
// Design Name:   Multi_CPU
// Module Name:   D:/ISE/OExp13/OExp13/test2.v
// Project Name:  OExp03-IP2SOC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multi_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test2;

	// Inputs
	reg clk;
	reg reset;
	reg MIO_ready;
	reg [31:0] Data_in;
	reg INT;

	// Outputs
	wire [31:0] PC_out;
	wire [31:0] inst_out;
	wire mem_w;
	wire [31:0] Addr_out;
	wire [31:0] Data_out;
	wire CPU_MIO;
	wire [4:0] state;

	// Instantiate the Unit Under Test (UUT)
	Multi_CPU uut (
		.clk(clk), 
		.reset(reset), 
		.MIO_ready(MIO_ready), 
		.PC_out(PC_out), 
		.inst_out(inst_out), 
		.mem_w(mem_w), 
		.Addr_out(Addr_out), 
		.Data_out(Data_out), 
		.Data_in(Data_in), 
		.CPU_MIO(CPU_MIO), 
		.INT(INT), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		MIO_ready = 0;
		Data_in = 0;
		INT = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

