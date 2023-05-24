`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:34 05/19/2021 
// Design Name: 
// Module Name:    KSA4 
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
module KSA4(
    output wire [3:0] sum, 
	 output cout, 
	 input [3:0] a, b
	 );
  
  wire cin = 1'b0;
  wire [3:0] c;
  wire [3:0] g, p;
  Square sq[3:0](g, p, a, b);

  // first line of circles
  wire [3:1] g2, p2;
  SmallCircle sc0_0(c[0], g[0]);
  BigCircle bc0[3:1](g2[3:1], p2[3:1], g[3:1], p[3:1], g[2:0], p[2:0]);
  
  // second line of circle
  wire [3:3] g3, p3;
  SmallCircle sc1[2:1](c[2:1], g2[2:1]);
  BigCircle bc1[3:3](g3[3:3], p3[3:3], g2[3:3], p2[3:3], g2[1:1], p2[1:1]);
    
  // third line of circle
  SmallCircle sc2(c[3], g3[3]);


  // last line - triangles
  Triangle tr0(sum[0], p[0], cin);
  Triangle tr[3:1](sum[3:1], p[3:1], c[2:0]);
  
  // generate cout
  buf #(1) (cout, c[3]);
  
endmodule 

