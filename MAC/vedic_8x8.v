`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:25 05/19/2021 
// Design Name: 
// Module Name:    vedic_8x8 
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
module vedic_8x8(a,b,c);
   
input [7:0]a;
input [7:0]b;
output [15:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [15:0]c;
wire [7:0]temp1;
wire [11:0]temp2;
wire [11:0]temp3;
wire [11:0]temp4;
wire [7:0]q4;
wire [11:0]q5;
wire [11:0]q6;
wire c01,c02,c03;
// using 4 4x4 multipliers
vedic_4x4 z1(a[3:0],b[3:0],q0[15:0]);
vedic_4x4 z2(a[7:4],b[3:0],q1[15:0]);
vedic_4x4 z3(a[3:0],b[7:4],q2[15:0]);
vedic_4x4 z4(a[7:4],b[7:4],q3[15:0]);

// stage 1 adders 
assign temp1 ={4'b0,q0[7:4]};
KSA8 z5(q4,c01,q1[7:0],temp1);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
KSA12 z6(q5,c02,temp2,temp3);
assign temp4={4'b0,q4[7:0]};
// stage 2 adder
KSA12 z7(q6,c03,temp4,q5);
// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];



endmodule