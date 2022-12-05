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
    
    alu_decoder(.in(opcode), .out(en));
    
    wire [7:0] XOR, OR, AND, NOT, SHL, SHR, ADD;
    
    wire ADD_carry_out, SHR_carry_out, SHL_carry_out;
    
    xor(XOR, a, b);
    or(OR, a, b);
    and(AND, a, b);
    not(NOT, a, b);
    
    assign SHR = {carry_in, b[7:1]};
    assign SHL = {b[6:0], carry_in};
    
    adder adder(.a(a), .b(b), .carry_in(carry_in), .sum(ADD), .carry_out(ADD_carry_out));
   
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

module adder(
    input [7:0] a, b,
    input carry_in,
    output [7:0] sum,
    output carry_out
);
    wire [6:0] carry;
    
    add(.a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(carry[0]));
    add(.a(a[1]), .b(b[1]), .carry_in(carry[0]), .sum(sum[1]), .carry_out(carry[1]));
    add(.a(a[2]), .b(b[2]), .carry_in(carry[1]), .sum(sum[2]), .carry_out(carry[2]));
    add(.a(a[3]), .b(b[3]), .carry_in(carry[2]), .sum(sum[3]), .carry_out(carry[3]));
    add(.a(a[4]), .b(b[4]), .carry_in(carry[3]), .sum(sum[4]), .carry_out(carry[4]));
    add(.a(a[5]), .b(b[5]), .carry_in(carry[4]), .sum(sum[5]), .carry_out(carry[5]));
    add(.a(a[6]), .b(b[6]), .carry_in(carry[5]), .sum(sum[6]), .carry_out(carry[6]));
    add(.a(a[7]), .b(b[7]), .carry_in(carry[6]), .sum(sum[7]), .carry_out(carry_out));
    
endmodule
module add(
    input a, b, carry_in,
    output sum, carry_out
);

    wire a_xor_b, a_and_b, carry_and_ab;
    
    xor(a_xor_b, a, b);
    and(a_and_b, a, b);
    and(carry_and_ab, carry_in, a_xor_b);
    
    xor(sum, a_xor_b, carry_in);
    or(carry_out, a_and_b, carry_and_ab);
    
endmodule