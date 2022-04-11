`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 11:23:32 AM
// Design Name: 
// Module Name: four_one_mux
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


module four_one_mux(
    input [1:0] s,
    input [3:0] i,
    output o
    );
    
    wire w1, w2;
    two_one_mux M1(w1, s[1], i[0], i[1]);
    two_one_mux M0(o, s[0], w1, w2);
    two_one_mux M2(w2, s[1], i[2], i[3]);
    
endmodule
