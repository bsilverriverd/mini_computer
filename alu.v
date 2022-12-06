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
    output [7:0] out,
    output A, E, Z, C
    );
    
    wire [7:0] en;
    
    alu_decoder(.in(opcode), .out(en));
    
    wire [7:0] XOR, OR, AND, NOT, SHL, SHR, ADD;
    wire [7:0] XOR_en, OR_en, AND_en, NOT_en, SHL_en, SHR_en, ADD_en;
    
    wire ADD_carry_out, SHR_carry_out, SHL_carry_out;
    
    or(OR, a, b);
    and(AND, a, b);
    not(NOT, a, b);
    
    assign SHR = {carry_in, b[7:1]};
    assign SHL = {b[6:0], carry_in};
    
    adder adder(.a(a), .b(b), .carry_in(carry_in), .sum(ADD), .carry_out(ADD_carry_out));
    xorer xorer(.a(a), .b(b), .out(XOR), .A(A), .E(E));
    
    enabler enablerADD(.in(ADD), .en(en[0]), .out(ADD_en));
    enabler enablerSHR(.in(SHR), .en(en[1]), .out(SHR_en));
    enabler enablerSHL(.in(SHL), .en(en[2]), .out(SHL_en));
    enabler enablerNOT(.in(NOT), .en(en[3]), .out(NOT_en));
    enabler enablerAND(.in(AND), .en(en[4]), .out(AND_en));
    enabler enablerOR(.in(OR), .en(en[5]), .out(OR_en));
    enabler enablerXOR(.in(XOR), .en(en[6]), .out(XOR_en));
    enabler enablerCMP(.in(CMP), .en(en[7]), .out(CMP_en));
    
    or(out, ADD_en, SHR_en, SHL_en, NOT_en, AND_en, OR_en, XOR_en, CMP_en);
    assign Z = ~|out;
    assign C = ADD_carry_out & en[0] | SHR_carry_out & en[1] | SHL_carry_out & en[2];
   
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
    
    bit_add(.a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(carry[0]));
    bit_add(.a(a[1]), .b(b[1]), .carry_in(carry[0]), .sum(sum[1]), .carry_out(carry[1]));
    bit_add(.a(a[2]), .b(b[2]), .carry_in(carry[1]), .sum(sum[2]), .carry_out(carry[2]));
    bit_add(.a(a[3]), .b(b[3]), .carry_in(carry[2]), .sum(sum[3]), .carry_out(carry[3]));
    bit_add(.a(a[4]), .b(b[4]), .carry_in(carry[3]), .sum(sum[4]), .carry_out(carry[4]));
    bit_add(.a(a[5]), .b(b[5]), .carry_in(carry[4]), .sum(sum[5]), .carry_out(carry[5]));
    bit_add(.a(a[6]), .b(b[6]), .carry_in(carry[5]), .sum(sum[6]), .carry_out(carry[6]));
    bit_add(.a(a[7]), .b(b[7]), .carry_in(carry[6]), .sum(sum[7]), .carry_out(carry_out));
    
endmodule

module bit_add(
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

module xorer(
    input [7:0] a, b,
    output [7:0] out,
    output A, E
);

    wire [6:0] A_inner, E_inner;
    bit_xor xor7(.a(a[7]), .b(b[7]), .A_in(1'b0), .E_in(1'b1), .out(out[7]), .A_out(A_inner[6]), .E_out(E_inner[6]));
    bit_xor xor6(.a(a[6]), .b(b[6]), .A_in(A_inner[6]), .E_in(E_inner[6]), .out(out[6]), .A_out(A_inner[5]), .E_out(E_inner[5]));
    bit_xor xor5(.a(a[5]), .b(b[5]), .A_in(A_inner[5]), .E_in(E_inner[5]), .out(out[5]), .A_out(A_inner[4]), .E_out(E_inner[4]));
    bit_xor xor4(.a(a[4]), .b(b[4]), .A_in(A_inner[4]), .E_in(E_inner[4]), .out(out[4]), .A_out(A_inner[3]), .E_out(E_inner[3]));
    bit_xor xor3(.a(a[3]), .b(b[3]), .A_in(A_inner[3]), .E_in(E_inner[3]), .out(out[3]), .A_out(A_inner[2]), .E_out(E_inner[2]));
    bit_xor xor2(.a(a[2]), .b(b[2]), .A_in(A_inner[2]), .E_in(E_inner[2]), .out(out[2]), .A_out(A_inner[1]), .E_out(E_inner[1]));
    bit_xor xor1(.a(a[1]), .b(b[1]), .A_in(A_inner[1]), .E_in(E_inner[1]), .out(out[1]), .A_out(A_inner[0]), .E_out(E_inner[0]));
    bit_xor xor0(.a(a[0]), .b(b[0]), .A_in(A_inner[0]), .E_in(E_inner[0]), .out(out[0]), .A_out(A), .E_out(E));
    
endmodule

module bit_xor(
    input a, b,
    input A_in, E_in,
    output A_out, E_out, out
);  
    wire a_xor_b;  
    xor(a_xor_b, a, b);
    and(E_out, E_in, !a_xor_b);
    or(A_out, a & E_in & a_xor_b, A_in);
    
endmodule
    
    
endmodule