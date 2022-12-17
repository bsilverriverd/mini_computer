`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/16 22:10:18
// Design Name: 
// Module Name: mini_computer
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


module mini_computer(
    input clk,
    input rst,
    input halt,
    input RxD,
    output AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0,
    output ssA, ssB, ssC, ssD, ssE, ssF, ssG,
    output ssDP,
    output error,
    output TxD
    );
    wire clk_out, clk_en, clk_set;
    wire [7:0] program_data;
    reg [7:0] program_addr = 8'b0000_0000;
    wire [7:0] r0, r1, r2, r3;
    wire new_in;
    
    cpu_top cpu(
        .clk(clk_out), .clk_en(clk_en), .clk_set(clk_set), .rst(rst), .halt(halt), .program_data(program_data), .program_addr(program_addr), .new_in(new_in),
        .r0(r0), .r1(r1), .r2(r2), .r3(r3)
    );
    
    UART_top uart(
        .clk(clk_out),
        .rst(rst),
        .datain_ext(8'b0000_0000), // TxD를 통해 송신 될 Data
        .dataout_ext(program_data), // RxD를 통해 수신된 Data
        .new_in(1'b0), // UART로 새로운 data가 들어옴
        .new_out(new_in), // UART로 보낼 새로운 데이터가 있음
        .error(error),
        .RxD(RxD),
        .TxD(TxD)
    );
    
    ss_drive sseg(
    .clk(clk_out), .rst(rst),
	.mask(8'b1111_1111),
	.r0(r0), .r1(r1), .r2(r2), .r3(r3),
    .ssA(ssA), .ssB(ssB), .ssC(ssC), .ssD(ssD),
    .ssE(ssE), .ssF(ssF), .ssG(ssG), .ssDP(ssDP),
    .AN7(AN7), .AN6(AN6), .AN5(AN5), .AN4(AN4),
    .AN3(AN3), .AN2(AN2), .AN1(AN1), .AN0(AN0)
    );
       
    clk_wiz_0 ctrl_clk 
    (
    // Clock out ports
    .clk_out(clk_out),
    .clk_en(clk_en),
    .clk_set(clk_set),
    // Status and control signals
    .reset(rst),
    .locked(),
    // Clock in ports
    .clk_in1(clk)
    );

    always @(negedge new_in)
        if(halt)
            program_addr = program_addr + 1;
        
endmodule
