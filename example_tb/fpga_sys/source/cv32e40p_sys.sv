// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
 `include "../example_tb/fpga_sys/source/defines.sv"
 `include "../example_tb/fpga_sys/source/bus_mux/ahb3lite_bus/ahb3lite_bus.sv" 
 
// synthesis translate_off
`define defSIM
// synthesis translate_on
 import ahb3lite_pkg::*;
 import cv32e40p_apu_core_pkg::*;
 
 module cv32e40p_sys #(
    parameter INSTR_RDATA_WIDTH = 32,
    parameter RAM_ADDR_WIDTH = 32,
    parameter BOOT_ADDR = 'h0,
    parameter PULP_XPULP = 0,
    parameter PULP_CLUSTER = 0,
    parameter FPU = 0,
    parameter PULP_ZFINX = 0,
    parameter NUM_MHPMCOUNTERS = 1,
    parameter DM_HALTADDRESS = 32'h1A110800,
    parameter              VENDOR    = "Simulation", //optional "IntelFPGA" "Simulation" "Xilinx"
    parameter int          MEM_SIZE  = 16 * 1024 // 4 kB
)(
	output TX,
	input  RX,
	
    output [31:0] IO,
	
	output [7:0] LEDen,
	output	LEDA,
	output	LEDB,
	output	LEDC,
	output	LEDD,
	output	LEDE,
	output	LEDF,
	output	LEDG,
	output	LEDDP,
	
	output [1:0] PWM,
	input  [1:0] Evnt,
	
	input Clk_14_7456MHz,
	input clk_sys,
	input rst_sys_n
 );

  // Instruction connection to SRAM
  logic        instr_req;
  logic        instr_gnt;
  logic        instr_rvalid;
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;

  // Data connection to SRAM
  logic        data_req;
  logic        data_gnt;
  logic        data_rvalid;
  logic        data_we;
  logic  [3:0] data_be;
  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;

 // SRAM arbiter
 logic [31:0] mem_addr;
 logic        mem_req;
 logic        mem_write;
 logic  [3:0] mem_be;
 logic [31:0] mem_wdata;
 logic        mem_rvalid;
 logic [31:0] mem_rdata;

 logic Int_UART;
 logic Int_Timer;
 logic Int_Timer1;
 logic RstBoot;

 logic [63:0] dgt1_8;

 logic                               core_sleep_o;
 // signals for ri5cy
 logic               fetch_enable;
 // signals to debug unit
 logic                               debug_req_i;
  
 // irq signals
 logic                               irq_ack;
 logic [                  4:0]       irq_id_out;
 logic                               irq_external = 0;
 logic [                 15:0]       irq_fast = 0;
  
 // APU Core to FP Wrapper
 logic                               apu_req;
 logic [    APU_NARGS_CPU-1:0][31:0] apu_operands;
 logic [      APU_WOP_CPU-1:0]       apu_op;
 logic [ APU_NDSFLAGS_CPU-1:0]       apu_flags;


 // APU FP Wrapper to Core
 logic                               apu_gnt;
 logic                               apu_rvalid;
 logic [                 31:0]       apu_rdata;
 logic [ APU_NUSFLAGS_CPU-1:0]       apu_rflags;

 // CPUdataMemBus 	CPUdataMem();
 // RAMbus  		Data_RAMbus();
 // AXI4bus 		AXI4busIO();
 
 DatBus instr_DatBus();
 CtrBus instr_CtrBus();	

 DatBus Boot_DatBus();
 CtrBus Boot_CtrBus();	

 DatBus data_DatBus();
 CtrBus data_CtrBus();	

 CtrBus IO_CtrBus();
 CtrBus RAM_CtrBus();
 CtrBus UART0_CtrBus();
 CtrBus mtimer_CtrBus();	
 ahb3lite_bus tm0_Bus(clk_sys,rst_sys_n);
 ahb3lite_bus tm1_Bus(clk_sys,rst_sys_n);

  // instantiate the core
  cv32e40p_wrapper #(
      .PULP_XPULP      (PULP_XPULP),
      .PULP_CLUSTER    (PULP_CLUSTER),
      .FPU             (FPU),
      .PULP_ZFINX      (PULP_ZFINX),
      .NUM_MHPMCOUNTERS(NUM_MHPMCOUNTERS)
  ) wrapper_i (
      .clk_i (clk_sys),
      .rst_ni(rst_sys_n & !RstBoot),

      .pulp_clock_en_i(1'b1),
      .scan_cg_en_i   (1'b0),

      .boot_addr_i        (BOOT_ADDR),
      .mtvec_addr_i       (32'h0),
      .dm_halt_addr_i     (DM_HALTADDRESS),
      .hart_id_i          (32'h0),
      .dm_exception_addr_i(32'h0),

      .instr_addr_o  (instr_DatBus.addr),
      .instr_req_o   (instr_CtrBus.req),
      .instr_rdata_i (instr_CtrBus.rdata),
      .instr_gnt_i   (instr_CtrBus.gnt),
      .instr_rvalid_i(instr_CtrBus.rvalid),

      .data_addr_o  (data_DatBus.addr),
      .data_wdata_o (data_DatBus.wdata),
      .data_we_o    (data_CtrBus.we),
      .data_req_o   (data_CtrBus.req),
      .data_be_o    (data_DatBus.be),
      .data_rdata_i (data_CtrBus.rdata),
      .data_gnt_i   (data_CtrBus.gnt),
      .data_rvalid_i(data_CtrBus.rvalid),

      .apu_req_o     (apu_req),
      .apu_gnt_i     (apu_gnt),
      .apu_operands_o(apu_operands),
      .apu_op_o      (apu_op),
      .apu_flags_o   (apu_flags),
      .apu_rvalid_i  (apu_rvalid),
      .apu_result_i  (apu_rdata),
      .apu_flags_i   (apu_rflags),

      .irq_i    ({irq_fast, 4'b0, irq_external, 3'b0, Int_Timer, 3'b0, Int_UART, 3'b0}),
      .irq_ack_o(irq_ack),
      .irq_id_o (irq_id_out),

      .debug_req_i      (debug_req_i),
      .debug_havereset_o(),
      .debug_running_o  (),
      .debug_halted_o   (),

      .fetch_enable_i(fetch_enable),
      .core_sleep_o  (core_sleep_o)
  );



  
  // make the core start fetching instruction immediately
  assign fetch_enable = '1;
  assign debug_req_i = 1'b0;
	
  generate
    if (FPU) begin
      cv32e40p_fp_wrapper fp_wrapper_i (
          .clk_i         (clk_sys),
          .rst_ni        (rst_sys_n & !RstBoot),
          .apu_req_i     (apu_req),
          .apu_gnt_o     (apu_gnt),
          .apu_operands_i(apu_operands),
          .apu_op_i      (apu_op),
          .apu_flags_i   (apu_flags),
          .apu_rvalid_o  (apu_rvalid),
          .apu_rdata_o   (apu_rdata),
          .apu_rflags_o  (apu_rflags)
      );
    end else begin
      assign apu_gnt_o      = '0;
      assign apu_operands_i = '0;
      assign apu_op_i       = '0;
      assign apu_flags_i    = '0;
      assign apu_rvalid_o   = '0;
      assign apu_rdata_o    = '0;
      assign apu_rflags_o   = '0;
    end
  endgenerate

  
 
 bus_mux bus_mux_inst(
 	.data_DatBus(data_DatBus.Slave),
	.data_CtrBus(data_CtrBus.Slave),
	.RAM_CtrBus(RAM_CtrBus.Master),
	.IO_CtrBus(IO_CtrBus.Master),
	.UART0_CtrBus(UART0_CtrBus.Master),
	.mtimer_CtrBus(mtimer_CtrBus.Master),
	.tm0_Bus(tm0_Bus.master),
	.tm1_Bus(tm1_Bus.master),

	.Rst(!rst_sys_n | RstBoot),
	.Clk(clk_sys)
 );
 
  // SRAM block for instruction 
  rom_1p #(
	.VENDOR(VENDOR),
    .Depth(MEM_SIZE)
  ) u_ram_instr
  (
	.CPUdat(instr_DatBus.Slave),
	.CPUCtr(instr_CtrBus.Slave),
	
	.RAM_DatBus(data_DatBus.Slave),
	.RAM_CtrBus(RAM_CtrBus.Slave),
	
	.BootDat(Boot_DatBus.Slave),
	.BootCtr(Boot_CtrBus.Slave),
	
	.RstBoot(RstBoot),
    .clk(clk_sys),
    .rst_n(rst_sys_n)
  );
 
generate

if(VENDOR  == "Xilinx") begin 
 wire [31 : 0] probe0;
 wire [31 : 0] probe1;
 wire [31 : 0] probe2;
 wire [31 : 0] probe3;
 wire [31 : 0] probe4;   
 wire [9  : 0] probe5;
   
ila_0 your_instance_name (
	.clk(clk_sys), // input wire clk


	.probe0(probe0), // input wire [31:0]  probe0  
	.probe1(probe1), // input wire [31:0]  probe1 
	.probe2(probe2), // input wire [31:0]  probe2 
	.probe3(probe3), // input wire [31:0]  probe3 
	.probe4(probe4), // input wire [31:0]  probe4
	.probe5(probe5)
);
   
   
 assign probe0 = data_CtrBus.rdata;
 assign probe1 = 0;
 assign probe2 = UART0_CtrBus.rdata;
 assign probe3 = data_DatBus.addr;
 assign probe4 = data_DatBus.wdata;
 
 assign probe5[0] = data_CtrBus.rvalid;
 assign probe5[1] = data_CtrBus.req;
		
 assign probe5[2] = UART0_CtrBus.we;
 assign probe5[3] = UART0_CtrBus.req;
 assign probe5[4] = UART0_CtrBus.rvalid;
	
 assign probe5[5] = data_CtrBus.req;
 assign probe5[6] = TX;
 assign probe5[7] = RX;
	
 assign probe5[8] = IO_CtrBus.we;
 assign probe5[9] = IO_CtrBus.req;
	
	
	
 assign instr_DatBus.be = 4'hf;
 assign instr_DatBus.wdata = 32'h00000000;
 assign instr_CtrBus.we = 1'b0;

end
endgenerate  
  // SRAM block for data storage
  // ram_1p #(
	// .VENDOR(VENDOR),
    // .Depth(MEM_SIZE / 4)
  // ) u_ram_data
  // (
	// .DatBus(data_DatBus.Slave),
	// .CtrBus(RAM_CtrBus.Slave),
	
    // .clk(clk_sys),
    // .rst_n(rst_sys_n)
  // );  
  
 IOmodule IOmodule_inst(
   .DatBus(data_DatBus.Slave),
   .CtrBus(IO_CtrBus.Slave),

   //IO out
   .IO(IO),
   .dgt1_8(dgt1_8),
   
   .Rst(!rst_sys_n | RstBoot),	
   .Clk(clk_sys)
 );
 
 LED8x8 LED8x8_inst(
	.digit1(dgt1_8[7:0]),
	.digit2(dgt1_8[15:8]),
	.digit3(dgt1_8[23:16]),
	.digit4(dgt1_8[31:24]),
	.digit5(dgt1_8[39:32]),
	.digit6(dgt1_8[47:40]),
	.digit7(dgt1_8[55:48]),
	.digit8(dgt1_8[63:56]),
	
	.LEDen(LEDen),
	.LEDA(LEDA),
	.LEDB(LEDB),
	.LEDC(LEDC),
	.LEDD(LEDD),
	.LEDE(LEDE),
	.LEDF(LEDF),
	.LEDG(LEDG),
	.LEDDP(LEDDP),
	
	.Clk(clk_sys)
 );

 mtimer #(
		.addrBase(`addrBASE_mtimer)
		)
 mtimer_inst(
	.CPUdat(data_DatBus.Slave),
	.CPUctr(mtimer_CtrBus.Slave),
	
	.Int(Int_mtimer),
	.Rst(!rst_sys_n),
	.Clk(clk_sys)	
	);	

 UART #(
		.VENDOR(VENDOR),
		.BUS("OBI"),
		.addrBase(`addrBASE_UART0)
		)
 UART_inst(
	.CPUdat(data_DatBus.Slave),
	.CPUctr(UART0_CtrBus.Slave),

  	.TX(TX),
	.RX(RX),
	
	.Int(Int_UART),
	.Rst(!rst_sys_n),
	.Clk(clk_sys),
	.Clk_14MHz(Clk_14_7456MHz) 	//14.7456 MHz	
	
 );

 BootLoader  #(
	.STPbyte(8'h55),
	.ONbyte( 8'hAA),
	.BaudRate(8) //921600
 )
 
 BootLoader_inst(
	.RX(RX), //RX UART line
	
	.CPUdat(Boot_DatBus.Master),
	.CPUctr(Boot_CtrBus.Master),
	
	.Rst_out(RstBoot),//Reset system when loading memory instruction
	.Rst(!rst_sys_n),
	.Clk_14MHz(Clk_14_7456MHz),
	.Clk(clk_sys)
 );

 Timer #(
			.TM_SIZE(32),    		   
			.PWM_SIZE(1), 		     
			.BASE(`addrBASE_Timer),
			.HADDR_SIZE(32),     
			.HDATA_SIZE(32)      
		) 
 // .addrBase(`addrBASE_Timer),.bw(32))
 Timer_inst (
	// .CPUdat(data_DatBus.Slave),
	// .CPUctr(Timer_CtrBus.Slave),
	.CPUbus(tm0_Bus.slave),

	.Evnt0(Evnt[0]),
	.Evnt1(Evnt[1]),
	.Evnt2(1'b0),
	.PWM(),
	
	.Int(Int_Timer)
	// .Rst(!rst_sys_n | RstBoot),
	// .Clk(clk_sys)
 );
 assign tm0_Bus.HREADY = tm0_Bus.HREADYOUT;
 
 Timer
	#(
		.TM_SIZE(32),    		   
		.PWM_SIZE(2), 		     
		.BASE(`addrBASE_Timer1),
		.HADDR_SIZE(32),     
		.HDATA_SIZE(32)      
	)
// #(.addrBase(`addrBASE_Timer1),.bw(32),.bwPWM(2)) 
 Timer1_inst (
	// .CPUdat(data_DatBus.Slave),
	// .CPUctr(Timer1_CtrBus.Slave),
	.CPUbus(tm1_Bus.slave),

	.Evnt0(1'b0),
	.Evnt1(1'b0),
	.Evnt2(1'b0),
	.PWM(PWM),
	
	.Int(Int_Timer1)
	// .Rst(!rst_sys_n | RstBoot),
	// .Clk(clk_sys)
 );
 assign tm1_Bus.HREADY = tm1_Bus.HREADYOUT;

endmodule
