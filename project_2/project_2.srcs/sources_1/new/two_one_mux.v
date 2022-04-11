`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 11:11:23 AM
// Design Name: 
// Module Name: two_one_mux
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


module two_one_mux(
    output o,
    input s,
    input a,
    input b
    );
    
    //trivial decoder   
    wire w1, w2, not_s; 
    not G1(not_s, s);

    or G2(o, w1, w2);
    and G3(w1, a, s);
    and G4(w2, b, not_s);   
    
endmodule
