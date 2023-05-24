`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:00 05/20/2021 
// Design Name: 
// Module Name:    macunit16bit 
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
module macunit16bit(
input [15:0] a, b,
input clk, clr, en,
output [34:0] cout
    );
	 reg [34:0] temp;
	 wire [31:0] w;
	 wire [34:0] temp0;
	
	
vedic_16x16 n1(b, a, w);
assign temp0={3'b0, w};
initial
temp=34'b0;
always@(posedge clk)
begin
if(clr==1)
temp<=34'b0;
else
if(en==1)
temp<=temp0;
end
assign cout=temp;

endmodule
