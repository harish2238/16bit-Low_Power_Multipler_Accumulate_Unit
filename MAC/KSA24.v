`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:30:51 05/20/2021 
// Design Name: 
// Module Name:    KSA24 
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
module KSA24(output [23:0] sum, output cout, input [23:0] a, b);
  
  wire cin = 1'b0;
  wire [23:0] c;
  wire [23:0] g, p;
  Square sq[23:0](g, p, a, b);

  // first line of circles
  wire [23:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[23:1](g2[23:1], p2[23:1], g[23:1], p[23:1], g[22:0], p[22:0]);

  // second line of circles
  wire [23:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[23:3](g3[23:3], p3[23:3], g2[23:3], p2[23:3], g2[21:1], p2[21:1]);

  // third line of circles
  wire [23:7] g4, p4;
  SmallCircle sc2[6:3](c[6:3], g3[6:3]);
  BigCircle bc2[23:7](g4[23:7], p4[23:7], g3[23:7], p3[23:7], g3[19:3], p3[19:3]);

  // fourth line of circles
  wire [23:15] g5, p5;
  SmallCircle sc3[14:7](c[14:7], g4[14:7]);
  BigCircle bc3[23:15](g5[23:15], p5[23:15], g4[23:15], p4[23:15], g4[15:7], p4[15:7]);
        
  // fifth line of circles
  SmallCircle sc4[23:15](c[23:15], g5[23:15]);

  
  
  // last line - triangless
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[23:1](sum[23:1], p[23:1], c[22:0]);

  // generate cout
  buf #(1) (cout, c[23]);

endmodule
