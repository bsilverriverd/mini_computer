`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/23 22:05:34
// Design Name: 
// Module Name: mem
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


module bit(
    input in,
    input set,
    output out
    );
    
    wire a,b,c;
    
    nand n1(a, in, set);
    nand n2(b, a, set);
    
    nand n3(out, a, c);
    nand n4(c, b, out); 
    
endmodule

module byte(
    input[7:0] in,
    input set,
    output [7:0] out
    );

    bit b0(.in(in[0]), .set(set), .out(out[0]));
    bit b1(.in(in[1]), .set(set), .out(out[1]));
    bit b2(.in(in[2]), .set(set), .out(out[2]));
    bit b3(.in(in[3]), .set(set), .out(out[3]));
    bit b4(.in(in[4]), .set(set), .out(out[4]));
    bit b5(.in(in[5]), .set(set), .out(out[5]));
    bit b6(.in(in[6]), .set(set), .out(out[6]));
    bit b7(.in(in[7]), .set(set), .out(out[7]));

endmodule

module enabler(
    input [7:0] in,
    input en,
    output [7:0] out
);
    and(out[0], en, in[0]);
    and(out[1], en, in[1]);
    and(out[2], en, in[2]);
    and(out[3], en, in[3]);
    and(out[4], en, in[4]);
    and(out[5], en, in[5]);
    and(out[6], en, in[6]);
    and(out[7], en, in[7]);
//    assign out = (en) ? in : 8'b0000_0000;

endmodule

module register(
    input[7:0] in, 
    input set,
    input en,
    output [7:0] out
    );
    
    wire[7:0] buffer;
    byte reg_byte(.in(in), .set(set), .out(buffer));
    
    enabler reg_enabler(.in(buffer), .en(en), .out(out)); 
    
endmodule

module register_monitor(
    input[7:0] in, 
    input set,
    input en,
    output [7:0] out,
    output [7:0] monitor
    );
    
    wire[7:0] buffer;
    byte reg_byte(.in(in), .set(set), .out(buffer));
    
    enabler reg_enabler(.in(buffer), .en(en), .out(out)); 
    
    assign monitor = buffer;
endmodule

