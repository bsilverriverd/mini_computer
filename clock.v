`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/14 16:20:33
// Design Name: 
// Module Name: clock
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


module cpu_clock(
    input clk, rst,
    output clk_out, clk_en, clk_set
    );
    
    wire clk_100M_00, clk_100M_90;
    
    assign clk_out = clk_100M_00;
    assign clk_en = clk_100M_00 | clk_100M_90;
    assign clk_set = clk_100M_00 & clk_100M_90;
    
    clk_wiz_0 clk_wiz
    (
    // Clock out ports
    .clk_100M_00(clk_100M_00),
    .clk_100M_90(clk_100M_90),
    // Status and control signals
    .reset(rst),
    .locked(),
    // Clock in ports
    .clk_in1(clk)
    );
endmodule
