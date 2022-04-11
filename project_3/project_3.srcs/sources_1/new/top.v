`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2022 09:11:55 AM
// Design Name: 
// Module Name: top
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


module top(
    input [1:0] S,
    input [3:0] A,
    input [3:0] B,
    output [7:0] D,
    output [3:0] AN
    );
    
    wire [4:0] w1;
    wire [3:0] w2;
    four_bit_adder add1 (.a(A),.b(B),.s(w1));
    decoder dec1 (.D(D[6:0]),.S(w1[3:0]));
    
    two_input_decoder tid1 (.a(S[0]),.b(S[1]),.s(w2));
    assign AN = ~w2;
    
    assign D[7] = w1[4];
    
    
    
endmodule
