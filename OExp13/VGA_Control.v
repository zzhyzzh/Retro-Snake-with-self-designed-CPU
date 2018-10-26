`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:40:32 06/28/2016 
// Design Name: 
// Module Name:    VGA_Control 
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
module VGA_Control(
			input rst,
			input [3:0] blockState,
			input [9:0] x_ptr,
			input [9:0] y_ptr,
			input clk,
			output reg [11:0] RGB);	
	always @(posedge clk)
	begin
			case(blockState[3:0])
				4'b0000://空白
					RGB <= 12'hfff;
				4'b0001://果子
					begin
					if(x_ptr[4:0]>3&&x_ptr[4:0]<28&&y_ptr[4:0]>3&&y_ptr[4:0]<28)
						RGB <= 12'hf00;
					else RGB <= 12'hfff;
					end
				4'b0010://身上
					begin
						RGB <= 12'hfc1;
					end
				4'b0011://身下
					begin
						RGB <= 12'hfc1;
					end
				4'b0100://身左
					begin
						RGB <= 12'hfc1;
					end
				4'b0101://身右
					begin
						RGB <= 12'hfc1;
					end
				4'b0110://头上
					begin
						RGB <= 12'habc;
					end
				4'b0111://头下
					begin
						RGB <= 12'habc;
					end
				4'b1000://头左
					begin
						RGB <= 12'habc;
					end
				4'b1001://头右
					begin
						RGB <= 12'habc;
					end
				default:
					RGB <= 12'hfff;
			endcase
	end
endmodule
