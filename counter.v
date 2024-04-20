`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 19:32:36
// Design Name: 
// Module Name: counter
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


module counter(count,led2,led1,amount,inc,dec,rst,clk);

  input rst,clk;
  input inc; // count increment signal
  input dec; // count decrement signal
  input [7:0] amount; // amount for deposite or withdraw
  output led2,led1; // led[0] = signal for insufficient balance, led[1] = signal for reach max balance in the account
  output [7:0] count; // amount after deposite or withdraw
  
  reg [7:0] current_count = 0;
  
  always @(posedge clk) begin
    if (rst) 
      current_count <= 0;
    else if (inc & (count + amount) > count)
      current_count <= count + amount; // increment count by value amount
    else if (dec & (amount <= count))
      current_count <= count - amount; // decrement count by value of amount
    else 
      current_count <= count; // hold the count value
  end
  
  reg set0;
  
  // determine LED1, exceeds maximum account value i.e. 255
  always @(posedge clk) begin
    if (rst) 
      set0 <= 0;
    else if (inc & (count + amount) > count)
      set0 <= 1'b0; 
    else if (dec & (amount <= count))
      set0 <= count - amount; 
    else if (inc & (count + amount) < count)
      set0 <= 1'b0;
    else 
      set0 <= led1; 
  end
  
  assign led1 = set0; // LED1
  reg set1;
  
  // determine LED2 when we don't have enough money to withdraw
  always @(posedge clk) begin
    if (rst) 
      set1 <= 0;
    else if (inc & (count + amount) > count)
      set1 <= 1'b0; 
    else if (dec & (amount <= count))
      set1 <= count - amount; 
    else if (dec & (amount > count))
      set1 <= 1'b0;
    else 
      set1 <= led2;
  end
  
  assign led2 = set1; // LED2
  
endmodule
