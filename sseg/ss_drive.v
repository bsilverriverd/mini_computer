`timescale 1ns / 1ps

module ss_drive(
    input clk, rst,
	input [7:0] mask,
	input [7:0] r0, r1, r2, r3,
    output ssA, ssB, ssC, ssD,
    output ssE, ssF, ssG, ssDP,
    output reg AN7, AN6, AN5, AN4,
    output reg AN3, AN2, AN1, AN0
    );	
	reg [2:0] sel;
	reg [3:0] data;
	integer cnt;
     
	always @(posedge clk)
		if(rst)
            begin
            cnt <= 0;
            sel <= 3'b000;
            end
		else if (cnt < 100000)
			begin
			cnt <= cnt + 1;
			sel <= sel;
			end
		else 
			begin
			cnt <= 0;
			sel <= sel + 1;
			end

	always @(sel, mask, r0, r1, r2, r3) 
	begin
        { AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0 } = 8'b1111_1111;
		case(sel)
			3'b000 : begin   data = r0[3:0];   AN0 = 0 | (~mask[0]);   end
			3'b001 : begin   data = r0[7:4];   AN1 = 0 | (~mask[1]);   end
            3'b010 : begin   data = r1[3:0];   AN2 = 0 | (~mask[2]);   end
            3'b011 : begin   data = r1[7:4];   AN3 = 0 | (~mask[3]);   end      
        	3'b100 : begin   data = r2[3:0];   AN4 = 0 | (~mask[4]);   end   
            3'b101 : begin   data = r2[7:4];   AN5 = 0 | (~mask[5]);   end
            3'b110 : begin   data = r3[3:0];   AN6 = 0 | (~mask[6]);   end
            default: begin   data = r3[7:4];   AN7 = 0 | (~mask[7]);   end
		endcase
    end
    
    ss_decoder data_decode (
    .Din(data), .a(ssA), .b(ssB), .c(ssC), .d(ssD), .e(ssE), .f(ssF), .g(ssG), .dp(ssDP)
    );

endmodule
