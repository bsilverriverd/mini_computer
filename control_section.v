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
    input clk, clk_en, clk_set, rst, halt,
    input [7:0] ir,
    input C, A, E, Z,
    output ram_en, acc_en, r0_en, r1_en, r2_en, r3_en, iar_en,
    output ir_set, mar_set, acc_set, ram_set, tmp_set, r0_set, r1_set, r2_set, r3_set, iar_set,
    output b1, flags_set,
    output [2:0] op
    );
    
    wire [6:0] step;
    wire [3:0] ra_sel, rb_sel;
    wire RegA_en, RegB_en, RegB_set;
    operand_decoder ra_dec(.in(ir[3:2]), .out(ra_sel));
    operand_decoder rb_dec(.in(ir[1:0]), .out(rb_sel));
    
    assign RegA_en = alu_step4 | load_step3 | store_step3;
    assign RegB_en = alu_step3 | store_step4 | jmpr_step3;
    assign RegB_set = alu_step5 | load_step4 | data_step4;
    
    assign r0_en = clk_en & RegA_en & ra_sel[0] | clk_en & RegB_en & rb_sel[0];
    assign r1_en = clk_en & RegA_en & ra_sel[1] | clk_en & RegB_en & rb_sel[1];
    assign r2_en = clk_en & RegA_en & ra_sel[2] | clk_en & RegB_en & rb_sel[2];
    assign r3_en = clk_en & RegA_en & ra_sel[3] | clk_en & RegB_en & rb_sel[3];
    
    assign r0_set = clk_set & RegB_set & rb_sel[0];
    assign r1_set = clk_set & RegB_set & rb_sel[1];
    assign r2_set = clk_set & RegB_set & rb_sel[2];
    assign r3_set = clk_set & RegB_set & rb_sel[3];
    
    //en
    assign b1 = step[0] | data_step3 | jcaez_step3 | clf_step3;
    assign iar_en = clk_en & (step[0] | data_step3 | jmpaddr_step3 | jcaez_step3);
    assign ram_en = clk_en & (step[1] | load_step4 | data_step4 | jmpaddr_step4 | jcaez_step5);
    assign acc_en = clk_en & (step[2] | data_step5 | jcaez_step4);
    //set
    assign ir_set = clk_set & step[1];
    assign mar_set = clk_set & (step[0] | load_step3 | store_step3 | data_step3 | jmpaddr_step3 | jcaez_step3);
    assign ram_set = clk_set & store_step4;
    assign iar_set = clk_set & (step[2] | data_step5 | jmpr_step3 | jmpaddr_step4 | jcaez_step4 | jcaez_step5);
    assign acc_set = clk_set & (step[0] | alu_step3 | data_step3 | jcaez_step3);
    assign tmp_set = clk_set & alu_step3;
    assign flags_set = clf_step3;
    
    //alu
    wire alu_step3, alu_step4, alu_step5;
    assign alu_step3 = ir[7] & step[3];
    assign alu_step4 = ir[7] & step[4];
    assign alu_step5 = ir[7] & step[5] & ~(ir[6] & ir[5] & ir[4]);
    
    assign op[0] = ir[7] & step[4] & ir[4];
    assign op[1] = ir[7] & step[4] & ir[5];
    assign op[2] = ir[7] & step[4] & ir[6];
    
    // non alu
    wire [7:0] nonalu_dec_out;
    wire load, store, data, jmpr, jmpaddr, jcaez, clf;
    nonalu_decoder nonalu_dec(.in(ir[6:4]), .out(nonalu_dec_out));
    assign load = ~ir[7] & nonalu_dec_out[0];
    assign store = ~ir[7] & nonalu_dec_out[1];
    assign data = ~ir[7] & nonalu_dec_out[2];
    assign jmpr = ~ir[7] & nonalu_dec_out[3];
    assign jmpaddr = ~ir[7] & nonalu_dec_out[4];
    assign jcaez = ~ir[7] & nonalu_dec_out[5];
    assign clf = ~ir[7] & nonalu_dec_out[6];
    
        //load store
    wire load_step3, load_step4, store_step3, store_step4;
    assign load_step3 = load & step[3];
    assign load_step4 = load & step[4];
    assign store_step3 = store & step[3];
    assign store_step4 = store & step[4];
        //data
    wire data_step3, data_step4, data_step5;
    assign data_step3 = data & step[3];
    assign data_step4 = data & step[4];
    assign data_step5 = data & step[5];
        //jmpr
   wire jmpr_step3;
   assign jmpr_step3 = jmpr & step[3];
       //jmpaddr
   wire jmpaddr_step3, jmp_addr_step4;
   assign jmpaddr_step3 = jmpaddr & step[3];
   assign jmpaddr_step4 = jmpaddr & step[4];
       //jcaez
   wire jcaez_step3, jcaez_step4, jcaez_step5;
   assign jcaez_step3 = jcaez & step[3];
   assign jcaez_step4 = jcaez & step[4];
   assign jcaez_step5 = jcaez & step[5];
       //clf
   wire clf_step3;
   assign clf_step3 = clf & step[3];
   
   stepper stepper(.clk(clk), .step(step), .rst(step[6] | halt));
    
