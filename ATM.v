`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 18:45:59
// Design Name: 
// Module Name: ATM
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


module ATM(amount,led0,sw);

  input [5:0] sw;
  output led0;
  output [7:0] amount;
  
  reg [7:0] dep_amount;
  
  always @(sw) begin   
    case (sw)
      0: dep_amount = 8'b0000_0000; // 0Rs
      1: dep_amount = 8'b0000_0001; // 1 Rs
      2: dep_amount = 8'b0000_0101; // 5 Rs
      4: dep_amount = 8'b0000_1010; // 10 RS
      8: dep_amount = 8'b0001_0100; // 20 Rs
      16: dep_amount = 8'b0011_0010; // 50 RS
      32: dep_amount = 8'b0110_0100; // 100 Rs
      default: dep_amount = 8'b0000_0000; // 0 Rs 
    endcase  
  end
  
  assign amount = dep_amount;
  
  reg active;
  
  always @(sw) begin   
    case (sw)
      0: active = 1'b0;
      1: active = 1'b0;
      2: active = 1'b0;
      4: active = 1'b0;
      8: active = 1'b0;
      16: active = 1'b0;
      32: active = 1'b0;
      default: active = 1'b1;    
    endcase  
  end
  
  assign led0 = active;
  
endmodule
