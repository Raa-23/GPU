`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 22:31:35
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();
    reg clk;
    reg reset;
    reg reg_write_enable;
    
    reg [3:0] rs_addr;
    reg [3:0] rt_addr;
    reg [3:0] rd_addr;
    reg [7:0] data_write;
    
    reg [2:0] core_state;
    
    wire [7:0]rs,rt ;
    
    regfile instance1(clk,reset,reg_write_enable,
     rs_addr,rt_addr,rd_addr,data_write,core_state,rs,rt);
     
    initial begin
    clk = 0;
    reset = 0;
    core_state = 3'b011;
    reg_write_enable = 0;
    forever #5 clk = ~clk;
    
    end
    
    initial begin
    rs_addr = 4'd2;
    rt_addr = 4'd3;
    
    #10 core_state = 3'b000;
    reg_write_enable = 1;
    rd_addr = 4'd2;
    data_write = 8'd127;
    
    #10 rd_addr = 4'd3;
        data_write = 8'd63;
    
    #10 core_state = 3'b011;
        reg_write_enable = 0;
        rs_addr = 4'd2;
        rt_addr = 4'd3;
        
   #10  reset = 1;
     
   #10 $finish;
    end
    
    
    
endmodule
