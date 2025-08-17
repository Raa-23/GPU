`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 10:09:12
// Design Name: 
// Module Name: LSU_tb
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


module LSU_tb(
    );
    
        reg clk;
        reg reset;
        reg enable;
        
        reg [2:0] core_state; //external core state
        reg decoded_mem_read_enable; //will be coming from decoder
        reg decoded_mem_write_enable; //will be coming from decoder
        
        reg [7:0] rs; //specifies the address
        reg [7:0] rt; // specifies the data
        
    //    for reading from memeory
        wire mem_read_valid;
        wire [7:0] mem_read_addr;
        reg mem_read_ready;  
        reg [7:0] mem_read_data; 
        
    //    for writing to memory
        wire mem_write_valid;
        wire [7:0] mem_write_addr; 
        wire [7:0] mem_write_data;
        reg mem_write_ready; 
        
        wire [7:0] lsu_out;
        wire [1:0] lsu_state;
        
        LSU instr1(clk,reset,enable,core_state,
        decoded_mem_read_enable,decoded_mem_write_enable,rs,rt,
        mem_read_valid,mem_read_addr,mem_read_ready,mem_read_data
        ,mem_write_valid,mem_write_addr,mem_write_data,mem_write_ready,
        lsu_out,lsu_state);   
        
        
endmodule
