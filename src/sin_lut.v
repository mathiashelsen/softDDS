module sin_lut( clk, addr, data );

parameter INPUT_WIDTH	= 8;
parameter OUTPUT_WIDTH	= 8;

input                           clk;
input   [INPUT_WIDTH-1 : 0]     addr;
output reg     [OUTPUT_WIDTH-1 : 0]    data;
reg     [OUTPUT_WIDTH-1 : 0]    lut [2**INPUT_WIDTH-1 : 0];

initial begin

	lut[0]		=	8'b0;
	lut[1]		=	8'b10;
	lut[2]		=	8'b11;
	lut[3]		=	8'b101;
	lut[4]		=	8'b110;
	lut[5]		=	8'b1000;
	lut[6]		=	8'b1001;
	lut[7]		=	8'b1011;
	lut[8]		=	8'b1101;
	lut[9]		=	8'b1110;
	lut[10]		=	8'b10000;
	lut[11]		=	8'b10001;
	lut[12]		=	8'b10011;
	lut[13]		=	8'b10100;
	lut[14]		=	8'b10110;
	lut[15]		=	8'b10111;
	lut[16]		=	8'b11001;
	lut[17]		=	8'b11011;
	lut[18]		=	8'b11100;
	lut[19]		=	8'b11110;
	lut[20]		=	8'b11111;
	lut[21]		=	8'b100001;
	lut[22]		=	8'b100010;
	lut[23]		=	8'b100100;
	lut[24]		=	8'b100101;
	lut[25]		=	8'b100111;
	lut[26]		=	8'b101001;
	lut[27]		=	8'b101010;
	lut[28]		=	8'b101100;
	lut[29]		=	8'b101101;
	lut[30]		=	8'b101111;
	lut[31]		=	8'b110000;
	lut[32]		=	8'b110010;
	lut[33]		=	8'b110011;
	lut[34]		=	8'b110101;
	lut[35]		=	8'b110110;
	lut[36]		=	8'b111000;
	lut[37]		=	8'b111001;
	lut[38]		=	8'b111011;
	lut[39]		=	8'b111100;
	lut[40]		=	8'b111110;
	lut[41]		=	8'b111111;
	lut[42]		=	8'b1000001;
	lut[43]		=	8'b1000011;
	lut[44]		=	8'b1000100;
	lut[45]		=	8'b1000110;
	lut[46]		=	8'b1000111;
	lut[47]		=	8'b1001001;
	lut[48]		=	8'b1001010;
	lut[49]		=	8'b1001100;
	lut[50]		=	8'b1001101;
	lut[51]		=	8'b1001111;
	lut[52]		=	8'b1010000;
	lut[53]		=	8'b1010001;
	lut[54]		=	8'b1010011;
	lut[55]		=	8'b1010100;
	lut[56]		=	8'b1010110;
	lut[57]		=	8'b1010111;
	lut[58]		=	8'b1011001;
	lut[59]		=	8'b1011010;
	lut[60]		=	8'b1011100;
	lut[61]		=	8'b1011101;
	lut[62]		=	8'b1011111;
	lut[63]		=	8'b1100000;
	lut[64]		=	8'b1100010;
	lut[65]		=	8'b1100011;
	lut[66]		=	8'b1100100;
	lut[67]		=	8'b1100110;
	lut[68]		=	8'b1100111;
	lut[69]		=	8'b1101001;
	lut[70]		=	8'b1101010;
	lut[71]		=	8'b1101100;
	lut[72]		=	8'b1101101;
	lut[73]		=	8'b1101110;
	lut[74]		=	8'b1110000;
	lut[75]		=	8'b1110001;
	lut[76]		=	8'b1110011;
	lut[77]		=	8'b1110100;
	lut[78]		=	8'b1110101;
	lut[79]		=	8'b1110111;
	lut[80]		=	8'b1111000;
	lut[81]		=	8'b1111010;
	lut[82]		=	8'b1111011;
	lut[83]		=	8'b1111100;
	lut[84]		=	8'b1111110;
	lut[85]		=	8'b1111111;
	lut[86]		=	8'b10000000;
	lut[87]		=	8'b10000010;
	lut[88]		=	8'b10000011;
	lut[89]		=	8'b10000100;
	lut[90]		=	8'b10000110;
	lut[91]		=	8'b10000111;
	lut[92]		=	8'b10001000;
	lut[93]		=	8'b10001010;
	lut[94]		=	8'b10001011;
	lut[95]		=	8'b10001100;
	lut[96]		=	8'b10001110;
	lut[97]		=	8'b10001111;
	lut[98]		=	8'b10010000;
	lut[99]		=	8'b10010010;
	lut[100]		=	8'b10010011;
	lut[101]		=	8'b10010100;
	lut[102]		=	8'b10010101;
	lut[103]		=	8'b10010111;
	lut[104]		=	8'b10011000;
	lut[105]		=	8'b10011001;
	lut[106]		=	8'b10011010;
	lut[107]		=	8'b10011100;
	lut[108]		=	8'b10011101;
	lut[109]		=	8'b10011110;
	lut[110]		=	8'b10011111;
	lut[111]		=	8'b10100001;
	lut[112]		=	8'b10100010;
	lut[113]		=	8'b10100011;
	lut[114]		=	8'b10100100;
	lut[115]		=	8'b10100101;
	lut[116]		=	8'b10100111;
	lut[117]		=	8'b10101000;
	lut[118]		=	8'b10101001;
	lut[119]		=	8'b10101010;
	lut[120]		=	8'b10101011;
	lut[121]		=	8'b10101100;
	lut[122]		=	8'b10101110;
	lut[123]		=	8'b10101111;
	lut[124]		=	8'b10110000;
	lut[125]		=	8'b10110001;
	lut[126]		=	8'b10110010;
	lut[127]		=	8'b10110011;
	lut[128]		=	8'b10110100;
	lut[129]		=	8'b10110101;
	lut[130]		=	8'b10110111;
	lut[131]		=	8'b10111000;
	lut[132]		=	8'b10111001;
	lut[133]		=	8'b10111010;
	lut[134]		=	8'b10111011;
	lut[135]		=	8'b10111100;
	lut[136]		=	8'b10111101;
	lut[137]		=	8'b10111110;
	lut[138]		=	8'b10111111;
	lut[139]		=	8'b11000000;
	lut[140]		=	8'b11000001;
	lut[141]		=	8'b11000010;
	lut[142]		=	8'b11000011;
	lut[143]		=	8'b11000100;
	lut[144]		=	8'b11000101;
	lut[145]		=	8'b11000110;
	lut[146]		=	8'b11000111;
	lut[147]		=	8'b11001000;
	lut[148]		=	8'b11001001;
	lut[149]		=	8'b11001010;
	lut[150]		=	8'b11001011;
	lut[151]		=	8'b11001100;
	lut[152]		=	8'b11001101;
	lut[153]		=	8'b11001110;
	lut[154]		=	8'b11001111;
	lut[155]		=	8'b11010000;
	lut[156]		=	8'b11010000;
	lut[157]		=	8'b11010001;
	lut[158]		=	8'b11010010;
	lut[159]		=	8'b11010011;
	lut[160]		=	8'b11010100;
	lut[161]		=	8'b11010101;
	lut[162]		=	8'b11010110;
	lut[163]		=	8'b11010111;
	lut[164]		=	8'b11010111;
	lut[165]		=	8'b11011000;
	lut[166]		=	8'b11011001;
	lut[167]		=	8'b11011010;
	lut[168]		=	8'b11011011;
	lut[169]		=	8'b11011100;
	lut[170]		=	8'b11011100;
	lut[171]		=	8'b11011101;
	lut[172]		=	8'b11011110;
	lut[173]		=	8'b11011111;
	lut[174]		=	8'b11011111;
	lut[175]		=	8'b11100000;
	lut[176]		=	8'b11100001;
	lut[177]		=	8'b11100010;
	lut[178]		=	8'b11100010;
	lut[179]		=	8'b11100011;
	lut[180]		=	8'b11100100;
	lut[181]		=	8'b11100100;
	lut[182]		=	8'b11100101;
	lut[183]		=	8'b11100110;
	lut[184]		=	8'b11100111;
	lut[185]		=	8'b11100111;
	lut[186]		=	8'b11101000;
	lut[187]		=	8'b11101000;
	lut[188]		=	8'b11101001;
	lut[189]		=	8'b11101010;
	lut[190]		=	8'b11101010;
	lut[191]		=	8'b11101011;
	lut[192]		=	8'b11101100;
	lut[193]		=	8'b11101100;
	lut[194]		=	8'b11101101;
	lut[195]		=	8'b11101101;
	lut[196]		=	8'b11101110;
	lut[197]		=	8'b11101110;
	lut[198]		=	8'b11101111;
	lut[199]		=	8'b11110000;
	lut[200]		=	8'b11110000;
	lut[201]		=	8'b11110001;
	lut[202]		=	8'b11110001;
	lut[203]		=	8'b11110010;
	lut[204]		=	8'b11110010;
	lut[205]		=	8'b11110011;
	lut[206]		=	8'b11110011;
	lut[207]		=	8'b11110100;
	lut[208]		=	8'b11110100;
	lut[209]		=	8'b11110100;
	lut[210]		=	8'b11110101;
	lut[211]		=	8'b11110101;
	lut[212]		=	8'b11110110;
	lut[213]		=	8'b11110110;
	lut[214]		=	8'b11110111;
	lut[215]		=	8'b11110111;
	lut[216]		=	8'b11110111;
	lut[217]		=	8'b11111000;
	lut[218]		=	8'b11111000;
	lut[219]		=	8'b11111000;
	lut[220]		=	8'b11111001;
	lut[221]		=	8'b11111001;
	lut[222]		=	8'b11111001;
	lut[223]		=	8'b11111010;
	lut[224]		=	8'b11111010;
	lut[225]		=	8'b11111010;
	lut[226]		=	8'b11111011;
	lut[227]		=	8'b11111011;
	lut[228]		=	8'b11111011;
	lut[229]		=	8'b11111100;
	lut[230]		=	8'b11111100;
	lut[231]		=	8'b11111100;
	lut[232]		=	8'b11111100;
	lut[233]		=	8'b11111100;
	lut[234]		=	8'b11111101;
	lut[235]		=	8'b11111101;
	lut[236]		=	8'b11111101;
	lut[237]		=	8'b11111101;
	lut[238]		=	8'b11111101;
	lut[239]		=	8'b11111110;
	lut[240]		=	8'b11111110;
	lut[241]		=	8'b11111110;
	lut[242]		=	8'b11111110;
	lut[243]		=	8'b11111110;
	lut[244]		=	8'b11111110;
	lut[245]		=	8'b11111110;
	lut[246]		=	8'b11111111;
	lut[247]		=	8'b11111111;
	lut[248]		=	8'b11111111;
	lut[249]		=	8'b11111111;
	lut[250]		=	8'b11111111;
	lut[251]		=	8'b11111111;
	lut[252]		=	8'b11111111;
	lut[253]		=	8'b11111111;
	lut[254]		=	8'b11111111;
	lut[255]		=	8'b11111111;
end

always @(posedge clk) begin
    data <= lut[addr];
end

endmodule