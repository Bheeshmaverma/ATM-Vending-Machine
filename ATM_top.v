`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 20:24:59
// Design Name: 
// Module Name: ATM_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ATM_top(seg,an,dp,led,sw,push_up,push_down,rst,clk);

  input rst,clk;
  input push_up,push_down;
  input [5:0] sw;
  output dp;
  output [2:0] led;
  output [6:0] seg;
  output [7:0] an;
  
  assign dp = 1'b1;
  parameter zeros = 4'b0000;
  wire s_clk;
  wire up_out,down_out;
  wire inc,dec;
  wire [1:0] sel;
  wire [7:0] amount,count;
  wire [3:0] mux_out,hunds,tens,ones;
  
  user_clock M0(s_clk,clk);
  debounce M1(up_out,push_up,clk);
  debounce M2(down_out,push_down,clk);
  deposite M3(inc,up_out,rst,clk);
  withdraw M4(dec,down_out,rst,clk);
  ATM M5(amount,led[0],sw);
  counter M6(count,led[2],led[1],amount,inc,dec,rst,clk);
  Binary_to_BCD_converter M7(hunds,tens,ones,count);
  counter_2bit M8(sel,s_clk);
  mux_4x1 M9(mux_out,zeros,hunds,tens,ones,sel);
  Decoder M10(an,sel);
  Binary_to_7seg M11(seg,mux_out);
  
endmodule
