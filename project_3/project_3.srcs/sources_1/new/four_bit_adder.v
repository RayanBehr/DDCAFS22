`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 08:48:43 AM
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder(
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
    );
    
    wire co_0_to_ci_1;
    full_adder adder1(a[0], b[0], 0   , s[0], co_0_to_ci_1);
    wire co_1_to_ci_2; 
    full_adder adder2(a[1], b[1], co_0_to_ci_1, s[1], co_1_to_ci_2);
    wire co_2_to_ci_3;
    full_adder adder3(a[2], b[2], co_1_to_ci_2, s[2], co_2_to_ci_3);
    full_adder adder4(a[3], b[3], co_2_to_ci_3, s[3], s[4]);
endmodule
