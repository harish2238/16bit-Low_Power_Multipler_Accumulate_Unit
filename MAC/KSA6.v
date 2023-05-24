`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:55 05/19/2021 
// Design Name: 
// Module Name:    KSA6 
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
module KSA6(
    output wire [5:0] sum, 
	 output cout, 
	 input [5:0] a, b
	 );
  
  wire cin = 1'b0;
  wire [5:0] c;
  wire [5:0] g, p;
  Square sq[5:0](g, p, a, b);

  // first line of circles
  wire [5:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[5:1](g2[5:1], p2[5:1], g[5:1], p[5:1], g[4:0], p[4:0]);
  
  // second line of circle
  wire [5:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[5:3](g3[5:3], p3[5:3], g2[5:3], p2[5:3], g2[3:1], p2[3:1]);
    
  // third line of circle

  SmallCircle sc2[5:3](c[5:3], g3[5:3]);



  // last line - triangles
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[5:1](sum[5:1], p[5:1], c[4:0]);
  
  // generate cout
  buf #(1) (cout, c[5]);
  
endmodule 