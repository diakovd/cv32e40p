`include "../example_tb/fpga_sys/source/defines.sv"

`timescale 1 ps / 1 ps

`define XilinxBoard

 module cv32e40p_sys_tb;
 
 parameter  VENDOR = "Simulation"; //optional "IntelFPGA", "Simulation", "Xilinx"
 parameter int    MEM_SIZE  =  16 * 1024 * 4; // 4 kB
 
 logic  Rstn = 0;
 logic 	TX;
 logic 	RX;

 initial #200000 Rstn = 1; 
  
`ifdef XilinxBoard
 logic  Clk125 = 0;

 cv32e40p_sys_atrix7 
 #(
	.VENDOR(VENDOR),
	.MEM_SIZE()
 )	
 cv32e40p_sys_atrix7_inst(
	.TX(TX),
	.RX(RX),
	.Clk125M(Clk125),
    .Rst_n(Rstn)	 
 );

 always #4000 Clk125 <= ~Clk125; 

`else
 logic Clk = 0;
 
 cv32e40p_sys_cycloneIV 
 #(
	.VENDOR(VENDOR),
	.MEM_SIZE(MEM_SIZE)
 ) 
 cv32e40p_sys_cycloneIV_inst(
 
	.TX(TX),
	.RX(RX),
//	output [31:0] LED,
    .Clk(Clk),
    .sys_rst_n(Rstn)	 
 );

 always #10000 Clk <= ~Clk; 
`endif

 // BootLoader_tb 
 // #(
	// .STPbyte(8'h55),
	// .ONbyte( 8'hAA),
	// .BaudRate(768) //9600
 // )  
 // BootLoader_tb_inst(
	// .TX(RX) //TX UART line
 // ); 

 endmodule