`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2025 20:24:08
// Design Name: 
// Module Name: data_memory
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

module data_memory(
    input mem_read_valid,
    input [7:0] mem_read_addr,
    output reg mem_read_ready,  
    output reg [7:0] mem_read_data, 
    
//    for writing to memory
    input mem_write_valid,
    input [7:0] mem_write_addr, 
    input [7:0] mem_write_data,
    output reg mem_write_ready
    );
    
    reg [7:0] data_mem [255:0];
    reg state;
    
    parameter IDLE =1'b0, FETCHING =1'b1;
    
    initial begin
        state = IDLE;
        for(int i = 0; i < 255 ; i++) 
        data_mem[i] = 8'd0;
    end
    
//  Since posedge of any valid signal triggers the always block it allows for simultanous read and write operations
//  This could turn out to be problem or act as a feature of the memory
    always @(posedge mem_read_valid, posedge mem_write_valid) begin
        if(mem_read_valid & (mem_read_addr < 256)) begin
            mem_read_data = data_mem[mem_read_addr];
            mem_read_ready = 1'b1; 
            end
        if(mem_write_valid & (mem_read_addr < 256)) begin
            data_mem[mem_write_addr] = mem_write_data;
            mem_write_ready = 1'b1;
        end
    end
    
    always @(negedge mem_read_valid, negedge mem_write_valid) begin
        if(!mem_read_valid) begin
            mem_read_ready = 1'b0;
            mem_read_data = 8'd0;
        end
        if(!mem_write_valid) begin
            mem_write_ready = 1'b0;
        end
    end
    
    
endmodule
