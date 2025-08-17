`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 02:17:35
// Design Name: 
// Module Name: pc_tb
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

// test complete working module

module pc_tb(
    );
    reg clk;
    reg reset;
    reg [2:0] core_state;
    reg nzp_write_en;
    
    reg [2:0] alu_nzp;
    reg [2:0] inst_nzp;
    reg [7:0] current_pc;
    reg [7:0] immediate;
    
    wire [7:0] updated_pc;
    
    pc instance1(clk, reset, core_state, nzp_write_en, 
    alu_nzp, inst_nzp, current_pc, immediate, updated_pc);
    
    initial begin
    clk = 0;
    reset = 1;
    core_state = 3'b110;
    nzp_write_en = 1;
    forever #5 clk = ~clk;
    end
    
    initial begin 
    
    #10 reset = 0;
        inst_nzp = 3'b000;
        current_pc = 8'd20;
        core_state = 3'b101;
        immediate = 8'd12;
        
        
    #10 alu_nzp = 3'b100;
        core_state = 3'b110;
        
    #10 inst_nzp = 3'b111;
        core_state = 3'b101;
        
    #10 $finish;
    end
endmodule
