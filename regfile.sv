`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 22:05:56
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input reset,
    input reg_write_enable,
    
    input [3:0] rs_addr, 
    input [3:0] rt_addr,
    input [3:0] rd_addr, //addresses
    input [7:0] data_write, // muxed : ALU, LSU or Immediate
  
    input [2:0] core_state,
    
    output [7:0] rs,
    output [7:0] rt
    );
    
    reg [7:0] rs_reg,rt_reg;
    reg [7:0] regfile [15:0];
    
    assign rs = rs_reg;
    assign rt = rt_reg;
    
    always @(posedge clk, posedge reset) begin
        if(reset) begin rs_reg<=8'b0; rt_reg <= 8'b0; end
        else if(core_state == 3'b011) begin
        rs_reg <= regfile[rs_addr];
        rt_reg <=regfile[rt_addr];
        end
        else if(reg_write_enable)
            regfile[rd_addr] <= data_write;
    end
    
    
    
endmodule
