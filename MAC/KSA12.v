`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:21 05/19/2021 
// Design Name: 
// Module Name:    KSA12 
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
module KSA12(output [11:0] sum,
 output cout, 
 input [11:0] a, b);
  
  wire cin = 1'b0;
  wire [11:0] c;
  wire [11:0] g, p;
  Square sq[11:0](g, p, a, b);

  // first line of circles
  wire [11:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[11:1](g2[11:1], p2[11:1], g[11:1], p[11:1], g[10:0], p[10:0]);
  
  // second line of circle
  wire [11:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[11:3](g3[11:3], p3[11:3], g2[11:3], p2[11:3], g2[9:1], p2[9:1]);
  
  // third line of circle
  wire [11:7] g4, p4;
  SmallCircle sc2[6:3](c[6:3], g3[6:3]);
  BigCircle bc2[11:7](g4[11:7], p4[11:7], g3[11:7], p3[11:7], g3[7:3], p3[7:3]);

  // fourth line of circle
  SmallCircle sc3[11:7](c[11:7], g4[11:7]);

  
  // last line - triangles
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[11:1](sum[11:1], p[11:1], c[10:0]);

  // generate cout
  buf #(1) (cout, c[11]);

endmodule

