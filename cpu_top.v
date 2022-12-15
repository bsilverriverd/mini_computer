`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/15 21:04:49
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
    input clk, rst
    );
    
    wire [7:0] bus;
    wire [7:0] r0_out, r1_out, r2_out, r3_out;
    wire [7:0] ir_out, iar_out, acc_out, tmp_out, ram_out, alu_out, bus1_out;
    wire ram_en, acc_en, r0_en, r1_en, r2_en, r3_en, iar_en, b1;
    wire mar_set, acc_set, ram_set, tmp_set, r0_set, r1_set, r2_set, r3_set, iar_set;
    wire [2:0] op;
    
    or(bus, r0_out, r1_out, r2_out, r3_out, iar_out, acc_out, ram_out);
    register R0(.in(bus), .en(r0_en), .set(r0_set), .out(r0_out));
    register R1(.in(bus), .en(r1_en), .set(r1_set), .out(r1_out));
    register R2(.in(bus), .en(r2_en), .set(r2_set), .out(r2_out));
    register R3(.in(bus), .en(r2_en), .set(r3_set), .out(r3_out));
    
    register IR(.in(bus), .en(1'b1), .set(ir_set), .out(ir_out));
    register IAR(.in(bus), .en(iar_en), .set(iar_set), .out(iar_out));
    register TMP(.in(bus), .en(1'b1), .set(tmp_set), .out(tmp_out));
    register ACC(.in(alu_out), .en(acc_en), .set(acc_set), .out(acc_out));
    
    bus1 top_bus1(
        .in(tmp_out), .b1(), .out(bus1_out)
    );
    alu top_alu(
        .a(bus),
        .b(bus1_out),
        input carry_in,
        .op(op),
        .out(alu_out),
        output A, E, Z, C
    );
    
    control_section top_ctrl(
        .clk(clk), .rst(rst),
        .ir(ir_out),
        .ram_en(ram_en), .acc_en(acc_en), .r0_en(r0_en), .r1_en(r1_en), .r2_en(r2_en), .r3_en(r2_en), .iar_en(iar_en),
        .mar_set(mar_set), .acc_set(acc_set), .ram_set(ram_set), .tmp_set(tmp_set), .r0_set(r0_set), .r1_set(r1_set), .r2_set(r2_set), .r3_set(r3_set), .iar_set(iar_set),
        .tmp_set(tmp_set), .b1(b1), .ir_set(ir_set),
        .op(op)
    );
    
    ram top_ram(
        .addr(bus),
        .set_addr(mar_set),
        .in(bus),
        .set(ram_set),
        .en(ram_en),
        .out(ram_out)
    );
    
endmodule

module bus1(
    input [7:0] in,
    input b1,
    output [7:0] out
    );
    
    or(out[0], in[0], b1);
    and(out[1], in[1], !b1);
    and(out[2], in[1], !b1);
    and(out[2], in[2], !b1);
    and(out[3], in[3], !b1);
    and(out[4], in[4], !b1);
    and(out[5], in[5], !b1);
    and(out[6], in[6], !b1);
    and(out[7], in[7], !b1);
    
endmodule
