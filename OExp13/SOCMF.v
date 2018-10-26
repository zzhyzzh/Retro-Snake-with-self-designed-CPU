`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:52 05/20/2016 
// Design Name: 
// Module Name:    SOCMF 
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

`timescale 1ns / 1ps

module SOCMF(
		input [3:0] BTN_y,
		input clk_100mhz,
		input RSTN,
		input [15:0] SW,
	
		output wire [3:0] Red,
		output wire [3:0] Green,
		output wire [3:0] Blue,
		output wire HSYNC,
		output wire VSYNC,
		
		output [3:0] AN,
		output [4:0] BTN_x,
		output Buzzer,
		output CR,
		output [7:0] LED,
		output led_clk,
		output led_clrn,
		output LED_PEN,
		output led_sout,
		output RDY,
		output readn,
		output [7:0] SEGMENT,
		output seg_clk,
		output seg_clrn,
		output SEG_PEN,
		output seg_sout);

   wire clk25;
   wire [31:0] Addr_out;
   wire [31:0] state_out;
   wire [31:0] Ai;
   wire [31:0] Bi;
   wire [7:0] blink;
   wire [3:0] BTN_OK;
   wire Clk_CPU;
   wire [31:0] Counter_out;
   wire [31:0] CPU2IO;
   wire [31:0] Data_in;
   wire [31:0] Data_out;
   wire [31:0] Disp_num;
   wire [31:0] Div;
   wire GPIOF0;
   wire GPIOc0;
   wire [31:0] inst;
   wire IO_clk;
   wire [15:0] LED_out;
   wire [7:0] LE_out;
   wire N0;
   wire [31:0] PC;
   wire [7:0] point_out;
   wire [3:0] Pulse;
   wire rst;
   wire [4:0] State;
   wire [15:0] SW_OK;
   wire V5;
	wire over;
   wire mem_w;
   wire [31:0] ram_data_out;
   wire [9:0] ram_addr;
   wire fruit_we;
   wire [31:0] fruit_next;	
   wire [9:0] reg_addr;
   wire data_ram_we;
   wire [31:0] ram_data_in;
   wire GPIOe0000000_we;
   wire addra9;
   wire wea0;
   wire wea1;
   wire wea2;
   wire [31:0] mem_w58;
   wire [1:0] mem_w60;
   wire [4:0] mem_w76;
	wire [4:0] fruit_addr;
   wire RDY_DUMMY;
   wire readn_DUMMY;
   
   assign RDY = RDY_DUMMY;
   assign readn = readn_DUMMY;
//-------U0---VGA_Display--------------------------------------
VGA_Display U0	(.clk(clk25),
					 .state_we(GPIOc0),
					 .data_in(CPU2IO),
					 .data_out(state_out),
					 .reg_addr(reg_addr),
					 .reset(rst),
					 .over(over),
					 .Red(Red),
					 .Green(Green),
					 .Blue(Blue),
					 .HSYNC(HSYNC),
					 .VSYNC(VSYNC));	
//-------U1---Multi_CPU-----------------------------------------
   Multi_CPU  U1 (.clk(Clk_CPU), 
                      .Data_in(Data_in[31:0]), 
                      .INT(wea0), 
                      .MIO_ready(V5), 
                      .reset(rst), 
                      .Addr_out(Addr_out[31:0]), 
                      .CPU_MIO(), 
                      .Data_out(Data_out[31:0]), 
                      .inst_out(inst[31:0]), 
                      .mem_w(mem_w), 
                      .PC_out(PC[31:0]), 
                      .state(State[4:0]));
//-------U3---RAM_B---------------------------------------------
   RAM_B  U3 (.addra(ram_addr[9:0]), 
                  .clka(clk_100mhz), 
                  .dina(ram_data_in[31:0]), 
                  .wea(data_ram_we), 
                  .douta(ram_data_out[31:0]));

//-------U4---MIO_BUS------------------------------------						
   MIO_BUS  U4 (.addr_bus(Addr_out[31:0]), 
               .BTN(BTN_OK[3:0]), 
               .clk(clk_100mhz), 
               .counter_out(mem_w58[31:0]), 
               .counter0_out(wea0), 
               .counter1_out(wea1), 
               .counter2_out(wea2), 
               .Cpu_data2bus(Data_out[31:0]), 
               .led_out(LED_out[15:0]), 
               .mem_w(mem_w), 
               .rst(rst), 
               .SW(SW_OK[15:0]), 
               .counter_we(addra9), 
               .Cpu_data4bus(Data_in[31:0]), 
               .data_ram_we(data_ram_we), 
               .GPIOe0000000_we(GPIOe0000000_we), 
               .GPIOc0000000_we(GPIOc0), 
               .GPIOf0000000_we(GPIOF0), 
               .Peripheral_in(CPU2IO[31:0]), 
					.ram_data_out(ram_data_out[31:0]),
					.reg_addr(reg_addr),
					.state_out(state_out),
               .ram_addr(ram_addr), 
               .ram_data_in(ram_data_in[31:0]),
					.over(over),
					.fruit_we(fruit_we),
					.fruit_addr(fruit_addr),
					.fruit_next(fruit_next));
//-------V31---FruitReg---------------------------------------------
FruitReg	V31(.clk(clk),
				.rst(reset),
				.L_S(fruit_we),	
				.fruit_addr(fruit_addr),
				.fruit_next(fruit_next));	
