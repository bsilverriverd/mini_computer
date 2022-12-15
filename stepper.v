`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/14 15:22:41
// Design Name: 
// Module Name: stepper
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


module stepper(
    input clk, rst,
    output [6:0]step
    );
    
    wire [11:0] m_out;
    wire clk_not;
    
    assign clk_not = !clk;
    
    bit m0(.in(!rst), .set(clk_not|rst), .out(m_out[0]));
    bit m1(.in(m_out[0]), .set(clk|rst), .out(m_out[1]));
    or(step[0], rst, !m_out[1]);
    
    bit m2(.in(m_out[1]), .set(clk_not|rst), .out(m_out[2]));
    bit m3(.in(m_out[2]), .set(clk|rst), .out(m_out[3]));
    or(step[1], m_out[1], !m_out[3]);
    
    bit m4(.in(m_out[3]), .set(clk_not|rst), .out(m_out[4]));
    bit m5(.in(m_out[4]), .set(clk|rst), .out(m_out[5]));
    or(step[2], m_out[3], !m_out[5]);
    
    bit m6(.in(m_out[5]), .set(clk_not|rst), .out(m_out[6]));
    bit m7(.in(m_out[6]), .set(clk|rst), .out(m_out[7]));
    or(step[3], m_out[5], !m_out[7]);
    
    bit m8(.in(m_out[7]), .set(clk_not|rst), .out(m_out[8]));
    bit m9(.in(m_out[8]), .set(clk|rst), .out(m_out[9]));
    or(step[4], m_out[7], !m_out[9]);
    
    bit m10(.in(m_out[9]), .set(clk_not|rst), .out(m_out[10]));
    bit m11(.in(m_out[10]), .set(clk|rst), .out(m_out[11]));
    or(step[5], m_out[9], !m_out[11]);
    
    assign step[6] = m_out[11];
    
    
endmodule
