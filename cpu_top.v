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
    input clk, clk_en, clk_set, rst, halt, new_in,
    input [7:0] program_data, program_addr,
    output [7:0] r0, r1, r2, r3
    );
    
    wire [7:0] bus;
    wire [7:0] r0_out, r1_out, r2_out, r3_out;
    wire [7:0] ir_out, iar_out, acc_out, tmp_out, ram_out, alu_out, bus1_out;
    wire [3:0] alu_flags;
    wire [7:0] flags_out;
    wire ram_en, acc_en, r0_en, r1_en, r2_en, r3_en, iar_en, b1;
    wire mar_set, acc_set, ram_set, tmp_set, r0_set, r1_set, r2_set, r3_set, iar_set, flags_set;
    wire [2:0] op;
        
    or(bus, r0_out, r1_out, r2_out, r3_out, iar_out, acc_out, ram_out);
    register_monitor R0(.in(bus), .en(r0_en), .set(r0_set), .out(r0_out), .monitor(r0));
    register_monitor R1(.in(bus), .en(r1_en), .set(r1_set), .out(r1_out), .monitor(r1));
    register_monitor R2(.in(bus), .en(r2_en), .set(r2_set), .out(r2_out), .monitor(r2));
    register_monitor R3(.in(bus), .en(r3_en), .set(r3_set), .out(r3_out), .monitor(r3));
    
    register IR(.in(bus), .en(1'b1), .set(ir_set), .out(ir_out));
    register IAR(.in(bus), .en(iar_en), .set(iar_set), .out(iar_out));
    register TMP(.in(bus), .en(1'b1), .set(tmp_set), .out(tmp_out));
    register ACC(.in(alu_out), .en(acc_en), .set(acc_set), .out(acc_out));
    register FLAGS(.in({4'b0000, alu_flags}), .en(1'b1), .set(flags_set), .out(flags_out));
    
    bus1 top_bus1(
        .in(tmp_out), .b1(b1), .out(bus1_out)
    );
    
    alu top_alu(
        .a(bus),
        .b(bus1_out),
        .carry_in(flags_out[3]),
        .op(op),
        .out(alu_out),
        .C(alu_flags[3]), .A(alu_flags[2]), .E(alu_flags[1]), .Z(alu_flags[0])
    );
    
    control_section top_ctrl(
        .clk(clk), .clk_en(clk_en), .clk_set(clk_set), .rst(rst), .halt(halt),
        .ir(ir_out),
        .C(flags_out[3]), .A(flags_out[2]), .E(alu_flags[1]), .Z(alu_flags[0]),
        .ram_en(ram_en), .acc_en(acc_en), .r0_en(r0_en), .r1_en(r1_en), .r2_en(r2_en), .r3_en(r3_en), .iar_en(iar_en),
        .mar_set(mar_set), .acc_set(acc_set), .ram_set(ram_set), .tmp_set(tmp_set), .r0_set(r0_set), .r1_set(r1_set), .r2_set(r2_set), .r3_set(r3_set), .iar_set(iar_set),
        .b1(b1), .ir_set(ir_set), .flags_set(flags_set),
        .op(op)
    );
    
    ram top_ram(
        .addr(bus | ({8{halt}} & program_addr)),
        .set_addr(mar_set | (halt & new_in)),
        .in(bus | ({8{halt}} & program_data)),
        .set(ram_set | (halt & ~new_in)),
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
