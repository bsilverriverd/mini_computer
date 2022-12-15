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


module clock(
    input clk, rst,
    output clk_out, clk_en, clk_set
    );
    
    wire clk_10M_00, clk_10M_90;
    
    assign clk_out = clk_10M_00;
    assign clk_en = clk_10M_00 | clk_10M_90;
    assign clk_set = clk_10M_90;
    
    clk_wiz_0 clk_wiz
    (
    // Clock out ports
    .clk_10M_00(clk_10M_00),
    .clk_10M_90(clk_10M_90),
    // Status and control signals
    .reset(rst),
    .locked(),
    // Clock in ports
    .clk_in1(clk)
    );
endmodule
