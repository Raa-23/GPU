`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 06:47:36
// Design Name: 
// Module Name: ALU
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


module ALU(
    input clk,
    input reset,
    input enable,
    input [2:0] core_state,
    input [1:0] opcode,
    input output_mux,
    input [7:0] rs,
    input [7:0] rt,
    output reg [7:0] alu_out
    );
    //Division does not work here
    //can add a overflow flag as well 
    reg N,Z,P;
    reg [15:0] product;
    reg [7:0]sum; 
    
    always @(*) begin
    sum = rs - rt;
    P = sum[7]? 1'b0:1'b1;
    Z = (sum == 0 )? 1'b1: 1'b0;
    N = sum[7]? 1'b1: 1'b0; 
    end
    
    always @(posedge clk) begin
    if(reset) alu_out <= 8'b0;
    else if(enable && core_state == 3'b101) begin
         if(output_mux) alu_out <= {5'b0,N,Z,P};
         else begin
            case(opcode)
                2'b00:alu_out <= rs+rt;
                2'b01: alu_out <= rs-rt;
                2'b10: alu_out <= rs * rt;
                2'b11: alu_out <= (rt != 0)? rs/rt : 8'b0;
            endcase
         end 
    end
    end
endmodule
