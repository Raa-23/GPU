`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 07:12:28
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb( );
    reg clk,reset,enable,output_mux;
    reg [2:0] core_state;
    reg [1:0] opcode;
    reg [7:0] rs,rt;
    wire [7:0] alu_output;
    
    ALU instr1(clk,reset,enable,core_state,opcode,output_mux,rs,rt,alu_output);
    
    initial begin
    clk = 0;
    reset = 0;
    enable = 1;
    core_state = 3'b101;
    opcode = 2'b01;
    
    forever #5 clk = ~clk;
    end
    
    initial begin 
    
    rs = 8'd24;
    rt = 8'd8;
    
    #10 output_mux = 0; 
    #10 output_mux = 1;
    
    #10 rs = 8'd45;
    rt = 8'd9; 
    
    #10 output_mux = 0;
   
    reset =1 ; 
    #10 reset= 0;
    
    #10 opcode = 2'b10;
    //#10 opcde = 2'b11;
    
    #10 $finish;     
    end
    
endmodule
