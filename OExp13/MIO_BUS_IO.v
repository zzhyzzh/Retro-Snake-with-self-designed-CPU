`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:14 06/30/2012 
// Design Name: 
// Module Name:    MIO_BUS 
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
module MIO_BUS(input clk,
					input rst,
					input[3:0]BTN,
					input[15:0]SW,
					input mem_w,
					input[31:0]Cpu_data2bus,				//data from CPU
					input[31:0]addr_bus,
					input[31:0]ram_data_out,
					input[15:0]led_out,
					input[31:0]counter_out,
					input counter0_out,
					input counter1_out,
					input counter2_out,
					input[31:0]fruit_next,
					input[31:0]state_out,
					output reg[31:0]Cpu_data4bus,				//write to CPU
					output reg[31:0]ram_data_in,				//from CPU write to Memory
					output reg[9:0]ram_addr,						//Memory Address signals
					output reg[9:0]reg_addr,					
					output reg data_ram_we,
					output reg GPIOf0000000_we,
					output reg GPIOe0000000_we,
					output reg GPIOc0000000_we,
					output reg counter_we,
					output reg[31:0]Peripheral_in,
					output reg fruit_we,
					output reg [4:0]fruit_addr,
					output reg over);
					
	reg data_ram_rd, 
		 GPIOf0000000_rd, 
		 GPIOe0000000_rd,
		 GPIOc0000000_rd,
		 fruit_rd,
		 BTN_rd,
		 counter_rd;
		 
	//RAM&IO decode signals:				
	always @* begin
	
		data_ram_we = 0;		//主存写信号	
		data_ram_rd = 0;		//主存读信号
		counter_we = 0;		//计数器写信号
		counter_rd = 0;		//计数器都信号
		GPIOf0000000_we = 0;	//设备1：PIO写信号
		GPIOe0000000_we = 0;	//计数器：Counter_x写信号
		GPIOc0000000_we = 0;
		BTN_rd = 0;
		fruit_rd = 0;
		GPIOc0000000_rd = 0;
		GPIOf0000000_rd = 0;	//设备3、4：SW等读信号
		GPIOe0000000_rd = 0;	//设备2：七段显示器写信号
		ram_addr = 10'h0;		//内存物理地址：RAM_B地址
		reg_addr = 10'h0;
		ram_data_in = 32'h0;	//内存都数据：RAM_B输出数据
		Peripheral_in = 32'h0;//外设总线：CPU输出，外设写入数据
		
		//译码开始
		case(addr_bus[31:28])
			4'h0:begin	//data_ram(00000000 - 00000ffc, lower 4KB RAM)
				  data_ram_we = mem_w;
				  ram_addr = addr_bus[11:2];
				  ram_data_in = Cpu_data2bus;
				  data_ram_rd = ~mem_w;
				  end
			4'he:begin//七段显示器(e0000000 - efffffff, SSeg7_dev)
				  GPIOe0000000_we = mem_w;
				  Peripheral_in = Cpu_data2bus;
				  GPIOe0000000_rd = ~mem_w;
				  end
			4'hf:
			begin//PIO(f0000000 - fffffff0, 8LEDs & counter, f0000004 - ffffff4)
				if(addr_bus[2])//f0000004
					begin
						counter_we = mem_w;
						Peripheral_in = Cpu_data2bus;
						counter_rd = ~mem_w;
					end
				else
					begin//f0000000
						GPIOf0000000_we = mem_w;
						Peripheral_in = Cpu_data2bus;
						GPIOf0000000_rd = ~mem_w;
					end
			end
			4'h1:
			begin
				Peripheral_in = Cpu_data2bus;
				BTN_rd = ~mem_w;
			end	
			4'h2:
			begin
				Peripheral_in = Cpu_data2bus;
				over = mem_w;
			end	
			4'h3:
			begin
				fruit_rd = ~mem_w;
				fruit_addr = addr_bus[4:0];
			end	
			4'hc:
			begin
				GPIOc0000000_we = mem_w;
				Peripheral_in = Cpu_data2bus;
				GPIOc0000000_rd = ~mem_w;
				reg_addr = addr_bus[13:4];
			end			
		endcase
		
		casex({fruit_rd,BTN_rd, GPIOc0000000_rd, data_ram_rd,GPIOe0000000_rd,counter_rd,GPIOf0000000_rd})
			7'b1xxxxxx:Cpu_data4bus = fruit_next; //read from StateReg
			7'bx1xxxxx:Cpu_data4bus = BTN; //read from StateReg
			7'bxx1xxxx:Cpu_data4bus = state_out; //read from StateReg
			7'bxxx1xxx:Cpu_data4bus = ram_data_out; //read from RAM
			7'bxxxx1xx:Cpu_data4bus = counter_out;  //read from Counter
			7'bxxxxx1x:Cpu_data4bus = counter_out;  //read from Counter
			7'bxxxxxx1:Cpu_data4bus = {counter0_out,counter1_out,counter2_out,led_out[12:0],SW}; //read from SW & BTN
		endcase
	end
endmodule
