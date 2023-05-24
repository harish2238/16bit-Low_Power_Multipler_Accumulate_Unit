`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:33:03 05/20/2021 
// Design Name: 
// Module Name:    vedic_16x16 
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
module vedic_16x16(a,b,c);
input [15:0]a;
input [15:0]b;
output [31:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [31:0]c;
wire [15:0]temp1;
wire [23:0]temp2;
wire [23:0]temp3;
wire [23:0]temp4;
wire [15:0]q4;
wire [23:0]q5;
wire [23:0]q6;
wire c01,c02,c03;
// using 4 8x8 multipliers
vedic_8x8 z1(a[7:0],b[7:0],q0[15:0]);
vedic_8x8 z2(a[15:8],b[7:0],q1[15:0]);
vedic_8x8 z3(a[7:0],b[15:8],q2[15:0]);
vedic_8x8 z4(a[15:8],b[15:8],q3[15:0]);

// stage 1 adders 
assign temp1 ={8'b0,q0[15:8]};
KSA16 z5(q4,c01,q1[15:0],temp1);
assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
KSA24 z6(q5,c02,temp2,temp3);
assign temp4={8'b0,q4[15:0]};

//stage 2 adder
KSA24 z7(q6,c03,temp4,q5);
// fnal output assignment 
assign c[7:0]=q0[7:0];
assign c[31:8]=q6[23:0];



endmodule
