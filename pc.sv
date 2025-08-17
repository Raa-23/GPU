`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 22:55:50
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input reset,
    input [2:0] core_state,
    input nzp_write_en,
    
    input [2:0] alu_nzp,
    input [2:0] inst_nzp,
    input [7:0] current_pc,
    input [7:0] immediate,
    
    output reg [7:0] updated_pc
    );
    reg [2:0] nzp_reg;

    always @(posedge clk or posedge reset) 
    begin
        if(reset) begin nzp_reg <= 3'd0 ; updated_pc <= 8'd0; end
        else if((core_state == 3'b110) & nzp_write_en)
                   nzp_reg <= alu_nzp;  
        else if(core_state == 3'b101) begin
                updated_pc <= (inst_nzp == nzp_reg)? immediate : current_pc + 1;
        end
    end
    
endmodule
