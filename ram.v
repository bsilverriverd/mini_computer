`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/23 22:43:47
// Design Name: 
// Module Name: ram
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


module ram(
    input [7:0] addr,
    input set_addr,
    input [7:0] in,
    input set,
    input en,
    output [7:0] out
    
    );
    
    wire [7:0] mar_out;
    wire [15:0] ram_col;
    wire [15:0] ram_row;
    
    register mar(
        .in(addr),
        .set(set_addr),
        .en(1'b1),
        .out(mar_out)
    );
      
    mar_decoder col (
        .in(mar_out[3:0]),
        .out(ram_col)
    );
    mar_decoder row (
        .in(mar_out[7:4]),
        .out(ram_row)
   );
   wire [7:0] ram_out [255:0];
   
   or bus_out(out, ram_out[0], ram_out[1], ram_out[2], ram_out[3], ram_out[4], ram_out[5], ram_out[6], ram_out[7], ram_out[8], ram_out[9]
, ram_out[10], ram_out[11], ram_out[12], ram_out[13], ram_out[14], ram_out[15], ram_out[16], ram_out[17], ram_out[18], ram_out[19]
, ram_out[20], ram_out[21], ram_out[22], ram_out[23], ram_out[24], ram_out[25], ram_out[26], ram_out[27], ram_out[28], ram_out[29]
, ram_out[30], ram_out[31], ram_out[32], ram_out[33], ram_out[34], ram_out[35], ram_out[36], ram_out[37], ram_out[38], ram_out[39]
, ram_out[40], ram_out[41], ram_out[42], ram_out[43], ram_out[44], ram_out[45], ram_out[46], ram_out[47], ram_out[48], ram_out[49]
, ram_out[50], ram_out[51], ram_out[52], ram_out[53], ram_out[54], ram_out[55], ram_out[56], ram_out[57], ram_out[58], ram_out[59]
, ram_out[60], ram_out[61], ram_out[62], ram_out[63], ram_out[64], ram_out[65], ram_out[66], ram_out[67], ram_out[68], ram_out[69]
, ram_out[70], ram_out[71], ram_out[72], ram_out[73], ram_out[74], ram_out[75], ram_out[76], ram_out[77], ram_out[78], ram_out[79]
, ram_out[80], ram_out[81], ram_out[82], ram_out[83], ram_out[84], ram_out[85], ram_out[86], ram_out[87], ram_out[88], ram_out[89]
, ram_out[90], ram_out[91], ram_out[92], ram_out[93], ram_out[94], ram_out[95], ram_out[96], ram_out[97], ram_out[98], ram_out[99]
, ram_out[100], ram_out[101], ram_out[102], ram_out[103], ram_out[104], ram_out[105], ram_out[106], ram_out[107], ram_out[108], ram_out[109]
, ram_out[110], ram_out[111], ram_out[112], ram_out[113], ram_out[114], ram_out[115], ram_out[116], ram_out[117], ram_out[118], ram_out[119]
, ram_out[120], ram_out[121], ram_out[122], ram_out[123], ram_out[124], ram_out[125], ram_out[126], ram_out[127], ram_out[128], ram_out[129]
, ram_out[130], ram_out[131], ram_out[132], ram_out[133], ram_out[134], ram_out[135], ram_out[136], ram_out[137], ram_out[138], ram_out[139]
, ram_out[140], ram_out[141], ram_out[142], ram_out[143], ram_out[144], ram_out[145], ram_out[146], ram_out[147], ram_out[148], ram_out[149]
, ram_out[150], ram_out[151], ram_out[152], ram_out[153], ram_out[154], ram_out[155], ram_out[156], ram_out[157], ram_out[158], ram_out[159]
, ram_out[160], ram_out[161], ram_out[162], ram_out[163], ram_out[164], ram_out[165], ram_out[166], ram_out[167], ram_out[168], ram_out[169]
, ram_out[170], ram_out[171], ram_out[172], ram_out[173], ram_out[174], ram_out[175], ram_out[176], ram_out[177], ram_out[178], ram_out[179]
, ram_out[180], ram_out[181], ram_out[182], ram_out[183], ram_out[184], ram_out[185], ram_out[186], ram_out[187], ram_out[188], ram_out[189]
, ram_out[190], ram_out[191], ram_out[192], ram_out[193], ram_out[194], ram_out[195], ram_out[196], ram_out[197], ram_out[198], ram_out[199]
, ram_out[200], ram_out[201], ram_out[202], ram_out[203], ram_out[204], ram_out[205], ram_out[206], ram_out[207], ram_out[208], ram_out[209]
, ram_out[210], ram_out[211], ram_out[212], ram_out[213], ram_out[214], ram_out[215], ram_out[216], ram_out[217], ram_out[218], ram_out[219]
, ram_out[220], ram_out[221], ram_out[222], ram_out[223], ram_out[224], ram_out[225], ram_out[226], ram_out[227], ram_out[228], ram_out[229]
, ram_out[230], ram_out[231], ram_out[232], ram_out[233], ram_out[234], ram_out[235], ram_out[236], ram_out[237], ram_out[238], ram_out[239]
, ram_out[240], ram_out[241], ram_out[242], ram_out[243], ram_out[244], ram_out[245], ram_out[246], ram_out[247], ram_out[248], ram_out[249]
, ram_out[250], ram_out[251], ram_out[252], ram_out[253], ram_out[254], ram_out[255]);
   
    register ram0 (.in(in),.set(set & ram_row[0] & ram_col[0]),.en(en & ram_row[0] & ram_col[0]),.out(ram_out[0]));
    register ram1 (.in(in),.set(set & ram_row[0] & ram_col[1]),.en(en & ram_row[0] & ram_col[1]),.out(ram_out[1]));
    register ram2 (.in(in),.set(set & ram_row[0] & ram_col[2]),.en(en & ram_row[0] & ram_col[2]),.out(ram_out[2]));
    register ram3 (.in(in),.set(set & ram_row[0] & ram_col[3]),.en(en & ram_row[0] & ram_col[3]),.out(ram_out[3]));
    register ram4 (.in(in),.set(set & ram_row[0] & ram_col[4]),.en(en & ram_row[0] & ram_col[4]),.out(ram_out[4]));
    register ram5 (.in(in),.set(set & ram_row[0] & ram_col[5]),.en(en & ram_row[0] & ram_col[5]),.out(ram_out[5]));
    register ram6 (.in(in),.set(set & ram_row[0] & ram_col[6]),.en(en & ram_row[0] & ram_col[6]),.out(ram_out[6]));
    register ram7 (.in(in),.set(set & ram_row[0] & ram_col[7]),.en(en & ram_row[0] & ram_col[7]),.out(ram_out[7]));
    register ram8 (.in(in),.set(set & ram_row[0] & ram_col[8]),.en(en & ram_row[0] & ram_col[8]),.out(ram_out[8]));
    register ram9 (.in(in),.set(set & ram_row[0] & ram_col[9]),.en(en & ram_row[0] & ram_col[9]),.out(ram_out[9]));
    register ram10 (.in(in),.set(set & ram_row[0] & ram_col[10]),.en(en & ram_row[0] & ram_col[10]),.out(ram_out[10]));
    register ram11 (.in(in),.set(set & ram_row[0] & ram_col[11]),.en(en & ram_row[0] & ram_col[11]),.out(ram_out[11]));
    register ram12 (.in(in),.set(set & ram_row[0] & ram_col[12]),.en(en & ram_row[0] & ram_col[12]),.out(ram_out[12]));
    register ram13 (.in(in),.set(set & ram_row[0] & ram_col[13]),.en(en & ram_row[0] & ram_col[13]),.out(ram_out[13]));
    register ram14 (.in(in),.set(set & ram_row[0] & ram_col[14]),.en(en & ram_row[0] & ram_col[14]),.out(ram_out[14]));
    register ram15 (.in(in),.set(set & ram_row[0] & ram_col[15]),.en(en & ram_row[0] & ram_col[15]),.out(ram_out[15]));
    register ram16 (.in(in),.set(set & ram_row[1] & ram_col[0]),.en(en & ram_row[1] & ram_col[0]),.out(ram_out[16]));
    register ram17 (.in(in),.set(set & ram_row[1] & ram_col[1]),.en(en & ram_row[1] & ram_col[1]),.out(ram_out[17]));
    register ram18 (.in(in),.set(set & ram_row[1] & ram_col[2]),.en(en & ram_row[1] & ram_col[2]),.out(ram_out[18]));
    register ram19 (.in(in),.set(set & ram_row[1] & ram_col[3]),.en(en & ram_row[1] & ram_col[3]),.out(ram_out[19]));
    register ram20 (.in(in),.set(set & ram_row[1] & ram_col[4]),.en(en & ram_row[1] & ram_col[4]),.out(ram_out[20]));
    register ram21 (.in(in),.set(set & ram_row[1] & ram_col[5]),.en(en & ram_row[1] & ram_col[5]),.out(ram_out[21]));
    register ram22 (.in(in),.set(set & ram_row[1] & ram_col[6]),.en(en & ram_row[1] & ram_col[6]),.out(ram_out[22]));
    register ram23 (.in(in),.set(set & ram_row[1] & ram_col[7]),.en(en & ram_row[1] & ram_col[7]),.out(ram_out[23]));
    register ram24 (.in(in),.set(set & ram_row[1] & ram_col[8]),.en(en & ram_row[1] & ram_col[8]),.out(ram_out[24]));
    register ram25 (.in(in),.set(set & ram_row[1] & ram_col[9]),.en(en & ram_row[1] & ram_col[9]),.out(ram_out[25]));
    register ram26 (.in(in),.set(set & ram_row[1] & ram_col[10]),.en(en & ram_row[1] & ram_col[10]),.out(ram_out[26]));
    register ram27 (.in(in),.set(set & ram_row[1] & ram_col[11]),.en(en & ram_row[1] & ram_col[11]),.out(ram_out[27]));
    register ram28 (.in(in),.set(set & ram_row[1] & ram_col[12]),.en(en & ram_row[1] & ram_col[12]),.out(ram_out[28]));
    register ram29 (.in(in),.set(set & ram_row[1] & ram_col[13]),.en(en & ram_row[1] & ram_col[13]),.out(ram_out[29]));
    register ram30 (.in(in),.set(set & ram_row[1] & ram_col[14]),.en(en & ram_row[1] & ram_col[14]),.out(ram_out[30]));
    register ram31 (.in(in),.set(set & ram_row[1] & ram_col[15]),.en(en & ram_row[1] & ram_col[15]),.out(ram_out[31]));
    register ram32 (.in(in),.set(set & ram_row[2] & ram_col[0]),.en(en & ram_row[2] & ram_col[0]),.out(ram_out[32]));
    register ram33 (.in(in),.set(set & ram_row[2] & ram_col[1]),.en(en & ram_row[2] & ram_col[1]),.out(ram_out[33]));
    register ram34 (.in(in),.set(set & ram_row[2] & ram_col[2]),.en(en & ram_row[2] & ram_col[2]),.out(ram_out[34]));
    register ram35 (.in(in),.set(set & ram_row[2] & ram_col[3]),.en(en & ram_row[2] & ram_col[3]),.out(ram_out[35]));
    register ram36 (.in(in),.set(set & ram_row[2] & ram_col[4]),.en(en & ram_row[2] & ram_col[4]),.out(ram_out[36]));
    register ram37 (.in(in),.set(set & ram_row[2] & ram_col[5]),.en(en & ram_row[2] & ram_col[5]),.out(ram_out[37]));
    register ram38 (.in(in),.set(set & ram_row[2] & ram_col[6]),.en(en & ram_row[2] & ram_col[6]),.out(ram_out[38]));
    register ram39 (.in(in),.set(set & ram_row[2] & ram_col[7]),.en(en & ram_row[2] & ram_col[7]),.out(ram_out[39]));
    register ram40 (.in(in),.set(set & ram_row[2] & ram_col[8]),.en(en & ram_row[2] & ram_col[8]),.out(ram_out[40]));
    register ram41 (.in(in),.set(set & ram_row[2] & ram_col[9]),.en(en & ram_row[2] & ram_col[9]),.out(ram_out[41]));
    register ram42 (.in(in),.set(set & ram_row[2] & ram_col[10]),.en(en & ram_row[2] & ram_col[10]),.out(ram_out[42]));
    register ram43 (.in(in),.set(set & ram_row[2] & ram_col[11]),.en(en & ram_row[2] & ram_col[11]),.out(ram_out[43]));
    register ram44 (.in(in),.set(set & ram_row[2] & ram_col[12]),.en(en & ram_row[2] & ram_col[12]),.out(ram_out[44]));
    register ram45 (.in(in),.set(set & ram_row[2] & ram_col[13]),.en(en & ram_row[2] & ram_col[13]),.out(ram_out[45]));
    register ram46 (.in(in),.set(set & ram_row[2] & ram_col[14]),.en(en & ram_row[2] & ram_col[14]),.out(ram_out[46]));
    register ram47 (.in(in),.set(set & ram_row[2] & ram_col[15]),.en(en & ram_row[2] & ram_col[15]),.out(ram_out[47]));
    register ram48 (.in(in),.set(set & ram_row[3] & ram_col[0]),.en(en & ram_row[3] & ram_col[0]),.out(ram_out[48]));
    register ram49 (.in(in),.set(set & ram_row[3] & ram_col[1]),.en(en & ram_row[3] & ram_col[1]),.out(ram_out[49]));
    register ram50 (.in(in),.set(set & ram_row[3] & ram_col[2]),.en(en & ram_row[3] & ram_col[2]),.out(ram_out[50]));
    register ram51 (.in(in),.set(set & ram_row[3] & ram_col[3]),.en(en & ram_row[3] & ram_col[3]),.out(ram_out[51]));
    register ram52 (.in(in),.set(set & ram_row[3] & ram_col[4]),.en(en & ram_row[3] & ram_col[4]),.out(ram_out[52]));
    register ram53 (.in(in),.set(set & ram_row[3] & ram_col[5]),.en(en & ram_row[3] & ram_col[5]),.out(ram_out[53]));
    register ram54 (.in(in),.set(set & ram_row[3] & ram_col[6]),.en(en & ram_row[3] & ram_col[6]),.out(ram_out[54]));
    register ram55 (.in(in),.set(set & ram_row[3] & ram_col[7]),.en(en & ram_row[3] & ram_col[7]),.out(ram_out[55]));
    register ram56 (.in(in),.set(set & ram_row[3] & ram_col[8]),.en(en & ram_row[3] & ram_col[8]),.out(ram_out[56]));
    register ram57 (.in(in),.set(set & ram_row[3] & ram_col[9]),.en(en & ram_row[3] & ram_col[9]),.out(ram_out[57]));
    register ram58 (.in(in),.set(set & ram_row[3] & ram_col[10]),.en(en & ram_row[3] & ram_col[10]),.out(ram_out[58]));
    register ram59 (.in(in),.set(set & ram_row[3] & ram_col[11]),.en(en & ram_row[3] & ram_col[11]),.out(ram_out[59]));
    register ram60 (.in(in),.set(set & ram_row[3] & ram_col[12]),.en(en & ram_row[3] & ram_col[12]),.out(ram_out[60]));
    register ram61 (.in(in),.set(set & ram_row[3] & ram_col[13]),.en(en & ram_row[3] & ram_col[13]),.out(ram_out[61]));
    register ram62 (.in(in),.set(set & ram_row[3] & ram_col[14]),.en(en & ram_row[3] & ram_col[14]),.out(ram_out[62]));
    register ram63 (.in(in),.set(set & ram_row[3] & ram_col[15]),.en(en & ram_row[3] & ram_col[15]),.out(ram_out[63]));
    register ram64 (.in(in),.set(set & ram_row[4] & ram_col[0]),.en(en & ram_row[4] & ram_col[0]),.out(ram_out[64]));
    register ram65 (.in(in),.set(set & ram_row[4] & ram_col[1]),.en(en & ram_row[4] & ram_col[1]),.out(ram_out[65]));
    register ram66 (.in(in),.set(set & ram_row[4] & ram_col[2]),.en(en & ram_row[4] & ram_col[2]),.out(ram_out[66]));
    register ram67 (.in(in),.set(set & ram_row[4] & ram_col[3]),.en(en & ram_row[4] & ram_col[3]),.out(ram_out[67]));
    register ram68 (.in(in),.set(set & ram_row[4] & ram_col[4]),.en(en & ram_row[4] & ram_col[4]),.out(ram_out[68]));
    register ram69 (.in(in),.set(set & ram_row[4] & ram_col[5]),.en(en & ram_row[4] & ram_col[5]),.out(ram_out[69]));
    register ram70 (.in(in),.set(set & ram_row[4] & ram_col[6]),.en(en & ram_row[4] & ram_col[6]),.out(ram_out[70]));
    register ram71 (.in(in),.set(set & ram_row[4] & ram_col[7]),.en(en & ram_row[4] & ram_col[7]),.out(ram_out[71]));
    register ram72 (.in(in),.set(set & ram_row[4] & ram_col[8]),.en(en & ram_row[4] & ram_col[8]),.out(ram_out[72]));
    register ram73 (.in(in),.set(set & ram_row[4] & ram_col[9]),.en(en & ram_row[4] & ram_col[9]),.out(ram_out[73]));
    register ram74 (.in(in),.set(set & ram_row[4] & ram_col[10]),.en(en & ram_row[4] & ram_col[10]),.out(ram_out[74]));
    register ram75 (.in(in),.set(set & ram_row[4] & ram_col[11]),.en(en & ram_row[4] & ram_col[11]),.out(ram_out[75]));
    register ram76 (.in(in),.set(set & ram_row[4] & ram_col[12]),.en(en & ram_row[4] & ram_col[12]),.out(ram_out[76]));
    register ram77 (.in(in),.set(set & ram_row[4] & ram_col[13]),.en(en & ram_row[4] & ram_col[13]),.out(ram_out[77]));
    register ram78 (.in(in),.set(set & ram_row[4] & ram_col[14]),.en(en & ram_row[4] & ram_col[14]),.out(ram_out[78]));
    register ram79 (.in(in),.set(set & ram_row[4] & ram_col[15]),.en(en & ram_row[4] & ram_col[15]),.out(ram_out[79]));
    register ram80 (.in(in),.set(set & ram_row[5] & ram_col[0]),.en(en & ram_row[5] & ram_col[0]),.out(ram_out[80]));
    register ram81 (.in(in),.set(set & ram_row[5] & ram_col[1]),.en(en & ram_row[5] & ram_col[1]),.out(ram_out[81]));
    register ram82 (.in(in),.set(set & ram_row[5] & ram_col[2]),.en(en & ram_row[5] & ram_col[2]),.out(ram_out[82]));
    register ram83 (.in(in),.set(set & ram_row[5] & ram_col[3]),.en(en & ram_row[5] & ram_col[3]),.out(ram_out[83]));
    register ram84 (.in(in),.set(set & ram_row[5] & ram_col[4]),.en(en & ram_row[5] & ram_col[4]),.out(ram_out[84]));
    register ram85 (.in(in),.set(set & ram_row[5] & ram_col[5]),.en(en & ram_row[5] & ram_col[5]),.out(ram_out[85]));
    register ram86 (.in(in),.set(set & ram_row[5] & ram_col[6]),.en(en & ram_row[5] & ram_col[6]),.out(ram_out[86]));
    register ram87 (.in(in),.set(set & ram_row[5] & ram_col[7]),.en(en & ram_row[5] & ram_col[7]),.out(ram_out[87]));
    register ram88 (.in(in),.set(set & ram_row[5] & ram_col[8]),.en(en & ram_row[5] & ram_col[8]),.out(ram_out[88]));
    register ram89 (.in(in),.set(set & ram_row[5] & ram_col[9]),.en(en & ram_row[5] & ram_col[9]),.out(ram_out[89]));
    register ram90 (.in(in),.set(set & ram_row[5] & ram_col[10]),.en(en & ram_row[5] & ram_col[10]),.out(ram_out[90]));
    register ram91 (.in(in),.set(set & ram_row[5] & ram_col[11]),.en(en & ram_row[5] & ram_col[11]),.out(ram_out[91]));
    register ram92 (.in(in),.set(set & ram_row[5] & ram_col[12]),.en(en & ram_row[5] & ram_col[12]),.out(ram_out[92]));
    register ram93 (.in(in),.set(set & ram_row[5] & ram_col[13]),.en(en & ram_row[5] & ram_col[13]),.out(ram_out[93]));
    register ram94 (.in(in),.set(set & ram_row[5] & ram_col[14]),.en(en & ram_row[5] & ram_col[14]),.out(ram_out[94]));
    register ram95 (.in(in),.set(set & ram_row[5] & ram_col[15]),.en(en & ram_row[5] & ram_col[15]),.out(ram_out[95]));
    register ram96 (.in(in),.set(set & ram_row[6] & ram_col[0]),.en(en & ram_row[6] & ram_col[0]),.out(ram_out[96]));
    register ram97 (.in(in),.set(set & ram_row[6] & ram_col[1]),.en(en & ram_row[6] & ram_col[1]),.out(ram_out[97]));
    register ram98 (.in(in),.set(set & ram_row[6] & ram_col[2]),.en(en & ram_row[6] & ram_col[2]),.out(ram_out[98]));
    register ram99 (.in(in),.set(set & ram_row[6] & ram_col[3]),.en(en & ram_row[6] & ram_col[3]),.out(ram_out[99]));
    register ram100 (.in(in),.set(set & ram_row[6] & ram_col[4]),.en(en & ram_row[6] & ram_col[4]),.out(ram_out[100]));
    register ram101 (.in(in),.set(set & ram_row[6] & ram_col[5]),.en(en & ram_row[6] & ram_col[5]),.out(ram_out[101]));
    register ram102 (.in(in),.set(set & ram_row[6] & ram_col[6]),.en(en & ram_row[6] & ram_col[6]),.out(ram_out[102]));
    register ram103 (.in(in),.set(set & ram_row[6] & ram_col[7]),.en(en & ram_row[6] & ram_col[7]),.out(ram_out[103]));
    register ram104 (.in(in),.set(set & ram_row[6] & ram_col[8]),.en(en & ram_row[6] & ram_col[8]),.out(ram_out[104]));
    register ram105 (.in(in),.set(set & ram_row[6] & ram_col[9]),.en(en & ram_row[6] & ram_col[9]),.out(ram_out[105]));
    register ram106 (.in(in),.set(set & ram_row[6] & ram_col[10]),.en(en & ram_row[6] & ram_col[10]),.out(ram_out[106]));
    register ram107 (.in(in),.set(set & ram_row[6] & ram_col[11]),.en(en & ram_row[6] & ram_col[11]),.out(ram_out[107]));
    register ram108 (.in(in),.set(set & ram_row[6] & ram_col[12]),.en(en & ram_row[6] & ram_col[12]),.out(ram_out[108]));
    register ram109 (.in(in),.set(set & ram_row[6] & ram_col[13]),.en(en & ram_row[6] & ram_col[13]),.out(ram_out[109]));
    register ram110 (.in(in),.set(set & ram_row[6] & ram_col[14]),.en(en & ram_row[6] & ram_col[14]),.out(ram_out[110]));
    register ram111 (.in(in),.set(set & ram_row[6] & ram_col[15]),.en(en & ram_row[6] & ram_col[15]),.out(ram_out[111]));
    register ram112 (.in(in),.set(set & ram_row[7] & ram_col[0]),.en(en & ram_row[7] & ram_col[0]),.out(ram_out[112]));
    register ram113 (.in(in),.set(set & ram_row[7] & ram_col[1]),.en(en & ram_row[7] & ram_col[1]),.out(ram_out[113]));
    register ram114 (.in(in),.set(set & ram_row[7] & ram_col[2]),.en(en & ram_row[7] & ram_col[2]),.out(ram_out[114]));
    register ram115 (.in(in),.set(set & ram_row[7] & ram_col[3]),.en(en & ram_row[7] & ram_col[3]),.out(ram_out[115]));
    register ram116 (.in(in),.set(set & ram_row[7] & ram_col[4]),.en(en & ram_row[7] & ram_col[4]),.out(ram_out[116]));
    register ram117 (.in(in),.set(set & ram_row[7] & ram_col[5]),.en(en & ram_row[7] & ram_col[5]),.out(ram_out[117]));
    register ram118 (.in(in),.set(set & ram_row[7] & ram_col[6]),.en(en & ram_row[7] & ram_col[6]),.out(ram_out[118]));
    register ram119 (.in(in),.set(set & ram_row[7] & ram_col[7]),.en(en & ram_row[7] & ram_col[7]),.out(ram_out[119]));
    register ram120 (.in(in),.set(set & ram_row[7] & ram_col[8]),.en(en & ram_row[7] & ram_col[8]),.out(ram_out[120]));
    register ram121 (.in(in),.set(set & ram_row[7] & ram_col[9]),.en(en & ram_row[7] & ram_col[9]),.out(ram_out[121]));
    register ram122 (.in(in),.set(set & ram_row[7] & ram_col[10]),.en(en & ram_row[7] & ram_col[10]),.out(ram_out[122]));
    register ram123 (.in(in),.set(set & ram_row[7] & ram_col[11]),.en(en & ram_row[7] & ram_col[11]),.out(ram_out[123]));
    register ram124 (.in(in),.set(set & ram_row[7] & ram_col[12]),.en(en & ram_row[7] & ram_col[12]),.out(ram_out[124]));
    register ram125 (.in(in),.set(set & ram_row[7] & ram_col[13]),.en(en & ram_row[7] & ram_col[13]),.out(ram_out[125]));
    register ram126 (.in(in),.set(set & ram_row[7] & ram_col[14]),.en(en & ram_row[7] & ram_col[14]),.out(ram_out[126]));
    register ram127 (.in(in),.set(set & ram_row[7] & ram_col[15]),.en(en & ram_row[7] & ram_col[15]),.out(ram_out[127]));
    register ram128 (.in(in),.set(set & ram_row[8] & ram_col[0]),.en(en & ram_row[8] & ram_col[0]),.out(ram_out[128]));
    register ram129 (.in(in),.set(set & ram_row[8] & ram_col[1]),.en(en & ram_row[8] & ram_col[1]),.out(ram_out[129]));
    register ram130 (.in(in),.set(set & ram_row[8] & ram_col[2]),.en(en & ram_row[8] & ram_col[2]),.out(ram_out[130]));
    register ram131 (.in(in),.set(set & ram_row[8] & ram_col[3]),.en(en & ram_row[8] & ram_col[3]),.out(ram_out[131]));
    register ram132 (.in(in),.set(set & ram_row[8] & ram_col[4]),.en(en & ram_row[8] & ram_col[4]),.out(ram_out[132]));
    register ram133 (.in(in),.set(set & ram_row[8] & ram_col[5]),.en(en & ram_row[8] & ram_col[5]),.out(ram_out[133]));
    register ram134 (.in(in),.set(set & ram_row[8] & ram_col[6]),.en(en & ram_row[8] & ram_col[6]),.out(ram_out[134]));
    register ram135 (.in(in),.set(set & ram_row[8] & ram_col[7]),.en(en & ram_row[8] & ram_col[7]),.out(ram_out[135]));
    register ram136 (.in(in),.set(set & ram_row[8] & ram_col[8]),.en(en & ram_row[8] & ram_col[8]),.out(ram_out[136]));
    register ram137 (.in(in),.set(set & ram_row[8] & ram_col[9]),.en(en & ram_row[8] & ram_col[9]),.out(ram_out[137]));
    register ram138 (.in(in),.set(set & ram_row[8] & ram_col[10]),.en(en & ram_row[8] & ram_col[10]),.out(ram_out[138]));
    register ram139 (.in(in),.set(set & ram_row[8] & ram_col[11]),.en(en & ram_row[8] & ram_col[11]),.out(ram_out[139]));
    register ram140 (.in(in),.set(set & ram_row[8] & ram_col[12]),.en(en & ram_row[8] & ram_col[12]),.out(ram_out[140]));
    register ram141 (.in(in),.set(set & ram_row[8] & ram_col[13]),.en(en & ram_row[8] & ram_col[13]),.out(ram_out[141]));
    register ram142 (.in(in),.set(set & ram_row[8] & ram_col[14]),.en(en & ram_row[8] & ram_col[14]),.out(ram_out[142]));
    register ram143 (.in(in),.set(set & ram_row[8] & ram_col[15]),.en(en & ram_row[8] & ram_col[15]),.out(ram_out[143]));
    register ram144 (.in(in),.set(set & ram_row[9] & ram_col[0]),.en(en & ram_row[9] & ram_col[0]),.out(ram_out[144]));
    register ram145 (.in(in),.set(set & ram_row[9] & ram_col[1]),.en(en & ram_row[9] & ram_col[1]),.out(ram_out[145]));
    register ram146 (.in(in),.set(set & ram_row[9] & ram_col[2]),.en(en & ram_row[9] & ram_col[2]),.out(ram_out[146]));
    register ram147 (.in(in),.set(set & ram_row[9] & ram_col[3]),.en(en & ram_row[9] & ram_col[3]),.out(ram_out[147]));
    register ram148 (.in(in),.set(set & ram_row[9] & ram_col[4]),.en(en & ram_row[9] & ram_col[4]),.out(ram_out[148]));
    register ram149 (.in(in),.set(set & ram_row[9] & ram_col[5]),.en(en & ram_row[9] & ram_col[5]),.out(ram_out[149]));
    register ram150 (.in(in),.set(set & ram_row[9] & ram_col[6]),.en(en & ram_row[9] & ram_col[6]),.out(ram_out[150]));
    register ram151 (.in(in),.set(set & ram_row[9] & ram_col[7]),.en(en & ram_row[9] & ram_col[7]),.out(ram_out[151]));
    register ram152 (.in(in),.set(set & ram_row[9] & ram_col[8]),.en(en & ram_row[9] & ram_col[8]),.out(ram_out[152]));
    register ram153 (.in(in),.set(set & ram_row[9] & ram_col[9]),.en(en & ram_row[9] & ram_col[9]),.out(ram_out[153]));
    register ram154 (.in(in),.set(set & ram_row[9] & ram_col[10]),.en(en & ram_row[9] & ram_col[10]),.out(ram_out[154]));
    register ram155 (.in(in),.set(set & ram_row[9] & ram_col[11]),.en(en & ram_row[9] & ram_col[11]),.out(ram_out[155]));
    register ram156 (.in(in),.set(set & ram_row[9] & ram_col[12]),.en(en & ram_row[9] & ram_col[12]),.out(ram_out[156]));
    register ram157 (.in(in),.set(set & ram_row[9] & ram_col[13]),.en(en & ram_row[9] & ram_col[13]),.out(ram_out[157]));
    register ram158 (.in(in),.set(set & ram_row[9] & ram_col[14]),.en(en & ram_row[9] & ram_col[14]),.out(ram_out[158]));
    register ram159 (.in(in),.set(set & ram_row[9] & ram_col[15]),.en(en & ram_row[9] & ram_col[15]),.out(ram_out[159]));
    register ram160 (.in(in),.set(set & ram_row[10] & ram_col[0]),.en(en & ram_row[10] & ram_col[0]),.out(ram_out[160]));
    register ram161 (.in(in),.set(set & ram_row[10] & ram_col[1]),.en(en & ram_row[10] & ram_col[1]),.out(ram_out[161]));
    register ram162 (.in(in),.set(set & ram_row[10] & ram_col[2]),.en(en & ram_row[10] & ram_col[2]),.out(ram_out[162]));
    register ram163 (.in(in),.set(set & ram_row[10] & ram_col[3]),.en(en & ram_row[10] & ram_col[3]),.out(ram_out[163]));
    register ram164 (.in(in),.set(set & ram_row[10] & ram_col[4]),.en(en & ram_row[10] & ram_col[4]),.out(ram_out[164]));
    register ram165 (.in(in),.set(set & ram_row[10] & ram_col[5]),.en(en & ram_row[10] & ram_col[5]),.out(ram_out[165]));
    register ram166 (.in(in),.set(set & ram_row[10] & ram_col[6]),.en(en & ram_row[10] & ram_col[6]),.out(ram_out[166]));
    register ram167 (.in(in),.set(set & ram_row[10] & ram_col[7]),.en(en & ram_row[10] & ram_col[7]),.out(ram_out[167]));
    register ram168 (.in(in),.set(set & ram_row[10] & ram_col[8]),.en(en & ram_row[10] & ram_col[8]),.out(ram_out[168]));
    register ram169 (.in(in),.set(set & ram_row[10] & ram_col[9]),.en(en & ram_row[10] & ram_col[9]),.out(ram_out[169]));
    register ram170 (.in(in),.set(set & ram_row[10] & ram_col[10]),.en(en & ram_row[10] & ram_col[10]),.out(ram_out[170]));
    register ram171 (.in(in),.set(set & ram_row[10] & ram_col[11]),.en(en & ram_row[10] & ram_col[11]),.out(ram_out[171]));
    register ram172 (.in(in),.set(set & ram_row[10] & ram_col[12]),.en(en & ram_row[10] & ram_col[12]),.out(ram_out[172]));
    register ram173 (.in(in),.set(set & ram_row[10] & ram_col[13]),.en(en & ram_row[10] & ram_col[13]),.out(ram_out[173]));
    register ram174 (.in(in),.set(set & ram_row[10] & ram_col[14]),.en(en & ram_row[10] & ram_col[14]),.out(ram_out[174]));
    register ram175 (.in(in),.set(set & ram_row[10] & ram_col[15]),.en(en & ram_row[10] & ram_col[15]),.out(ram_out[175]));
    register ram176 (.in(in),.set(set & ram_row[11] & ram_col[0]),.en(en & ram_row[11] & ram_col[0]),.out(ram_out[176]));
    register ram177 (.in(in),.set(set & ram_row[11] & ram_col[1]),.en(en & ram_row[11] & ram_col[1]),.out(ram_out[177]));
    register ram178 (.in(in),.set(set & ram_row[11] & ram_col[2]),.en(en & ram_row[11] & ram_col[2]),.out(ram_out[178]));
    register ram179 (.in(in),.set(set & ram_row[11] & ram_col[3]),.en(en & ram_row[11] & ram_col[3]),.out(ram_out[179]));
    register ram180 (.in(in),.set(set & ram_row[11] & ram_col[4]),.en(en & ram_row[11] & ram_col[4]),.out(ram_out[180]));
    register ram181 (.in(in),.set(set & ram_row[11] & ram_col[5]),.en(en & ram_row[11] & ram_col[5]),.out(ram_out[181]));
    register ram182 (.in(in),.set(set & ram_row[11] & ram_col[6]),.en(en & ram_row[11] & ram_col[6]),.out(ram_out[182]));
    register ram183 (.in(in),.set(set & ram_row[11] & ram_col[7]),.en(en & ram_row[11] & ram_col[7]),.out(ram_out[183]));
    register ram184 (.in(in),.set(set & ram_row[11] & ram_col[8]),.en(en & ram_row[11] & ram_col[8]),.out(ram_out[184]));
    register ram185 (.in(in),.set(set & ram_row[11] & ram_col[9]),.en(en & ram_row[11] & ram_col[9]),.out(ram_out[185]));
    register ram186 (.in(in),.set(set & ram_row[11] & ram_col[10]),.en(en & ram_row[11] & ram_col[10]),.out(ram_out[186]));
    register ram187 (.in(in),.set(set & ram_row[11] & ram_col[11]),.en(en & ram_row[11] & ram_col[11]),.out(ram_out[187]));
    register ram188 (.in(in),.set(set & ram_row[11] & ram_col[12]),.en(en & ram_row[11] & ram_col[12]),.out(ram_out[188]));
    register ram189 (.in(in),.set(set & ram_row[11] & ram_col[13]),.en(en & ram_row[11] & ram_col[13]),.out(ram_out[189]));
    register ram190 (.in(in),.set(set & ram_row[11] & ram_col[14]),.en(en & ram_row[11] & ram_col[14]),.out(ram_out[190]));
    register ram191 (.in(in),.set(set & ram_row[11] & ram_col[15]),.en(en & ram_row[11] & ram_col[15]),.out(ram_out[191]));
    register ram192 (.in(in),.set(set & ram_row[12] & ram_col[0]),.en(en & ram_row[12] & ram_col[0]),.out(ram_out[192]));
    register ram193 (.in(in),.set(set & ram_row[12] & ram_col[1]),.en(en & ram_row[12] & ram_col[1]),.out(ram_out[193]));
    register ram194 (.in(in),.set(set & ram_row[12] & ram_col[2]),.en(en & ram_row[12] & ram_col[2]),.out(ram_out[194]));
    register ram195 (.in(in),.set(set & ram_row[12] & ram_col[3]),.en(en & ram_row[12] & ram_col[3]),.out(ram_out[195]));
    register ram196 (.in(in),.set(set & ram_row[12] & ram_col[4]),.en(en & ram_row[12] & ram_col[4]),.out(ram_out[196]));
    register ram197 (.in(in),.set(set & ram_row[12] & ram_col[5]),.en(en & ram_row[12] & ram_col[5]),.out(ram_out[197]));
    register ram198 (.in(in),.set(set & ram_row[12] & ram_col[6]),.en(en & ram_row[12] & ram_col[6]),.out(ram_out[198]));
    register ram199 (.in(in),.set(set & ram_row[12] & ram_col[7]),.en(en & ram_row[12] & ram_col[7]),.out(ram_out[199]));
    register ram200 (.in(in),.set(set & ram_row[12] & ram_col[8]),.en(en & ram_row[12] & ram_col[8]),.out(ram_out[200]));
    register ram201 (.in(in),.set(set & ram_row[12] & ram_col[9]),.en(en & ram_row[12] & ram_col[9]),.out(ram_out[201]));
    register ram202 (.in(in),.set(set & ram_row[12] & ram_col[10]),.en(en & ram_row[12] & ram_col[10]),.out(ram_out[202]));
    register ram203 (.in(in),.set(set & ram_row[12] & ram_col[11]),.en(en & ram_row[12] & ram_col[11]),.out(ram_out[203]));
    register ram204 (.in(in),.set(set & ram_row[12] & ram_col[12]),.en(en & ram_row[12] & ram_col[12]),.out(ram_out[204]));
    register ram205 (.in(in),.set(set & ram_row[12] & ram_col[13]),.en(en & ram_row[12] & ram_col[13]),.out(ram_out[205]));
    register ram206 (.in(in),.set(set & ram_row[12] & ram_col[14]),.en(en & ram_row[12] & ram_col[14]),.out(ram_out[206]));
    register ram207 (.in(in),.set(set & ram_row[12] & ram_col[15]),.en(en & ram_row[12] & ram_col[15]),.out(ram_out[207]));
    register ram208 (.in(in),.set(set & ram_row[13] & ram_col[0]),.en(en & ram_row[13] & ram_col[0]),.out(ram_out[208]));
    register ram209 (.in(in),.set(set & ram_row[13] & ram_col[1]),.en(en & ram_row[13] & ram_col[1]),.out(ram_out[209]));
    register ram210 (.in(in),.set(set & ram_row[13] & ram_col[2]),.en(en & ram_row[13] & ram_col[2]),.out(ram_out[210]));
    register ram211 (.in(in),.set(set & ram_row[13] & ram_col[3]),.en(en & ram_row[13] & ram_col[3]),.out(ram_out[211]));
    register ram212 (.in(in),.set(set & ram_row[13] & ram_col[4]),.en(en & ram_row[13] & ram_col[4]),.out(ram_out[212]));
    register ram213 (.in(in),.set(set & ram_row[13] & ram_col[5]),.en(en & ram_row[13] & ram_col[5]),.out(ram_out[213]));
    register ram214 (.in(in),.set(set & ram_row[13] & ram_col[6]),.en(en & ram_row[13] & ram_col[6]),.out(ram_out[214]));
    register ram215 (.in(in),.set(set & ram_row[13] & ram_col[7]),.en(en & ram_row[13] & ram_col[7]),.out(ram_out[215]));
    register ram216 (.in(in),.set(set & ram_row[13] & ram_col[8]),.en(en & ram_row[13] & ram_col[8]),.out(ram_out[216]));
    register ram217 (.in(in),.set(set & ram_row[13] & ram_col[9]),.en(en & ram_row[13] & ram_col[9]),.out(ram_out[217]));
    register ram218 (.in(in),.set(set & ram_row[13] & ram_col[10]),.en(en & ram_row[13] & ram_col[10]),.out(ram_out[218]));
    register ram219 (.in(in),.set(set & ram_row[13] & ram_col[11]),.en(en & ram_row[13] & ram_col[11]),.out(ram_out[219]));
    register ram220 (.in(in),.set(set & ram_row[13] & ram_col[12]),.en(en & ram_row[13] & ram_col[12]),.out(ram_out[220]));
    register ram221 (.in(in),.set(set & ram_row[13] & ram_col[13]),.en(en & ram_row[13] & ram_col[13]),.out(ram_out[221]));
    register ram222 (.in(in),.set(set & ram_row[13] & ram_col[14]),.en(en & ram_row[13] & ram_col[14]),.out(ram_out[222]));
    register ram223 (.in(in),.set(set & ram_row[13] & ram_col[15]),.en(en & ram_row[13] & ram_col[15]),.out(ram_out[223]));
    register ram224 (.in(in),.set(set & ram_row[14] & ram_col[0]),.en(en & ram_row[14] & ram_col[0]),.out(ram_out[224]));
    register ram225 (.in(in),.set(set & ram_row[14] & ram_col[1]),.en(en & ram_row[14] & ram_col[1]),.out(ram_out[225]));
    register ram226 (.in(in),.set(set & ram_row[14] & ram_col[2]),.en(en & ram_row[14] & ram_col[2]),.out(ram_out[226]));
    register ram227 (.in(in),.set(set & ram_row[14] & ram_col[3]),.en(en & ram_row[14] & ram_col[3]),.out(ram_out[227]));
    register ram228 (.in(in),.set(set & ram_row[14] & ram_col[4]),.en(en & ram_row[14] & ram_col[4]),.out(ram_out[228]));
    register ram229 (.in(in),.set(set & ram_row[14] & ram_col[5]),.en(en & ram_row[14] & ram_col[5]),.out(ram_out[229]));
    register ram230 (.in(in),.set(set & ram_row[14] & ram_col[6]),.en(en & ram_row[14] & ram_col[6]),.out(ram_out[230]));
    register ram231 (.in(in),.set(set & ram_row[14] & ram_col[7]),.en(en & ram_row[14] & ram_col[7]),.out(ram_out[231]));
    register ram232 (.in(in),.set(set & ram_row[14] & ram_col[8]),.en(en & ram_row[14] & ram_col[8]),.out(ram_out[232]));
    register ram233 (.in(in),.set(set & ram_row[14] & ram_col[9]),.en(en & ram_row[14] & ram_col[9]),.out(ram_out[233]));
    register ram234 (.in(in),.set(set & ram_row[14] & ram_col[10]),.en(en & ram_row[14] & ram_col[10]),.out(ram_out[234]));
    register ram235 (.in(in),.set(set & ram_row[14] & ram_col[11]),.en(en & ram_row[14] & ram_col[11]),.out(ram_out[235]));
    register ram236 (.in(in),.set(set & ram_row[14] & ram_col[12]),.en(en & ram_row[14] & ram_col[12]),.out(ram_out[236]));
    register ram237 (.in(in),.set(set & ram_row[14] & ram_col[13]),.en(en & ram_row[14] & ram_col[13]),.out(ram_out[237]));
    register ram238 (.in(in),.set(set & ram_row[14] & ram_col[14]),.en(en & ram_row[14] & ram_col[14]),.out(ram_out[238]));
    register ram239 (.in(in),.set(set & ram_row[14] & ram_col[15]),.en(en & ram_row[14] & ram_col[15]),.out(ram_out[239]));
    register ram240 (.in(in),.set(set & ram_row[15] & ram_col[0]),.en(en & ram_row[15] & ram_col[0]),.out(ram_out[240]));
    register ram241 (.in(in),.set(set & ram_row[15] & ram_col[1]),.en(en & ram_row[15] & ram_col[1]),.out(ram_out[241]));
    register ram242 (.in(in),.set(set & ram_row[15] & ram_col[2]),.en(en & ram_row[15] & ram_col[2]),.out(ram_out[242]));
    register ram243 (.in(in),.set(set & ram_row[15] & ram_col[3]),.en(en & ram_row[15] & ram_col[3]),.out(ram_out[243]));
    register ram244 (.in(in),.set(set & ram_row[15] & ram_col[4]),.en(en & ram_row[15] & ram_col[4]),.out(ram_out[244]));
    register ram245 (.in(in),.set(set & ram_row[15] & ram_col[5]),.en(en & ram_row[15] & ram_col[5]),.out(ram_out[245]));
    register ram246 (.in(in),.set(set & ram_row[15] & ram_col[6]),.en(en & ram_row[15] & ram_col[6]),.out(ram_out[246]));
    register ram247 (.in(in),.set(set & ram_row[15] & ram_col[7]),.en(en & ram_row[15] & ram_col[7]),.out(ram_out[247]));
    register ram248 (.in(in),.set(set & ram_row[15] & ram_col[8]),.en(en & ram_row[15] & ram_col[8]),.out(ram_out[248]));
    register ram249 (.in(in),.set(set & ram_row[15] & ram_col[9]),.en(en & ram_row[15] & ram_col[9]),.out(ram_out[249]));
    register ram250 (.in(in),.set(set & ram_row[15] & ram_col[10]),.en(en & ram_row[15] & ram_col[10]),.out(ram_out[250]));
    register ram251 (.in(in),.set(set & ram_row[15] & ram_col[11]),.en(en & ram_row[15] & ram_col[11]),.out(ram_out[251]));
    register ram252 (.in(in),.set(set & ram_row[15] & ram_col[12]),.en(en & ram_row[15] & ram_col[12]),.out(ram_out[252]));
    register ram253 (.in(in),.set(set & ram_row[15] & ram_col[13]),.en(en & ram_row[15] & ram_col[13]),.out(ram_out[253]));
    register ram254 (.in(in),.set(set & ram_row[15] & ram_col[14]),.en(en & ram_row[15] & ram_col[14]),.out(ram_out[254]));
    register ram255 (.in(in),.set(set & ram_row[15] & ram_col[15]),.en(en & ram_row[15] & ram_col[15]),.out(ram_out[255]));


 
 
endmodule


module mar_decoder(
    input[3:0] in,
    output[15:0] out
);
    wire [3:0] not_in;
    not(not_in[0], in[0]);
    not(not_in[1], in[1]);
    not(not_in[2], in[2]);
    not(not_in[3], in[3]);
    
    and a0(out[0], not_in[0], not_in[1], not_in[2], not_in[3]);
    and a1(out[1], in[0], not_in[1], not_in[2], not_in[3]);
    and a2(out[2], not_in[0], in[1], not_in[2], not_in[3]);
    and a3(out[3], in[0], in[1], not_in[2], not_in[3]);
    and a4(out[4], not_in[0], not_in[1], in[2], not_in[3]);
    and a5(out[5], in[0], not_in[1], in[2], not_in[3]);
    and a6(out[6], not_in[0], in[1], in[2], not_in[3]);
    and a7(out[7], in[0], in[1], in[2], not_in[3]);
    
    and a8(out[8], not_in[0], not_in[1], not_in[2], in[3]);
    and a9(out[9], in[0], not_in[1], not_in[2], in[3]);
    and a10(out[10], not_in[0], in[1], not_in[2], in[3]);
    and a11(out[11], in[0], in[1], not_in[2], in[3]);
    and a12(out[12], not_in[0], not_in[1], in[2], in[3]);
    and a13(out[13], in[0], not_in[1], in[2], in[3]);
    and a14(out[14], not_in[0], in[1], in[2], in[3]);
    and a15(out[15], in[0], in[1], in[2], in[3]);
    

//always @(in)
//begin
//    out <= 16'b0000_0000_0000_0000;
//    case(in)
//        4'b0000: out[0] = 1'b1;
//        4'b0001: out[1] = 1'b1;
//        4'b0010: out[2] = 1'b1;
//        4'b0011: out[3] = 1'b1;
//        4'b0100: out[4] = 1'b1;
//        4'b0101: out[5] = 1'b1;
//        4'b0110: out[6] = 1'b1;
//        4'b0111: out[7] = 1'b1;
//        4'b1000: out[8] = 1'b1;
//        4'b1001: out[9] = 1'b1;
//        4'b1010: out[10] = 1'b1;
//        4'b1011: out[11] = 1'b1;
//        4'b1100: out[12] = 1'b1;
//        4'b1101: out[13] = 1'b1;
//        4'b1110: out[14] = 1'b1;
//        4'b1111: out[15] = 1'b1;
//    endcase
// end

endmodule
