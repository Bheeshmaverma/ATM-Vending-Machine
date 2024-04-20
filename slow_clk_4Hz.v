`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2024 22:16:20
// Design Name: 
// Module Name: slow_clk_4Hz
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


module slow_clk_4Hz(clk_out,clk_in);

  input clk_in;
  output reg clk_out;
  
  reg [25:0] period_count = 0;
  
  always @(posedge clk_in) begin
    if (period_count != (12_500_000 - 1)) begin
      period_count <= period_count + 1;
      clk_out <= 0;
    end
    else begin
      period_count <= 0;
      clk_out <= 1;
    end
  end
endmodule