//-------U5---Multi_8CH32---------------------------------------
 Multi_8CH32  U5 (.clk(IO_clk), 
                       .Data0(CPU2IO[31:0]), 
                       .data1({N0, N0, PC[31:2]}), 
                       .data2(inst[31:0]), 
                       .data3(state_out), 
                       .data4(Addr_out[31:0]), 
                       .data5(Data_out[31:0]), 
                       .data6(Data_in[31:0]), 
                       .data7(PC[31:0]), 
                       .EN(GPIOe0000000_we), 
                       .LES({N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0,	N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0, 
									  N0, N0, N0, N0, N0, N0, N0, N0}), 
                       .point_in({Div[31:0], Div[31:0]}), 
                       .rst(rst), 
                       .Test(SW_OK[7:5]), 
                       .Disp_num(Disp_num[31:0]), 
                       .LE_out(LE_out[7:0]), 
                       .point_out(point_out[7:0]));
							  
//-------U6---SSeg7_Dev-----------------------------------------	
 SSeg7_Dev  U6 (.clk(clk_100mhz), 
                      .flash(Div[25]), 
                      .Hexs(Disp_num[31:0]), 
                      .LES(LE_out[7:0]), 
                      .point(point_out[7:0]), 
                      .rst(rst), 
                      .Start(Div[20]), 
                      .SW0(SW_OK[0]), 
                      .seg_clk(seg_clk), 
                      .seg_clrn(seg_clrn), 
                      .SEG_PEN(SEG_PEN), 
                      .seg_sout(seg_sout));
//-------U61---Seg7_Dev-----------------------------------------	
 Seg7_Dev  U61 (.flash(Div[25]), 
                     .Hexs(Disp_num[31:0]), 
                     .LES(LE_out[7:0]), 
                     .point(point_out[7:0]), 
                     .Scan({SW_OK[1], Div[19:18]}), 
                     .SW0(SW_OK[0]), 
                     .AN(AN[3:0]), 
                     .SEGMENT(SEGMENT[7:0]));
							
//-------U7---SPIO----------------------------------------------	
SPIO  U7 (.clk(IO_clk), 
                .EN(GPIOF0), 
                .P_Data(CPU2IO[31:0]), 
                .rst(rst), 
                .Start(Div[20]), 
                .counter_set(mem_w60[1:0]), 
                .GPIOf0(), 
                .led_clk(led_clk), 
                .led_clrn(led_clrn), 
                .LED_out(LED_out[15:0]), 
                .LED_PEN(LED_PEN), 
                .led_sout(led_sout));	
//-------U71---PIO----------------------------------------------
	PIO  U71 (.clk(IO_clk), 
                .EN(GPIOF0), 
                .PData_in(CPU2IO[31:0]), 
                .rst(rst), 
                .counter_set(), 
                .GPIOf0(), 
                .LED_out(LED[7:0]));
//-------U8---clk_div-------------------------------------------					 
   clk_div  U8 (.clk100(clk_100mhz), 
               .rst(rst), 
               .SW2(SW_OK[2]), 
               .clkdiv(Div[31:0]), 
               .Clk_CPU(Clk_CPU));
//-------U81---clk_div-------------------------------------------					 
clk_div_4 U81(
		.clk100(clk_100mhz),
		.clk25(clk25));
//-------U9---SAnti_jitter--------------------------------------
 SAnti_jitter  U9 (.clk(clk_100mhz), 
                        .Key_y(BTN_y[3:0]), 
                        .readn(readn_DUMMY), 
                        .RSTN(RSTN), 
                        .SW(SW[15:0]), 
                        .BTN_OK(BTN_OK[3:0]), 
                        .CR(CR), 
                        .Key_out(mem_w76[4:0]), 
                        .Key_ready(RDY_DUMMY), 
                        .Key_x(BTN_x[4:0]), 
                        .pulse_out(Pulse[3:0]), 
                        .rst(rst), 
                        .SW_OK(SW_OK[15:0]));
//-------U10---Counter_x----------------------------------------
   Counter_x  U10 (.clk(IO_clk), 
                  .clk0(Div[8]), 
                  .clk1(Div[9]), 
                  .clk2(Div[11]), 
                  .counter_ch(mem_w60[1:0]), 
                  .counter_val(CPU2IO[31:0]), 
                  .counter_we(addra9), 
                  .rst(rst), 
                  .counter_out(mem_w58[31:0]), 
                  .counter0_OUT(wea0), 
                  .counter1_OUT(wea1), 
                  .counter2_OUT(wea2));
//-------M4---SEnter_2_32---------------------------------------
 SEnter_2_32  M4 (.BTN(BTN_OK[2:0]), 
                        .clk(clk_100mhz), 
                        .Ctrl({SW_OK[7:5], SW_OK[15], SW_OK[0]}), 
                        .Din(mem_w76[4:0]), 
                        .D_ready(RDY_DUMMY), 
                        .Ai(Ai[31:0]), 
                        .Bi(Bi[31:0]), 
                        .blink(blink[7:0]), 
                        .readn(readn_DUMMY));
	INV  inv1 (.I(Clk_CPU), 
              .O(IO_clk));
   VCC  VCC_HIGH (.P(V5));
   GND  GND_LOW (.G(N0));
   
   
   BUF  XLXI_18 (.I(V5), 
                .O(Buzzer));

	
endmodule
