`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:36:10 06/28/2016 
// Design Name: 
// Module Name:    StateReg 
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
module StateReg(
			input clk,rst,L_S,over,
			input [9:0] reg_addr,
			input [4:0] xBlockNum, yBlockNum,
			input[31:0] data_in,
			output reg [31:0]data_out,
			output reg [3:0] BlockState);
	 reg [80:0] xBlockState [0:14];
	 integer i;
	 
	 wire [4:0] xBlockNum_lw, yBlockNum_lw;
	 wire [4:0] xBlockNum_sw, yBlockNum_sw;
	 assign xBlockNum_sw = data_in[8:4];
	 assign yBlockNum_sw = data_in[13:9];
	 assign xBlockNum_lw = reg_addr[4:0];
	 assign yBlockNum_lw = reg_addr[9:5];
	 
	 always @(posedge clk)
	   begin 
			if(rst==1 || over ==1) 
				for (i=0;i<=14;i=i+1) 
				begin
					xBlockState[i][79:0] <= 0;
				end
			//SW
			if(L_S)
			begin
				case(xBlockNum_sw)
				5'd0: xBlockState[yBlockNum_sw][3:0] <= data_in[3:0];
				5'd1: xBlockState[yBlockNum_sw][7:4] <= data_in[3:0];
				5'd2: xBlockState[yBlockNum_sw][11:8] <= data_in[3:0];
				5'd3: xBlockState[yBlockNum_sw][15:12] <= data_in[3:0];
				5'd4: xBlockState[yBlockNum_sw][19:16] <= data_in[3:0];
				5'd5: xBlockState[yBlockNum_sw][23:20] <= data_in[3:0];
				5'd6: xBlockState[yBlockNum_sw][27:24] <= data_in[3:0];
				5'd7: xBlockState[yBlockNum_sw][31:28] <= data_in[3:0];
				5'd8: xBlockState[yBlockNum_sw][35:32] <= data_in[3:0];
				5'd9: xBlockState[yBlockNum_sw][39:36] <= data_in[3:0];
				5'd10: xBlockState[yBlockNum_sw][43:40] <= data_in[3:0];
				5'd11: xBlockState[yBlockNum_sw][47:44] <= data_in[3:0];
				5'd12: xBlockState[yBlockNum_sw][51:48] <= data_in[3:0];
				5'd13: xBlockState[yBlockNum_sw][55:52] <= data_in[3:0];
				5'd14: xBlockState[yBlockNum_sw][59:56] <= data_in[3:0];
				5'd15: xBlockState[yBlockNum_sw][63:60] <= data_in[3:0];
				5'd16: xBlockState[yBlockNum_sw][67:64] <= data_in[3:0];
				5'd17: xBlockState[yBlockNum_sw][71:68] <= data_in[3:0];
				5'd18: xBlockState[yBlockNum_sw][75:72] <= data_in[3:0];
				5'd19: xBlockState[yBlockNum_sw][79:76] <= data_in[3:0];
				endcase
			end
			if(L_S == 0)//LW
			begin			
				case(xBlockNum_lw)
				5'd0: data_out <= {reg_addr,xBlockState[yBlockNum_lw][3:0]};
				5'd1: data_out <= {reg_addr,xBlockState[yBlockNum_lw][7:4]};
				5'd2: data_out <= {reg_addr,xBlockState[yBlockNum_lw][11:8]};
				5'd3: data_out <= {reg_addr,xBlockState[yBlockNum_lw][15:12]};
				5'd4: data_out <= {reg_addr,xBlockState[yBlockNum_lw][19:16]};
				5'd5: data_out <= {reg_addr,xBlockState[yBlockNum_lw][23:20]};
				5'd6: data_out <= {reg_addr,xBlockState[yBlockNum_lw][27:24]};
				5'd7: data_out <= {reg_addr,xBlockState[yBlockNum_lw][31:28]};
				5'd8: data_out <= {reg_addr,xBlockState[yBlockNum_lw][35:32]};
				5'd9: data_out <= {reg_addr,xBlockState[yBlockNum_lw][39:36]};
				5'd10: data_out <= {reg_addr,xBlockState[yBlockNum_lw][43:40]};
				5'd11: data_out <= {reg_addr,xBlockState[yBlockNum_lw][47:44]};
				5'd12: data_out <= {reg_addr,xBlockState[yBlockNum_lw][51:48]};
				5'd13: data_out <= {reg_addr,xBlockState[yBlockNum_lw][55:52]};
				5'd14: data_out <= {reg_addr,xBlockState[yBlockNum_lw][59:56]};
				5'd15: data_out <= {reg_addr,xBlockState[yBlockNum_lw][63:60]};
				5'd16: data_out <= {reg_addr,xBlockState[yBlockNum_lw][67:64]};
				5'd17: data_out <= {reg_addr,xBlockState[yBlockNum_lw][71:68]};
				5'd18: data_out <= {reg_addr,xBlockState[yBlockNum_lw][75:72]};
				5'd19: data_out <= {reg_addr,xBlockState[yBlockNum_lw][79:76]};
				endcase
			end
			
			case(xBlockNum)
				5'b00000: BlockState <= xBlockState[yBlockNum][3:0];
				5'b00001: BlockState <= xBlockState[yBlockNum][7:4];
				5'b00010: BlockState <= xBlockState[yBlockNum][11:8];
				5'b00011: BlockState <= xBlockState[yBlockNum][15:12];
				5'b00100: BlockState <= xBlockState[yBlockNum][19:16];//4
				5'b00101: BlockState <= xBlockState[yBlockNum][23:20];
				5'b00110: BlockState <= xBlockState[yBlockNum][27:24];
				5'b00111: BlockState <= xBlockState[yBlockNum][31:28];
				5'b01000: BlockState <= xBlockState[yBlockNum][35:32];
				5'b01001: BlockState <= xBlockState[yBlockNum][39:36];
				5'b01010: BlockState <= xBlockState[yBlockNum][43:40];
				5'b01011: BlockState <= xBlockState[yBlockNum][47:44];
				5'b01100: BlockState <= xBlockState[yBlockNum][51:48];
				5'b01101: BlockState <= xBlockState[yBlockNum][55:52];
				5'b01110: BlockState <= xBlockState[yBlockNum][59:56];
				5'b01111: BlockState <= xBlockState[yBlockNum][63:60];
				5'b10000: BlockState <= xBlockState[yBlockNum][67:64];
				5'b10001: BlockState <= xBlockState[yBlockNum][71:68];
				5'b10010: BlockState <= xBlockState[yBlockNum][75:72];
				5'b10011: BlockState <= xBlockState[yBlockNum][79:76];
			endcase
		end	
endmodule
