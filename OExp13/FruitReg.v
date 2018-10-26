`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:01 06/30/2016 
// Design Name: 
// Module Name:    FruitReg 
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
module FruitReg(input clk,rst,L_S,
					input[4:0]fruit_addr,
					output [31:0]fruit_next);
	 
	 reg [9:0] fruitOrder [0:30];
	 reg [4:0] count;
	 
	always @(posedge clk)
	begin 
		if(rst) 
		begin//max:1110_10100
			count <= 0;
			fruitOrder[0] <= 10'b110010001;
			fruitOrder[1] <= 10'b110000100;
			fruitOrder[2] <= 10'b101000110;
			fruitOrder[3] <= 10'b000110000;
			fruitOrder[4] <= 10'b010001000;
			fruitOrder[5] <= 10'b110100101;
			fruitOrder[6] <= 10'b100001000;
			fruitOrder[7] <= 10'b010110011;
			fruitOrder[8] <= 10'b010001010;
			fruitOrder[9] <= 10'b010100000;
			fruitOrder[10] <= 10'b100110000;
			fruitOrder[11] <= 10'b100001010;
			fruitOrder[12] <= 10'b001001000;
			fruitOrder[13] <= 10'b001000011;
			fruitOrder[14] <= 10'b101000111;
			fruitOrder[15] <= 10'b111000110;
			fruitOrder[16] <= 10'b100100100;
			fruitOrder[17] <= 10'b001101001;
			fruitOrder[18] <= 10'b011110000;
			fruitOrder[19] <= 10'b010101001;
			fruitOrder[20] <= 10'b001100110;
			fruitOrder[21] <= 10'b011001100;
			fruitOrder[22] <= 10'b100100110;
			fruitOrder[23] <= 10'b101000101;
			fruitOrder[24] <= 10'b111000101;
			fruitOrder[25] <= 10'b000000010;
			fruitOrder[26] <= 10'b000100111;
			fruitOrder[27] <= 10'b001000111;
			fruitOrder[28] <= 10'b110100001;
			fruitOrder[29] <= 10'b001010000;
			fruitOrder[30] <= 10'b110010001;
		end
	end
	assign fruit_next = {fruitOrder[fruit_addr],4'b0000};	
endmodule
