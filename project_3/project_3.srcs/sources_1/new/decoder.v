`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2022 08:50:17 AM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [3:0] S,
    output reg [6:0] D
    );
    always @ (S) begin
        case(S)
            4'b0000: D = 7'b0000001; // 0
            4'b0001: D = 7'b1001111; // 1
            4'b0010: D = 7'b0010010; // 2
            4'b0011: D = 7'b0000110; // 3
            4'b0100: D = 7'b1001100; // 4
            4'b0101: D = 7'b0100100; // 5
            4'b0110: D = 7'b0100000; // 6
            4'b0111: D = 7'b0001111; // 7
            4'b1000: D = 7'b0000000; // 8
            4'b1001: D = 7'b0000100; // 9
            4'b1010: D = 7'b0001000; // A
            4'b1011: D = 7'b1100000; // B
            4'b1100: D = 7'b0110001; // C
            4'b1101: D = 7'b1000010; // D
            4'b1110: D = 7'b0110000; // E
            4'b1111: D = 7'b0111000; // F
        endcase
    end  
endmodule
