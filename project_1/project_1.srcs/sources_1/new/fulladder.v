`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 10:45:48 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input a, input b, input ci, 
    output s, output co
    );
    // & and  // ~ not  // | or
    // assign s  = (a ^ b) ^ ci;
    // assign co = (a & b) | (b & ci) | (ci & a);
    
    wire w1,w2,w3,w4;
    and(w1,b,a);
    not(w2,w1);
    or(w3,b,a);
    and(w4,w2,w3);    
    xor(s, w4, ci);   
    
    wire w5,w6,w7;
    and(w5, a, b);
    and(w6, b, ci);
    and(w7, ci, a);
    or(co, w5, w6, w7);
    
    
endmodule
