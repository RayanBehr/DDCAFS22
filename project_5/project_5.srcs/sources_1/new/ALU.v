`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 08:54:21 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0]A,
    input [31:0]B,
    input [3:0]AluOp,
    output reg [31:0]C,
    output Zero
    );  
    wire [31:0] w1;
    wire [31:0] w2; 
    arith c1(w1,A,B);
    logi c2(w2,A,B);
        always @(*) begin
            case(AluOp)
                4'b1xxx: C = w1;
                4'b0xxx: C = w2; 
        endcase  
     end 
endmodule
