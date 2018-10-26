`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:43 06/27/2016 
// Design Name: 
// Module Name:    VGA 
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
module VGA(
	input  clk,
	input  reset,
	output hs,
	output vs,
	output [9:0] x_ptr,
	output [9:0] y_ptr,
	output valid);
	
	reg [9:0] cnt_x;
	reg [9:0] cnt_y;
	
	always @(posedge clk) 
	begin
		if (reset) 
		begin
			cnt_x <= 0;
		end 
		else 
		begin
			if (cnt_x == 10'd799)
				cnt_x <= 0;
			else
				cnt_x <= cnt_x + 1;
		end
	end
	
	always @(posedge clk) 
	begin
		if (reset) begin
			cnt_y <= 0;
		end 
		else begin
			if(cnt_x == 10'd799) begin
				if (cnt_y == 10'd524)
					cnt_y <= 0;
				else
					cnt_y <= cnt_y+1;
			end
		end		
	end
	assign x_ptr = cnt_x - 96 - 40 - 8;
	assign y_ptr = cnt_y - 2 - 25 - 8;
	assign hs = !((cnt_x>=0)&&(cnt_x<=96));
	assign vs = !((cnt_y>=0)&&(cnt_y<=2));
	assign valid = (cnt_x > 96+40+8) && (cnt_x<96+40+8+640) && (cnt_y>2+25+8) && (cnt_y<2+25+8+480);
	
endmodule
