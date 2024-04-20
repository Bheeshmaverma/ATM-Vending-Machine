`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 20:22:11
// Design Name: 
// Module Name: withdraw
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


module withdraw(dec,up_button,rst,clk);

  input rst,clk;
  input up_button;
  output dec;
  
  parameter S00 = 0, FLAG = 1;
  reg [1:0] current_state = 0;
  reg [1:0] next_state = 0;
  reg set_flag = 1;
  
  always @(posedge clk) begin
    if (rst) current_state <= S00;
    else current_state <= next_state;
  end
  
  // Next state combinational logic
  always @(current_state, up_button) begin
  
    case (up_button)
      S00: begin
        if (up_button)
          next_state <= FLAG;
        else 
          next_state <= S00;
      end     
      FLAG: next_state <= S00;
      default: next_state <= S00;
    endcase
  end
  
  // Combinational output logic for each state 
  always @(current_state) begin
  
    case (current_state) 
      S00: set_flag = 0;
      FLAG: set_flag = 1;
      default: set_flag = 0;
    endcase
  end 
  assign dec = set_flag;
  
endmodule
