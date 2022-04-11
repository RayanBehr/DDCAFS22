`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 10:28:15 AM
// Design Name: 
// Module Name: two_input_decoder
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


module two_input_decoder(
    input a,
    input b,
    output [3:0] s 
    );
    
    and G1(s[3], a, b);
    nor G2(s[0], a, b);
    wire w;
    xor G3(w, a, b);
    and G4(s[1], w, b);
    and G5(s[2], w, a);
    
endmodule
