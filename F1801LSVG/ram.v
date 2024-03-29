`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:33 07/24/2017 
// Design Name: 
// Module Name:    ram 
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
module RAM(
  input [15:0]di,
  input [15:0]addr,
  input we, clk,
  input [1:0]sel,
  output[15:0]Q
);
/*
 10..0 - low bit address (in BRAM) 3FF..0 - 2048 (2K)
 
 BFFF - LAST ADDR - [1011.1][111.1111.1111]
 07FF..0000  - b00 - 2K 
 0FFF..0800  - b01 - 4K
 -----------------------
 17FF..1000  - b02 - 6K
 1FFF..1800  - b03 - 8K
 -----------------------
 27FF..2000  - b04 - 10K
 2FFF..2800  - b05 - 12K
 -----------------------
 37FF..3000  - b06 - 14K
 3FFF..3800  - b07 - 16K
 -----------------------
 47FF..4000  - b08 - 18K
 4FFF..4800  - b09 - 20K
 -----------------------
 57FF..5000  - b10 - 22K
 5FFF..5800  - b11 - 24K
 -----------------------
 67FF..6000  - b12 - 26K
 6FFF..6800  - b13 - 28K
 -----------------------
 77FF..7000  - b14 - 30K
 7FFF..7800  - b15 - 32K
 -----------------------
 87FF..8000  - b16 - 34K
 8FFF..8800  - b17 - 36K
 -----------------------
 97FF..9000  - b18 - 38K
 9FFF..9800  - b19 - 40K
 -----------------------
 A7FF..A000  - b20 - 42K
 AFFF..A800  - b21 - 44K
 -----------------------
 B7FF..B000  - b22 - 46K
*/

wire [4:0]CS = addr[15:11];
wire [15:0]data[22:0];
wire [22:0]wr = {21'd0, we} << CS;

assign Q = data[CS];

RAM16 RAM_00(.data_a(di),.addr_a(addr[10:1]),.q_a(data[0]),.we_a(wr[0]),.sel_a(sel),.clk(clk));
RAM16_1 RAM_01(.data_a(di),.addr_a(addr[10:1]),.q_a(data[1]),.we_a(wr[1]),.sel_a(sel),.clk(clk));
RAM16 RAM_02(.data_a(di),.addr_a(addr[10:1]),.q_a(data[2]),.we_a(wr[2]),.sel_a(sel),.clk(clk));
RAM16 RAM_03(.data_a(di),.addr_a(addr[10:1]),.q_a(data[3]),.we_a(wr[3]),.sel_a(sel),.clk(clk));
RAM16 RAM_04(.data_a(di),.addr_a(addr[10:1]),.q_a(data[4]),.we_a(wr[4]),.sel_a(sel),.clk(clk));
RAM16 RAM_05(.data_a(di),.addr_a(addr[10:1]),.q_a(data[5]),.we_a(wr[5]),.sel_a(sel),.clk(clk));
RAM16 RAM_06(.data_a(di),.addr_a(addr[10:1]),.q_a(data[6]),.we_a(wr[6]),.sel_a(sel),.clk(clk));
RAM16 RAM_07(.data_a(di),.addr_a(addr[10:1]),.q_a(data[7]),.we_a(wr[7]),.sel_a(sel),.clk(clk));
RAM16 RAM_08(.data_a(di),.addr_a(addr[10:1]),.q_a(data[8]),.we_a(wr[8]),.sel_a(sel),.clk(clk));
RAM16 RAM_09(.data_a(di),.addr_a(addr[10:1]),.q_a(data[9]),.we_a(wr[9]),.sel_a(sel),.clk(clk));
RAM16 RAM_10(.data_a(di),.addr_a(addr[10:1]),.q_a(data[10]),.we_a(wr[10]),.sel_a(sel),.clk(clk));
RAM16 RAM_11(.data_a(di),.addr_a(addr[10:1]),.q_a(data[11]),.we_a(wr[11]),.sel_a(sel),.clk(clk));
RAM16 RAM_12(.data_a(di),.addr_a(addr[10:1]),.q_a(data[12]),.we_a(wr[12]),.sel_a(sel),.clk(clk));
RAM16 RAM_13(.data_a(di),.addr_a(addr[10:1]),.q_a(data[13]),.we_a(wr[13]),.sel_a(sel),.clk(clk));
RAM16 RAM_14(.data_a(di),.addr_a(addr[10:1]),.q_a(data[14]),.we_a(wr[14]),.sel_a(sel),.clk(clk));
RAM16 RAM_15(.data_a(di),.addr_a(addr[10:1]),.q_a(data[15]),.we_a(wr[15]),.sel_a(sel),.clk(clk));
RAM16 RAM_16(.data_a(di),.addr_a(addr[10:1]),.q_a(data[16]),.we_a(wr[16]),.sel_a(sel),.clk(clk));
RAM16 RAM_17(.data_a(di),.addr_a(addr[10:1]),.q_a(data[17]),.we_a(wr[17]),.sel_a(sel),.clk(clk));
RAM16 RAM_18(.data_a(di),.addr_a(addr[10:1]),.q_a(data[18]),.we_a(wr[18]),.sel_a(sel),.clk(clk));
RAM16 RAM_19(.data_a(di),.addr_a(addr[10:1]),.q_a(data[19]),.we_a(wr[19]),.sel_a(sel),.clk(clk));
RAM16 RAM_20(.data_a(di),.addr_a(addr[10:1]),.q_a(data[20]),.we_a(wr[20]),.sel_a(sel),.clk(clk));
RAM16 RAM_21(.data_a(di),.addr_a(addr[10:1]),.q_a(data[21]),.we_a(wr[21]),.sel_a(sel),.clk(clk));
RAM16 RAM_22(.data_a(di),.addr_a(addr[10:1]),.q_a(data[22]),.we_a(wr[22]),.sel_a(sel),.clk(clk));

endmodule


module RAM16(
        input [15:0] data_a,
        input [9:0] addr_a, 
        input we_a, clk,
		  input [1:0] sel_a,
        output[15:0] q_a
);

wire [1:0] WEA = we_a? sel_a : 2'b00;

// RAMB16BWER  : In order to incorporate this function into the design,
//   Verilog   : the following instance declaration needs to be placed
//  instance   : in the body of the design code.  The instance name
// declaration : (RAMB16BWER_inst) and/or the port declarations within the
//    code     : parenthesis may be changed to properly reference and
//             : connect this function to the design.  All inputs
//             : and outputs must be connected.

//  <-----Cut code below this line---->

   // RAMB16BWER: 16k-bit Data and 2k-bit Parity Configurable Synchronous Dual Port Block RAM with Optional Output Registers
   //             Spartan-6
   // Xilinx HDL Language Template, version 14.2

   RAMB16BWER #(
      // DATA_WIDTH_A/DATA_WIDTH_B: 0, 1, 2, 4, 9, 18, or 36
      .DATA_WIDTH_A(18),
      .DATA_WIDTH_B(0),
      // DOA_REG/DOB_REG: Optional output register (0 or 1)
      .DOA_REG(0),
      .DOB_REG(0),
      // EN_RSTRAM_A/EN_RSTRAM_B: Enable/disable RST
      .EN_RSTRAM_A("TRUE"),
      .EN_RSTRAM_B("TRUE"),
      // INITP_00 to INITP_07: Initial memory contents.
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
      // INIT_00 to INIT_3F: Initial memory contents.
.INIT_00(256'h036A_FF70_029A_0054_029A_0202_01F4_048A_029A_1547_000E_15C5_B6C0_15C4_B7A0_15C6),
.INIT_01(256'h0382_02A2_BFFF_029A_FF70_029A_036A_03B0_03AA_0202_01F4_049C_029A_0226_01E8_039A),
.INIT_02(256'h0350_032C_0008_029A_02A8_03B6_02A8_02D2_FF00_029A_0382_02A2_003C_0350_02D2_02A2),
.INIT_03(256'h02A2_0382_03B0_003C_033C_036A_03B0_0376_02A2_0020_029A_0314_0382_03B0_02BA_007A),
.INIT_04(256'h0382_03A4_036A_03A4_03AA_02C0_003C_0350_032C_000D_029A_036A_03B0_0308_0376_02A2),
.INIT_05(256'h0360_032C_029E_0388_02A2_0388_02A2_02B0_0308_02B0_0314_02C0_00B2_033C_0314_0394),
.INIT_06(256'h029A_02A8_011E_0350_02C6_032C_0020_029A_02B0_032C_000D_029A_02A8_0112_0360_00A8),
.INIT_07(256'h03A4_028E_036A_03A4_01C4_02B0_0020_029A_02B0_0382_02CE_0002_029A_02CE_02D2_FFFE),
.INIT_08(256'h02AC_0114_0360_0388_02A8_0314_02BA_009C_033C_0020_0360_032C_000D_029A_0388_0382),
.INIT_09(256'h02BA_00B2_0360_0382_02A8_02B0_0382_03A4_02CE_0003_029A_02CE_02D2_FFFE_029A_02A8),
.INIT_0A(256'h0172_0348_02CE_000A_029A_02A8_01AC_0348_02A8_02CE_0030_029A_0388_02A2_0000_029A),
.INIT_0B(256'h02A2_02B0_0308_02B0_02C6_02FA_02B0_01AC_0340_02CE_0010_029A_02A8_02CE_0007_029A),
.INIT_0C(256'h0020_029A_02B0_02BA_0148_0350_02C6_032C_000D_029A_02A2_032C_0020_029A_02A8_0388),
.INIT_0D(256'h15C4_B7A0_15C6_0020_033C_0202_01F4_04B6_029A_01BA_00FE_033C_036A_03A4_01C4_02B0),
.INIT_0E(256'h00B2_0977_0296_02AC_01C8_033C_0308_01D8_0350_032C_0388_029E_00CA_0977_1547_B6C0),
.INIT_0F(256'h0388_02B0_0308_02A8_009A_0977_0296_03B6_000D_029A_00A6_0977_0296_03B6_0020_029A),
.INIT_10(256'h0350_032C_02A2_02A2_03B6_0388_02A8_0308_0314_02B0_0314_02CA_02A2_008C_0977_0296),
.INIT_11(256'h0388_02CA_047A_029A_02D6_02D2_0FFF_029A_02A2_0004_029A_0068_0977_0296_02C0_0210),
.INIT_12(256'h02B0_02CA_02A2_0038_0977_0296_02C0_022E_0350_031A_02A8_02B0_02FA_02B0_0314_03B6),
.INIT_13(256'h01DC_0226_0382_02A8_01DC_01DC_01DC_0226_02A8_01E8_0278_0360_02D2_FFF0_029A_02A8),
.INIT_14(256'h1DA6_1547_1566_1547_1505_1547_15A4_1587_1164_0296_02C0_0260_0350_032C_029E_030E),
.INIT_15(256'h1547_0002_65C6_1547_0002_1036_13A6_1580_1547_158E_1547_13A6_1547_0002_1DA6_0002),
.INIT_16(256'h0B40_6000_0B40_6000_1380_1547_458E_1547_E58E_1547_658E_1547_558E_1547_0004_65C6),
.INIT_17(256'h6000_6000_1380_1547_100E_0C80_0C80_0C80_0C80_1380_1547_100E_0B40_6000_0B40_6000),
.INIT_18(256'h030B_0000_25CE_1547_0001_E5CE_1547_0002_65CE_1547_0001_65CE_1547_100E_6000_6000),
.INIT_19(256'h1547_1545_1547_FFFF_15CE_1547_0000_15CE_0303_258E_1547_FFFF_15CE_1547_0000_15CE),
.INIT_1A(256'h1547_0002_65C5_1547_1545_0202_0000_25D6_1547_1545_8007_1580_1547_1545_810B_1580),
.INIT_1B(256'h0004_65C6_0000_0002_9DBE_1547_0004_65C6_0000_0002_1DBE_1547_1545_03FA_0000_25D6),
.INIT_1C(256'hE180_B7A0_15C0_1547_047A_15E6_1547_100E_FF00_45C0_0000_9F80_1547_0000_1F8E_1547),
.INIT_1D(256'h00FE_0001_65F7_0104_1DC2_1547_04BC_15E6_1547_B7B0_15E6_1547_04BA_15E6_1547_1026),
.INIT_1E(256'h0020_15C0_00E2_10B7_0001_E5C2_0206_0008_25C0_031E_000D_25C0_1580_01C0_0000_95F2),
.INIT_1F(256'h1DC0_02FB_2040_0040_65C2_940A_0008_65C1_1001_0800_65C0_6000_6000_6000_0020_E5C0),
.INIT_20(256'h0040_1C10_B800_15C0_0008_15C3_0213_F600_25C2_003F_45C2_1547_01C0_00FF_95F0_00BC),
.INIT_21(256'h10B7_0200_65C2_0004_0077_02F1_0001_E5C3_02FB_F800_25C0_0000_95D0_02FB_F7C0_25C0),
.INIT_22(256'h0382_4340_0000_0388_2D00_02CE_2B00_02CA_2E68_6578_0000_0226_0000_FFB8_0077_007C),
.INIT_23(256'h3534_3332_3130_6475_6D70_0000_0256_676F_0000_028E_2100_036A_4321_0000_0376_4000),
.INIT_24(256'h3E46_3A04_0D36_3030_2E30_2045_524F_4320_3131_2F34_4611_4645_4443_4241_3938_3736),
.INIT_25(256'hB800_B7B0_B7B0_3F3F_2003_0D21_6675_2005_2120_646E_6966_0D07_2120_6470_6F74_0D07),
//      .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
      // INIT_A/INIT_B: Initial values on output port
      .INIT_A(36'h000000000),
      .INIT_B(36'h000000000),
      // INIT_FILE: Optional file used to specify initial RAM contents
      .INIT_FILE("NONE"),
      // RSTTYPE: "SYNC" or "ASYNC" 
      .RSTTYPE("SYNC"),
      // RST_PRIORITY_A/RST_PRIORITY_B: "CE" or "SR" 
      .RST_PRIORITY_A("CE"),
      .RST_PRIORITY_B("CE"),
      // SIM_COLLISION_CHECK: Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE" 
      .SIM_COLLISION_CHECK("ALL"),
      // SIM_DEVICE: Must be set to "SPARTAN6" for proper simulation behavior
      .SIM_DEVICE("SPARTAN6"),
      // SRVAL_A/SRVAL_B: Set/Reset value for RAM output
      .SRVAL_A(36'h000000000),
      .SRVAL_B(36'h000000000),
      // WRITE_MODE_A/WRITE_MODE_B: "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
      .WRITE_MODE_A("WRITE_FIRST"),
      .WRITE_MODE_B("WRITE_FIRST") 
   )
   RAMB16BWER_inst (
      // Port A Data: 32-bit (each) output: Port A data
      .DOA(q_a),       // 32-bit output: A port data output
      .DOPA(),         // 4-bit output: A port parity output
      // Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals
      .ADDRA({addr_a,4'd0}),  // 14-bit input: A port address input
      .CLKA(clk),      // 1-bit input: A port clock input
      .ENA(1'b1),      // 1-bit input: A port enable input
      .REGCEA(1'b0),   // 1-bit input: A port register clock enable input
      .RSTA(1'b0),     // 1-bit input: A port register set/reset input
      .WEA({2'b00,WEA}), // 4-bit input: Port A byte-wide write enable input
      // Port A Data: 32-bit (each) input: Port A data
      .DIA({16'hFFFF,data_a}),    // 32-bit input: A port data input
      .DIPA(4'hF),     // 4-bit input: A port parity input
		
      // Port B Data: 32-bit (each) output: Port B data
      .DOB(),          // 32-bit output: B port data output
      .DOPB(),         // 4-bit output: B port parity output
      // Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals
      .ADDRB(),        // 14-bit input: B port address input
      .CLKB(),         // 1-bit input: B port clock input
      .ENB(1'b0),      // 1-bit input: B port enable input
      .REGCEB(1'b0),   // 1-bit input: B port register clock enable input
      .RSTB(1'b0),     // 1-bit input: B port register set/reset input
      .WEB(4'd0),      // 4-bit input: Port B byte-wide write enable input
      // Port B Data: 32-bit (each) input: Port B data
      .DIB(),          // 32-bit input: B port data input
      .DIPB()          // 4-bit input: B port parity input
   );

   // End of RAMB16BWER_inst instantiation
endmodule                               

module RAM16_1(
        input [15:0] data_a, 
        input [9:0] addr_a, 
        input we_a, clk,
		  input [1:0] sel_a,
        output[15:0] q_a
);

wire [1:0] WEA = we_a? sel_a : 2'b00;

// RAMB16BWER  : In order to incorporate this function into the design,
//   Verilog   : the following instance declaration needs to be placed
//  instance   : in the body of the design code.  The instance name
// declaration : (RAMB16BWER_inst) and/or the port declarations within the
//    code     : parenthesis may be changed to properly reference and
//             : connect this function to the design.  All inputs
//             : and outputs must be connected.

//  <-----Cut code below this line---->

   // RAMB16BWER: 16k-bit Data and 2k-bit Parity Configurable Synchronous Dual Port Block RAM with Optional Output Registers
   //             Spartan-6
   // Xilinx HDL Language Template, version 14.2

   RAMB16BWER #(
      // DATA_WIDTH_A/DATA_WIDTH_B: 0, 1, 2, 4, 9, 18, or 36
      .DATA_WIDTH_A(18),
      .DATA_WIDTH_B(0),
      // DOA_REG/DOB_REG: Optional output register (0 or 1)
      .DOA_REG(0),
      .DOB_REG(0),
      // EN_RSTRAM_A/EN_RSTRAM_B: Enable/disable RST
      .EN_RSTRAM_A("TRUE"),
      .EN_RSTRAM_B("TRUE"),
      // INITP_00 to INITP_07: Initial memory contents.
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
      // INIT_00 to INIT_3F: Initial memory contents.

.INIT_00(256'h00_6C_6C_FE_6C_FE_6C_6C_00_00_00_00_00_6C_6C_6C_00_30_00_30_30_78_78_30_00_00_00_00_00_00_00_00),
.INIT_01(256'h00_00_00_00_00_C0_60_60_00_76_CC_DC_76_38_6C_38_00_C6_66_30_18_CC_C6_00_00_30_F8_0C_78_C0_7C_30),
.INIT_02(256'h00_00_30_30_FC_30_30_00_00_00_66_3C_FF_3C_66_00_00_60_30_18_18_18_30_60_00_18_30_60_60_60_30_18),
.INIT_03(256'h00_80_C0_60_30_18_0C_06_00_30_30_00_00_00_00_00_00_00_00_00_FC_00_00_00_60_30_30_00_00_00_00_00),
.INIT_04(256'h00_78_CC_0C_38_0C_CC_78_00_FC_CC_60_38_0C_CC_78_00_FC_30_30_30_30_70_30_00_7C_E6_F6_DE_CE_C6_7C),
.INIT_05(256'h00_30_30_30_18_0C_CC_FC_00_78_CC_CC_F8_C0_60_38_00_78_CC_0C_0C_F8_C0_FC_00_1E_0C_FE_CC_6C_3C_1C),
.INIT_06(256'h60_30_30_00_00_30_30_00_00_30_30_00_00_30_30_00_00_70_18_0C_7C_CC_CC_78_00_78_CC_CC_78_CC_CC_78),
.INIT_07(256'h00_30_00_30_18_0C_CC_78_00_60_30_18_0C_18_30_60_00_00_FC_00_00_FC_00_00_00_18_30_60_C0_60_30_18),
.INIT_08(256'h00_3C_66_C0_C0_C0_66_3C_00_FC_66_66_7C_66_66_FC_00_CC_CC_FC_CC_CC_78_30_00_78_C0_DE_DE_DE_C6_7C),
.INIT_09(256'h00_3E_66_CE_C0_C0_66_3C_00_F0_60_68_78_68_62_FE_00_FE_62_68_78_68_62_FE_00_F8_6C_66_66_66_6C_F8),
.INIT_0A(256'h00_E6_66_6C_78_6C_66_E6_00_78_CC_CC_0C_0C_0C_1E_00_78_30_30_30_30_30_78_00_CC_CC_CC_FC_CC_CC_CC),
.INIT_0B(256'h00_38_6C_C6_C6_C6_6C_38_00_C6_C6_CE_DE_F6_E6_C6_00_C6_C6_D6_FE_FE_EE_C6_00_FE_66_62_60_60_60_F0),
.INIT_0C(256'h00_78_CC_1C_70_E0_CC_78_00_E6_66_6C_7C_66_66_FC_00_1C_78_DC_CC_CC_CC_78_00_F0_60_60_7C_66_66_FC),
.INIT_0D(256'h00_C6_EE_FE_D6_C6_C6_C6_00_30_78_CC_CC_CC_CC_CC_00_FC_CC_CC_CC_CC_CC_CC_00_78_30_30_30_30_B4_FC),
.INIT_0E(256'h00_78_60_60_60_60_60_78_00_FE_66_32_18_8C_C6_FE_00_78_30_30_78_CC_CC_CC_00_C6_6C_38_38_6C_C6_C6),
.INIT_0F(256'hFF_00_00_00_00_00_00_00_00_00_00_00_C6_6C_38_10_00_78_18_18_18_18_18_78_00_02_06_0C_18_30_60_C0),
.INIT_10(256'h00_78_CC_C0_CC_78_00_00_00_DC_66_66_7C_60_60_E0_00_76_CC_7C_0C_78_00_00_00_00_00_00_00_18_30_30),
.INIT_11(256'hF8_0C_7C_CC_CC_76_00_00_00_F0_60_60_F0_60_6C_38_00_78_C0_FC_CC_78_00_00_00_76_CC_CC_7C_0C_0C_1C),
.INIT_12(256'h00_E6_6C_78_6C_66_60_E0_78_CC_CC_0C_0C_0C_00_0C_00_78_30_30_30_70_00_30_00_E6_66_66_76_6C_60_E0),
.INIT_13(256'h00_78_CC_CC_CC_78_00_00_00_CC_CC_CC_CC_F8_00_00_00_C6_D6_FE_FE_CC_00_00_00_78_30_30_30_30_30_70),
.INIT_14(256'h00_F8_0C_78_C0_7C_00_00_00_F0_60_66_76_DC_00_00_1E_0C_7C_CC_CC_76_00_00_F0_60_7C_66_66_DC_00_00),
.INIT_15(256'h00_6C_FE_FE_D6_C6_00_00_00_30_78_CC_CC_CC_00_00_00_76_CC_CC_CC_CC_00_00_00_18_34_30_30_7C_30_10),
.INIT_16(256'h00_1C_30_30_E0_30_30_1C_00_FC_64_30_98_FC_00_00_F8_0C_7C_CC_CC_CC_00_00_00_C6_6C_38_6C_C6_00_00),
.INIT_17(256'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_DC_76_00_E0_30_30_1C_30_30_E0_00_18_18_18_00_18_18_18),
.INIT_18(256'h00_60_60_60_7E_10_00_00_30_30_60_00_00_00_00_00_00_60_60_60_60_60_7E_10_00_36_33_36_3C_30_FC_FC),
.INIT_19(256'h00_18_FE_18_18_FE_18_00_00_18_18_18_18_FE_18_00_00_DB_DB_00_00_00_00_00_66_66_CC_00_00_00_00_00),
.INIT_1A(256'h00_30_60_C0_C0_60_30_00_00_DE_DB_DB_DE_D8_78_38_00_CA_6A_30_18_8C_86_00_00_3C_62_F8_C0_F8_62_3C),
.INIT_1B(256'h00_38_38_FE_C6_C6_C6_C6_00_36_36_36_3C_30_FC_FC_00_C6_CC_F8_F8_CC_D6_18_00_DE_D9_D9_FE_D8_D8_D8),
.INIT_1C(256'h00_00_00_00_00_66_CC_CC_00_00_00_00_00_60_60_C0_00_00_00_00_00_60_C0_C0_0C_66_66_7E_7C_60_F8_60),
.INIT_1D(256'h00_00_FF_FF_00_00_00_00_00_00_FE_FE_00_00_00_00_00_00_18_3C_3C_18_00_00_00_00_00_00_00_66_66_CC),
.INIT_1E(256'h00_C0_60_30_30_60_C0_00_00_DE_D9_DE_78_38_00_00_00_00_00_00_51_55_5B_F1_00_00_00_00_00_00_00_00),
.INIT_1F(256'h00_38_38_FE_C6_C6_00_00_00_36_36_3C_30_FC_00_00_00_CC_D8_F0_D8_CC_10_18_00_DE_D9_FE_D8_D8_00_00),
.INIT_20(256'h00_78_CC_CC_0C_0C_0C_1E_F8_0C_7C_CC_CC_CC_10_00_00_3E_63_03_3F_63_63_6B_00_00_00_00_00_00_00_00),
.INIT_21(256'h00_30_08_30_48_30_40_30_00_18_18_00_00_18_18_00_00_60_60_60_60_7E_7E_06_00_5A_3C_66_66_3C_5A_00),
.INIT_22(256'h00_33_66_CC_CC_66_33_00_00_3C_62_C0_F8_C0_62_3C_00_7C_82_9A_A2_9A_82_7C_00_7E_60_7C_60_7E_00_66),
.INIT_23(256'h00_18_18_18_18_18_00_66_00_7C_82_AA_B2_AA_92_7C_00_00_F8_F8_00_00_00_00_00_02_FE_FE_00_00_00_00),
.INIT_24(256'h00_18_18_18_18_18_00_18_00_3C_18_18_18_18_18_3C_00_7E_00_18_7E_18_00_00_00_00_00_10_28_28_10_00),
.INIT_25(256'h00_00_00_18_18_00_00_00_00_28_28_28_68_E8_E8_7C_C0_C0_C6_CC_FC_CC_84_00_00_60_60_60_7E_06_00_00),
.INIT_26(256'h00_CC_66_33_33_66_CC_00_00_3E_60_7C_60_3E_00_00_00_8B_88_9B_B8_EA_CD_8A_00_78_C0_FC_CC_78_00_6C),
.INIT_27(256'h00_18_18_18_18_00_66_00_00_F8_0C_78_C0_7C_00_00_00_78_CC_1C_70_E0_CC_78_78_CC_CC_0C_0C_0C_00_0C),
.INIT_28(256'h00_60_60_60_60_60_60_7E_00_7C_66_66_7C_66_66_7C_00_7C_66_66_7C_60_60_7C_00_66_66_7E_66_66_36_1E),
.INIT_29(256'h00_3C_66_06_1C_06_66_3C_00_DB_DB_7E_3C_7E_DB_DB_00_7E_60_60_7C_60_60_7E_C6_FE_6C_6C_6C_6C_6C_38),
.INIT_2A(256'h00_66_66_66_66_66_36_1E_00_66_6C_78_70_78_6C_66_00_66_66_76_7E_6E_66_3C_00_66_66_76_7E_6E_66_66),
.INIT_2B(256'h00_66_66_66_66_66_66_7E_00_3C_66_66_66_66_66_3C_00_66_66_66_7E_66_66_66_00_C6_C6_D6_FE_FE_EE_C6),
.INIT_2C(256'h00_3C_66_06_3E_66_66_66_00_18_18_18_18_18_18_7E_00_3C_66_60_60_60_66_3C_00_60_60_7C_66_66_66_7C),
.INIT_2D(256'h00_06_06_06_3E_66_66_66_03_7F_66_66_66_66_66_66_00_66_66_3C_18_3C_66_66_00_18_18_7E_DB_DB_DB_7E),
.INIT_2E(256'h00_F6_DE_DE_F6_C6_C6_C6_00_7C_66_66_7C_60_60_E0_03_FF_DB_DB_DB_DB_DB_DB_00_FF_DB_DB_DB_DB_DB_DB),
.INIT_2F(256'h00_66_36_3E_66_66_66_3E_00_CE_DB_DB_FB_DB_DB_CE_00_78_8C_06_3E_06_8C_78_00_7C_66_66_7C_60_60_60),
.INIT_30(256'h00_60_60_60_60_7E_00_00_00_7C_66_7C_66_7C_00_00_00_3C_66_66_3C_60_3C_00_00_76_CC_7C_0C_78_00_00),
.INIT_31(256'h00_3C_66_0C_66_3C_00_00_00_DB_7E_3C_7E_DB_00_00_00_3C_60_7E_66_3C_00_00_C6_FE_6C_6C_6C_3C_00_00),
.INIT_32(256'h00_66_66_66_36_1E_00_00_00_66_6C_78_6C_66_00_00_00_66_76_7E_6E_66_18_00_00_66_76_7E_6E_66_00_00),
.INIT_33(256'h00_66_66_66_66_7E_00_00_00_3C_66_66_66_3C_00_00_00_66_66_7E_66_66_00_00_00_C6_D6_FE_FE_C6_00_00),
.INIT_34(256'h00_3C_06_3E_66_66_00_00_00_18_18_18_18_7E_00_00_00_3C_66_60_66_3C_00_00_00_60_7C_66_66_7C_00_00),
.INIT_35(256'h00_06_06_3E_66_66_00_00_03_7F_66_66_66_66_00_00_00_66_3C_18_3C_66_00_00_00_18_7E_DB_DB_7E_00_00),
.INIT_36(256'h00_F6_DE_F6_C6_C6_00_00_00_7C_66_7C_60_E0_00_00_03_FF_DB_DB_DB_DB_00_00_00_FF_DB_DB_DB_DB_00_00),
.INIT_37(256'h00_66_36_3E_66_3E_00_00_00_CE_DB_FB_DB_CE_00_00_00_7C_06_3E_06_7C_00_00_00_7C_66_7C_60_60_00_00),
      .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
      // INIT_A/INIT_B: Initial values on output port
      .INIT_A(36'h000000000),
      .INIT_B(36'h000000000),
      // INIT_FILE: Optional file used to specify initial RAM contents
      .INIT_FILE("NONE"),
      // RSTTYPE: "SYNC" or "ASYNC" 
      .RSTTYPE("SYNC"),
      // RST_PRIORITY_A/RST_PRIORITY_B: "CE" or "SR" 
      .RST_PRIORITY_A("CE"),
      .RST_PRIORITY_B("CE"),
      // SIM_COLLISION_CHECK: Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE" 
      .SIM_COLLISION_CHECK("ALL"),
      // SIM_DEVICE: Must be set to "SPARTAN6" for proper simulation behavior
      .SIM_DEVICE("SPARTAN6"),
      // SRVAL_A/SRVAL_B: Set/Reset value for RAM output
      .SRVAL_A(36'h000000000),
      .SRVAL_B(36'h000000000),
      // WRITE_MODE_A/WRITE_MODE_B: "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
      .WRITE_MODE_A("WRITE_FIRST"),
      .WRITE_MODE_B("WRITE_FIRST") 
   )
   RAMB16BWER_inst (
      // Port A Data: 32-bit (each) output: Port A data
      .DOA(q_a),       // 32-bit output: A port data output
      .DOPA(),         // 4-bit output: A port parity output
      // Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals
      .ADDRA({addr_a,4'd0}),  // 14-bit input: A port address input
      .CLKA(clk),      // 1-bit input: A port clock input
      .ENA(1'b1),      // 1-bit input: A port enable input
      .REGCEA(1'b0),   // 1-bit input: A port register clock enable input
      .RSTA(1'b0),     // 1-bit input: A port register set/reset input
      .WEA({2'b00,WEA}), // 4-bit input: Port A byte-wide write enable input
      // Port A Data: 32-bit (each) input: Port A data
      .DIA({16'hFFFF,data_a}),    // 32-bit input: A port data input
      .DIPA(4'hF),     // 4-bit input: A port parity input

      // Port B Data: 32-bit (each) output: Port B data
      .DOB(),          // 32-bit output: B port data output
      .DOPB(),         // 4-bit output: B port parity output
      // Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals
      .ADDRB(),        // 14-bit input: B port address input
      .CLKB(),         // 1-bit input: B port clock input
      .ENB(1'b0),      // 1-bit input: B port enable input
      .REGCEB(1'b0),   // 1-bit input: B port register clock enable input
      .RSTB(1'b0),     // 1-bit input: B port register set/reset input
      .WEB(4'd0),      // 4-bit input: Port B byte-wide write enable input
      // Port B Data: 32-bit (each) input: Port B data
      .DIB(),          // 32-bit input: B port data input
      .DIPB()          // 4-bit input: B port parity input
   );

   // End of RAMB16BWER_inst instantiation
endmodule                               