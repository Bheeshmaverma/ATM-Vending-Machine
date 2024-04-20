`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2024 00:07:53
// Design Name: 
// Module Name: debounce
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


module debounce(pulse_out,push_b,clk);

  input clk;
  input push_b;
  output pulse_out;
  wire q1,q1b,q2,q2b;
  
  wire s_clk_4Hz;
  
  slow_clk_4Hz U0(s_clk_4Hz,clk);
  d_ff D0(q1,push_b,s_clk_4Hz);
  d_ff D1(q2,q1,s_clk_4Hz);
  
  assign q2b = ~q2;
  assign pulse_out = q1 & q2b;
endmodule
