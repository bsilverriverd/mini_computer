`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/14 16:48:21
// Design Name: 
// Module Name: control_section
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


module control_section(
    input clk, rst,
    input [7:0] ir,
    output ram_en, acc_en, r0_en, r1_en, r2_en, r3_en, iar_en,
    output ir_set, mar_set, acc_set, ram_set, tmp_set, r0_set, r1_set, r2_set, r3_set, iar_set,
    output tmp_set, b1,
    output [2:0] op
    );
    
    wire [6:0] step;
    wire [3:0] ra_sel, rb_sel;
    wire RegA_en, RegB_en, RegB_set;
    
    wire clk_out, clk_en, clk_set;
    clock ctrl_clk(.clk(clk), .rst(rst), .clk_out(clk_out), .clk_en(clk_en), .clk_set(clk_set));
    stepper stepper(.clk(clk_out), .step(step), .rst(step[6]));
    
    assign b1 = step[0];
    assign iar_en = clk_en & step[0];
    assign ram_en = clk_en & (step[1] | load_rb_set);
    assign acc_en = clk_en & (step[3] | alu_rb_set);
    assign r0_en = (clk_en & RegA_en & ra_sel[0]) | (clk_en & RegB_en & rb_sel[0]);
    assign r1_en = (clk_en & RegA_en & ra_sel[1]) | (clk_en & RegB_en & rb_sel[1]);
    assign r2_en = (clk_en & RegA_en & ra_sel[2]) | (clk_en & RegB_en & rb_sel[2]);
    assign r3_en = (clk_en & RegA_en & ra_sel[3]) | (clk_en & RegB_en & rb_sel[3]);
    
    assign ir_set = clk_set & step[1];
    assign mar_set = clk_set & (step[0] | load_ra_en | store_ra_en);
    assign iar_set = clk_set & step[2];
    assign acc_set = clk_set & (step[1] | alu_ra_en) ;
    assign ram_set = clk_set & store_rb_en;;
    assign tmp_set = clk_set & alu_rb_en;
    assign r0_set = clk_set & RegB_set & rb_sel[0];
    assign r1_set = clk_set & RegB_set & rb_sel[0];
    assign r2_set = clk_set & RegB_set & rb_sel[0];
    assign r3_set = clk_set & RegB_set & rb_sel[0];
    
    assign op[0] = ir[7] & step[4] & ir[4];
    assign op[1] = ir[7] & step[4] & ir[5];
    assign op[2] = ir[7] & step[4] & ir[6];
    
    wire alu_ra_en, alu_rb_en, alu_rb_set;
    
    assign alu_rb_en = ir[7] & step[3];
    assign alu_ra_en = ir[7] & step[4];
    assign alu_rb_set = ir[7] & step[5] & !(ir[6] & ir[5] & ir[4]);
    
    assign RegB_en = alu_rb_en | store_rb_en;
    assign RegA_en = alu_ra_en | load_ra_en | store_ra_en;
    assign RegB_set = alu_rb_set | load_rb_set;
        
    operand_decoder ra_en(.in(ir[1:0]), .out(ra_sel));
    operand_decoder rb_en(.in(ir[3:2]), .out(rb_sel));
    
    wire [7:0] nonalu_dec_out;
    nonalu_decoder nonalu_dec(.in(ir[6:4]), .out(nonalu_dec_out));
    
    wire load, store;
    wire load_ra_en, load_rb_set;
    wire store_ra_en, store_rb_en;
    
    assign load = ir[7] & nonalu_dec_out[0];
    assign store = ir[7] & nonalu_dec_out[1];
    assign load_ra_en = step[3] & load;
    assign load_rb_set = step[4] & load;
    assign store_ra_en = step[3] & store;
    assign store_rb_en = step[4] & store; 
    
endmodule

module operand_decoder(
    input[1:0] in,
    output[3:0] out
);
    wire [1:0] not_in;
    not(not_in[0], in[0]);
    not(not_in[1], in[1]);
    
    and a0(out[0], not_in[0], not_in[1]);
    and a1(out[1], in[0], not_in[1]);
    and a2(out[2], not_in[0], in[1]);
    and a3(out[3], in[0], in[1]);
endmodule

module non_alu_decoder(
    input[2:0] in,
    output[7:0] out
);
    wire [2:0] not_in;
    not(not_in[0], in[0]);
    not(not_in[1], in[1]);
    not(not_in[2], in[2]);
    
    and a0(out[0], not_in[0], not_in[1], not_in[2]);
    and a1(out[1], in[0], not_in[1], not_in[2]);
    and a2(out[2], not_in[0], in[1], not_in[2]);
    and a3(out[3], in[0], in[1], not_in[2]);
    and a4(out[4], not_in[0], not_in[1], in[2]);
    and a5(out[5], in[0], not_in[1], in[2]);
    and a6(out[6], not_in[0], in[1], in[2]);
    and a7(out[7], in[0], in[1], in[2]);

endmodule