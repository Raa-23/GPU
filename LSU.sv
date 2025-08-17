`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 16:48:08
// Design Name: 
// Module Name: LSU
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


module LSU(
    input clk,
    input reset,
    input enable,
    
    input [2:0] core_state, //external core state
    input decoded_mem_read_enable, //will be coming from decoder
    input decoded_mem_write_enable, //will be coming from decoder
    
    input [7:0] rs, //specifies the address
    input [7:0] rt, // specifies the data
    
//    for reading from memeory
    output reg mem_read_valid,
    output reg [7:0] mem_read_addr,
    input mem_read_ready,  
    input [7:0] mem_read_data, 
    
//    for writing to memory
    output reg mem_write_valid,
    output reg [7:0] mem_write_addr, 
    output reg [7:0] mem_write_data,
    input mem_write_ready, 
    
    output reg [7:0] lsu_out,
    output reg [1:0] lsu_state
    );
   
    
   parameter IDLE = 0, REQUESTING = 1, WAITING = 2 , DONE = 3 ;
   reg [1:0] next_state;
  
   initial begin
   lsu_state = IDLE;
   mem_read_valid = 0;
   mem_write_valid = 0;
   end
   
    
   //compulte the next state
   always @(*) begin
   case(lsu_state) 
   IDLE : next_state = (core_state == 3'b011)? REQUESTING : IDLE;
   REQUESTING : begin if(decoded_mem_read_enable == 1 ) begin
                     mem_read_valid = 1'b1;
                     mem_read_addr = rs; 
                     next_state = WAITING; end 
                if(decoded_mem_write_enable == 1 ) begin
                    mem_write_valid = 1'b1; 
                    mem_write_addr = rs;
                    mem_write_data = rt;
                    next_state = WAITING;
                    end
                end
   WAITING: begin if(mem_read_ready) begin 
            lsu_out = mem_read_data;
            next_state = DONE;
            mem_read_valid = 1'b0;
            mem_read_addr = 8'd0;
            end
            else if(mem_write_ready) begin 
                next_state = DONE;
                mem_write_valid = 1'b0;
                mem_write_addr = 8'd0;
                mem_write_data = 8'd0;
            end
            else next_state = WAITING;
            end
   DONE : next_state = (core_state == 3'b110)? IDLE : DONE ;
   endcase  
   end
   
   //tasks to be done in that state
   always @(posedge clk or posedge reset) begin
        if(reset) begin lsu_state <= IDLE; lsu_out <= 8'b0; end
        else if(enable) begin 
            lsu_state <= next_state;
            end        
   end
    
endmodule