//    assign b1 = step[0] | data_iar_en | jcaez_iar_en | clf_flags_set;
//    assign iar_en = clk_en & (step[0] | data_iar_en | jmp_iar_en | jcaez_iar_en);
//    assign ram_en = clk_en & (step[1] | load_rb_set | data_rb_set | jmp_iar_set| jcaez_ram_en);
//    assign acc_en = clk_en & (step[3] | alu_rb_set | data_iar_set | jcaez_acc_en);
//    assign r0_en = (clk_en & RegA_en & ra_sel[0]) | (clk_en & RegB_en & rb_sel[0]);
//    assign r1_en = (clk_en & RegA_en & ra_sel[1]) | (clk_en & RegB_en & rb_sel[1]);
//    assign r2_en = (clk_en & RegA_en & ra_sel[2]) | (clk_en & RegB_en & rb_sel[2]);
//    assign r3_en = (clk_en & RegA_en & ra_sel[3]) | (clk_en & RegB_en & rb_sel[3]);
    
//    assign ir_set = clk_set & step[1];
//    assign mar_set = clk_set & (step[0] | load_ra_en | store_ra_en | data_iar_en | jmp_iar_en | jcaez_iar_en);
//    assign iar_set = clk_set & (step[2] | data_iar_set | jmpr_rb_en | jmp_iar_set | jcaez_acc_en | jcaez_ram_en);
//    assign acc_set = clk_set & (step[1] | alu_ra_en | data_iar_en | jcaez_iar_en) ;
//    assign ram_set = clk_set & store_rb_en;;
//    assign tmp_set = clk_set & alu_rb_en;
//    assign r0_set = clk_set & RegB_set & rb_sel[0];
//    assign r1_set = clk_set & RegB_set & rb_sel[0];
//    assign r2_set = clk_set & RegB_set & rb_sel[0];
//    assign r3_set = clk_set & RegB_set & rb_sel[0];
//    assign flags_set = clf_flags_set;
    
//    assign op[0] = ir[7] & step[4] & ir[4];
//    assign op[1] = ir[7] & step[4] & ir[5];
//    assign op[2] = ir[7] & step[4] & ir[6];
    
//    wire alu_ra_en, alu_rb_en, alu_rb_set;
    
//    assign alu_rb_en = ir[7] & step[3];
//    assign alu_ra_en = ir[7] & step[4];
//    assign alu_rb_set = ir[7] & step[5] & ~(ir[6] & ir[5] & ir[4]);
    
//    assign RegB_en = alu_rb_en | store_rb_en | jmpr_rb_en;
//    assign RegA_en = alu_ra_en | load_ra_en | store_ra_en;
//    assign RegB_set = alu_rb_set | load_rb_set | data_rb_set;
        
//    operand_decoder ra_en(.in(ir[1:0]), .out(ra_sel));
//    operand_decoder rb_en(.in(ir[3:2]), .out(rb_sel));
    
//    wire [7:0] nonalu_dec_out;
//    nonalu_decoder nonalu_dec(.in(ir[6:4]), .out(nonalu_dec_out));
    
//    wire load, store;
//    wire load_ra_en, load_rb_set;
//    wire store_ra_en, store_rb_en;
    
//    assign load = ~ir[7] & nonalu_dec_out[0];
//    assign store = ~ir[7] & nonalu_dec_out[1];
//    assign load_ra_en = step[3] & load;
//    assign load_rb_set = step[4] & load;
//    assign store_ra_en = step[3] & store;
//    assign store_rb_en = step[4] & store; 
    
//    wire data;
//    wire data_iar_en, data_rb_set, data_iar_set;
//    assign data = ~ir[7] & nonalu_dec_out[2];
//    assign data_iar_en = step[3] & data;
//    assign data_rb_set = step[4] & data;
//    assign data_iar_set = step[5] & data;
    
//    wire jmpr;
//    wire jmpr_rb_en;
//    assign jmpr = ~ir[7] & nonalu_dec_out[3];
//    assign jmpr_rb_en = step[3] & jmpr;
    
//    wire jmp;
//    wire jmp_iar_en, jmp_iar_set;
//    assign jmp = ~ir[7] & nonalu_dec_out[4];
//    assign jmp_iar_en = step[3] & jmp;
//    assign jmp_iar_set = step[4] & jmp;
    
//    wire jcaez;
//    wire jcaez_iar_en, jcaez_acc_en, jcaez_ram_en;
//    assign jcaez = ~ir[7] & nonalu_dec_out[5];
//    assign jcaez_iar_en = step[3] & jcaez;
//    assign jcaez_acc_en = step[4] & jcaez;
//    assign jcaez_ram_en = step[5] & jcaez & (C & ir[3] | A & ir[2] | E & ir[1] | Z & ir[0]);
    
//    wire clf;
//    wire clf_flags_set;
//    assign clf = ~ir[7] & nonalu_dec_out[6];
//    assign clf_flags_set = step[4] & clf;
    
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

module nonalu_decoder(
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