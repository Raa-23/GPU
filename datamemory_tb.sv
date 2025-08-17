`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 19:25:30
// Design Name: 
// Module Name: datamemory_tb
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


module datamemory_tb(
    );
    //    for reading from memeory
        reg mem_read_valid;
        reg [7:0] mem_read_addr;
        wire mem_read_ready;
        wire [7:0] mem_read_data; 
        
    //    for writing to memory
        reg mem_write_valid;
        reg [7:0] mem_write_addr; 
        reg [7:0] mem_write_data;
        wire mem_write_ready; 
        
        data_memory instr1(mem_read_valid,mem_read_addr,mem_read_ready,mem_read_data, mem_write_valid, mem_write_addr, mem_write_data, mem_write_ready);
        
        initial begin 
        mem_read_valid = 0;
        mem_write_valid = 0;
        
        #5 mem_read_valid = 1;
        mem_read_addr = 8'd42;
        
        #5 mem_read_valid = 0;
        mem_write_valid = 1;
        mem_write_addr = 8'd42;
        mem_write_data = 8'd50;
        
        #5 mem_write_addr = 8'd32;
        mem_write_data = 8'd63;
        mem_read_valid = 1;
        mem_read_addr = 8'd42;
        
        #5 mem_write_valid = 0;
        mem_read_valid = 0;
        
        #5 mem_read_valid = 1;
        mem_read_addr = 8'd32;   
        
        #5 $finish;
        end
        
endmodule
