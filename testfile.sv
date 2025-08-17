`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 01:19:43
// Design Name: 
// Module Name: testfile
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


module testfile(
    input [2:0] d,
    input clk,
    output [2:0] q
    );
    reg [2:0] temp;
    always @(posedge clk)
    temp <= d;
    assign q = temp;
endmodule
