`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:18 05/19/2021 
// Design Name: 
// Module Name:    vedic_4x4 
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

module vedic_4x4(
input [3:0]a,
input [3:0]b,
output [7:0]c);


wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;	
wire [7:0]c;
wire [3:0]temp1;
wire [5:0]temp2;
wire [5:0]temp3;
wire [5:0]temp4;
wire [3:0]q4;
wire [5:0]q5;
wire [5:0]q6;
wire c01,c02,c03;
// using 4 2x2 multipliers
vedic_2x2 z1(a[1:0],b[1:0],q0[3:0]);
vedic_2x2 z2(a[3:2],b[1:0],q1[3:0]);
vedic_2x2 z3(a[1:0],b[3:2],q2[3:0]);
vedic_2x2 z4(a[3:2],b[3:2],q3[3:0]);
// stage 1 adders 
assign temp1 ={2'b0,q0[3:2]};
KSA4 z5(q4, c01, q1[3:0], temp1);
assign temp2 ={4'b0,q2[3:0]};
assign temp3 ={2'b0,q3[3:0],2'b0};
KSA6 z6(q5, c02, temp2, temp3);

// stage 2 adder 
KSA6 z7(q6, c03, {4'b0, q4}, {2'b0, q5});
// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];



endmodule


