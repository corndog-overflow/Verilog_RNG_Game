`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 10:36:33 PM
// Design Name: 
// Module Name: SevenLEDDemo
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


module SevenLEDDemo(clk,rst,AN_Out,C_Out);

input clk,rst;
output [7:0] AN_Out;
output [6:0] C_Out;

reg [7:0] AN_In; 
reg [55:0] C_In;

parameter ONE = 7'b0000110, N=7'b0110111,P=7'b1110011,E=7'b1111001; 

SevenSegmentLED SevenSegmentLED(.clk(clk),.rst(rst),.AN_In(AN_In),.C_In(C_In),.AN_Out(AN_Out),.C_Out(C_Out));

always @ (posedge clk or posedge rst)
begin
    if(rst)
    begin
        AN_In <= 8'h0;
        C_In <= 56'h0;
    end
    else
    begin
        AN_In <= 8'b11100011;
        C_In <= {ONE,N,P, 7'd0, 7'd0, 7'd0, P, ONE};
    end
end

endmodule
