`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 22:38:46
// Design Name: 
// Module Name: user_clock
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


module user_clock(s_clk,clk);

  input clk;
  output s_clk;
  
  reg clk_out = 0;
  reg [25:0] count = 0;
  
  always @(posedge clk) begin
    count <= count + 1;
    if (count == 5_00_000) begin
      count <= 0;
      clk_out = ~clk_out;
    end
  end
  assign s_clk = clk_out;
endmodule
