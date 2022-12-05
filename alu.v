`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/05 19:48:39
// Design Name: 
// Module Name: alu
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


module alu(
    input [7:0] a,
    input [7:0] b,
    input carry_in,
    input [2:0] opcode,
    output [7:0] out
    );
    
    wire [7:0] en;
    
    alu_decoder(opcode, en);
    
    wire [7:0] XOR, OR, AND, NOT, SHL, SHR, ADD;
    
    xor(XOR, a, b);
    or(OR, a, b);
    and(AND, a, b);
    not(NOT, a, b);
    
   
endmodule

module alu_decoder(
    input [2:0] in,
    output [7:0] out
);

    wire [2:0] not_in;
    not(not_in[0], in[0]);
    not(not_in[1], in[1]);
    not(not_in[2], in[2]);
    
    and a0(out[0], not_in[0], not_in[1], not_in[2]); // 000: ADD
    and a1(out[1], in[0], not_in[1], not_in[2]); // 001: SHR
    and a2(out[2], not_in[0], in[1], not_in[2]); // 010: SHL
    and a3(out[3], in[0], in[1], not_in[2]);  // 011: NOT
    and a4(out[4], not_in[0], not_in[1], in[2]); // 100:AND
    and a5(out[5], in[0], not_in[1], in[2]); // 101: OR
    and a6(out[6], not_in[0], in[1], in[2]); // 110: XOR
    and a7(out[7], in[0], in[1], in[2]); // 111: CMP
endmodule