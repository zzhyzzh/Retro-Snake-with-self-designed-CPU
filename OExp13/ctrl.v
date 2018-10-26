`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:59 05/16/2016 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
	input clk,
	input reset,
	input [31:0] Inst_in,
	input zero,
	input overflow,
	input MIO_ready,
	output reg MemRead,
	output reg MemWrite,
	output reg[2:0]ALU_operation,
	output [4:0]state_out,
	output reg CPU_MIO,
	output reg IorD,
	output reg IRWrite,
	output reg [1:0]RegDst,
	output reg RegWrite,
	output reg [1:0]MemtoReg,
	output reg ALUSrcA,
	output reg [1:0]ALUSrcB,
	output reg [1:0]PCSource,
	output reg PCWrite,
	output reg PCWriteCond,
	output reg Branch
 );
	reg [4:0]state;
	reg [1:0] ALUop;

	assign state_out = state;

	parameter IF      = 5'b00000,
				 ID      = 5'b00001, 
				 EX_Mem  = 5'b00010, 
				 MEM_RD  = 5'b00011, 
				 WB_LW   = 5'b00100,
				 MEM_WD  = 5'b00101, 
				 EX_R    = 5'b00110, 
				 WB_R    = 5'b00111, 
				 EX_beq  = 5'b01000, 
				 Exe_J   = 5'b01001,
				 EX_I    = 5'b01010, 
				 WB_I    = 5'b01011, 
				 Lui_WB  = 5'b01100,
				 EX_bne  = 5'b01101, 
				 EX_jr   = 5'b01110, 
				 EX_JAL  = 5'b01111, 
				 Error   = 5'b11111;
				 
	parameter  AND=3'b000, 
				  OR =3'b001, 
				  ADD=3'b010, 
				  SUB=3'b110, 
				  NOR=3'b100, 
				  SLT=3'b111,
				  XOR=3'b011, 
				  SRL=3'b101;
				  
	parameter  value0 = 17'b10010100000100001, 
				  value1 = 17'b00000000001100000,
				  value2 = 17'b00000000001010000, 
				  value3 = 17'b00110000001010001,
				  value4 = 17'b00000001000001000, 
				  value5 = 17'b00101000001010001,
				  value6 = 17'b00000000000010000, 
				  value7 = 17'b00000000000011010, 
				  value8 = 17'b01000000010010000, 
				  value9 = 17'b10000000101100000,
				  value10= 17'b00000000001010000, 
				  value11= 17'b00000000001011000,
				  value12= 17'b00000010001101000, 
				  value13= 17'b01000000010010000,
				  value14= 17'b10000000000010000, 
				  value15= 17'b10000011101101100;
				  

	`define  Datapath_signals {PCWrite, PCWriteCond,IorD, MemRead, MemWrite,IRWrite, MemtoReg, PCSource, ALUSrcB, ALUSrcA, RegWrite, RegDst,CPU_MIO}

	//状态机
		always @ (posedge clk or posedge reset) begin
			if  (reset==1) state <= IF;
			else
				case (state)
					IF:  if (MIO_ready) state <= ID; 
						  else  state <= IF;
					
					ID:  
						case (Inst_in[31:26])
							6'b100011: state <= EX_Mem;  	//Lw
							6'b101011: state <= EX_Mem;  	//sw	
							6'b000100: state <= EX_beq;  	//Beq
							6'b000101: state <= EX_bne; 	//Bne
							6'b001000: state <= EX_I; 		//addi
							6'b001100: state <= EX_I; 		//andi
							6'b001101: state <= EX_I;		//ori
							6'b001110: state <= EX_I;
							6'b001111: state <= EX_I; 		//lui
							6'b001010: state <= EX_I; 		//slti
							6'b000011: state <= EX_JAL;	//jal
							6'b000010: state <= Exe_J; 	//Jump
							6'b000000: 
								case(Inst_in[5:0])
									6'b001000: state <= EX_jr; //jr   jalr未执行
									default:state <= EX_R; //R-type OP
								endcase
							default : state <= Error;
							
						endcase
						
					EX_Mem:
						case (Inst_in[31:26])
							6'b100011: state <= MEM_RD; //Lw
							6'b101011: state <= MEM_WD; //sw
							default : state <= Error;
						endcase
					MEM_RD:
						case (Inst_in[31:26])
							6'b100011: state <= WB_LW; //Lw
							default : state <= Error;
						endcase
					WB_LW:
						case (Inst_in[31:26])
							6'b100011: state <= IF; //Lw
							default : state <= Error;
						endcase
					MEM_WD:
						case (Inst_in[31:26])
							6'b101011: state <= IF; //sw
							default : state <= Error;
						endcase
					EX_R:
						case (Inst_in[31:26])
							6'b000000: state <= WB_R; //R-Type
							default : state <= Error;
						endcase
					WB_R:
						case (Inst_in[31:26])
							6'b000000: state <= IF; //R-Type
							default : state <= Error;
						endcase
					EX_beq:
						case (Inst_in[31:26])
							6'b000100: state <= IF; //beq
							default : state <= Error;
						endcase
					
					EX_bne:
						case (Inst_in[31:26])
							6'b000101: state <= IF; //bne，扩展
							default : state <= Error;
						endcase
					EX_I:
						case (Inst_in[31:26])
							6'b001111: state <= Lui_WB;//lui，扩展
							default  : state <= WB_I;
						endcase
					Lui_WB:
						case (Inst_in[31:26])
							6'b001111: state <= IF; //lui，写回
							default : state <= Error;
						endcase
					EX_jr:
						case (Inst_in[31:26])
							6'b000000: state <= IF; //jr
							default : state <= Error;
						endcase
					EX_JAL:
						case (Inst_in[31:26])
							6'b000011: state <= IF; //jal
							default : state <= Error;
						endcase
					Exe_J:
						case (Inst_in[31:26])
							6'b000010: state <= IF; //jump
							default : state <= Error;
						endcase
					WB_I:
						state <= IF;
					Error :  state <= Error;
					default : state <= Error;
				endcase
		end

	//数据通路控制(包括ALU)
	always @ * begin
		ALU_operation = ADD;
		Branch = 1;
		case(state) //state
			IF:  		`Datapath_signals = value0;
			ID: 		`Datapath_signals = value1;
			EX_Mem: 	`Datapath_signals = value2;
			MEM_RD:	`Datapath_signals = value3;
			WB_LW:   `Datapath_signals = value4;
			MEM_WD:  `Datapath_signals = value5;
			EX_R: 			//R-type
				begin
					`Datapath_signals = value6;
					case (Inst_in[5:0])
						6'b100000: ALU_operation = ADD;
						6'b100010: ALU_operation = SUB;
						6'b100100: ALU_operation = AND;
						6'b100101: ALU_operation = OR;
						6'b100111: ALU_operation = NOR;
						6'b101010: ALU_operation = SLT;
						6'b000010: ALU_operation = SRL; 
						6'b100110: ALU_operation = XOR;
					default: ALU_operation = ADD;
					endcase
				end
			WB_R: 	`Datapath_signals = value7;
			EX_beq:
				begin 
						`Datapath_signals = value8;
							 ALU_operation = SUB; 
				end
			Exe_J:   `Datapath_signals = value9;
			EX_I:  
				begin
					`Datapath_signals = value10;
					case (Inst_in[31:26])
						6'b001000: ALU_operation = ADD;
						6'b001100: ALU_operation = AND;
						6'b001101: ALU_operation = OR;
						6'b001110: ALU_operation = XOR;
						6'b001010: ALU_operation = SLT;
					default: ALU_operation = ADD;
					endcase
				end
			
			WB_I:   `Datapath_signals = value11;
			
			Lui_WB: `Datapath_signals = value12;
			
			EX_bne: 
				begin 
					  `Datapath_signals = value13; 
							ALU_operation = SUB; 
									 Branch = 0;
				end
			EX_jr:  `Datapath_signals = value14;
			
			EX_JAL: `Datapath_signals = value15;
		
			default:`Datapath_signals = value0;
		endcase
	end
endmodule
