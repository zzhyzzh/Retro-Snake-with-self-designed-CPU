`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:04 06/27/2016 
// Design Name: 
// Module Name:    VGA_Display 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA_Display(
		input clk,
		input reset,
		input over,
		input state_we,
		input [9:0] reg_addr,
		input [31:0] data_in,
		output[31:0]data_out,
		output[3:0] Red,
		output[3:0] Green,
		output[3:0] Blue,
		output HSYNC,
		output VSYNC);
		
		wire [11:0]RGB;
		wire [9:0] x_ptr;
		wire [9:0] y_ptr;
		wire[3:0] BlockState;
//------V1---VGA-----------------------------------------------  
VGA V1 (.clk(clk),
		  .reset(reset),
		  .hs(HSYNC),
		  .vs(VSYNC),
		  .x_ptr(x_ptr),
		  .y_ptr(y_ptr),
		  .valid(valid));	
//-------V2---VGA_Control---------------------------------------------
VGA_Control V2 (.blockState(BlockState[3:0]),
			.x_ptr(x_ptr),
			.y_ptr(y_ptr),
			.rst(rst),
			.clk(clk),
			.RGB(RGB));
//-------V3---StateReg---------------------------------------------
StateReg	V3(.clk(clk),
				.rst(reset),
				.L_S(state_we),
				.over(over),
				.reg_addr(reg_addr),
				.xBlockNum(x_ptr[9:5]),
				.yBlockNum(y_ptr[9:5]),
				.data_in(data_in[31:0]),	
				.data_out(data_out[31:0]),	
				.BlockState(BlockState[3:0]));	
				
		assign Red = valid ? RGB[11:8] : 0;
		assign Green = valid ? RGB[7:4]: 0;
		assign Blue = valid ? RGB[3:0] : 0;

	
endmodule
