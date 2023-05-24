`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:23:54 05/20/2021 
// Design Name: 
// Module Name:    acc 
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
module acc(
input [31:0] in,
output [34:0] out,
input clk, clr
    );
	 reg [34:0] temp;
initial
temp=31'b0;
always@(posedge clk)
begin
if(clr)
temp<=34'b0;
else
temp<=in;
end
assign out=temp;


endmodule
