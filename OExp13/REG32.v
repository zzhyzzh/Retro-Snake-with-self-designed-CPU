`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:14 04/04/2016 
// Design Name: 
// Module Name:    REG32 
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
module REG32(
	input clk,
	input CE,
	input rst,
	input [31:0]D,
	output reg[31:0]Q
    );
	always @(posedge clk or posedge rst) begin
		if(rst==1) Q<=0;
		else if(CE==1)	Q<=D;
	end

endmodule
