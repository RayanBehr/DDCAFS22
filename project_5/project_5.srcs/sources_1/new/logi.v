`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 09:17:15 AM
// Design Name: 
// Module Name: logi
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


module logi(
    input [31:0]A,
    input [31:0]B,
    input [3:0]AluOp,
    output reg [31:0]C 
    );
    wire [31:0] w1;
    wire [31:0] w2;
    wire [31:0] w3;
    wire [31:0] w4;
    and c1(w1,A,B); 
    or c2(w2,A,B); 
    xor c3(w3,A,B); 
    nor c4(w4,A,B); 
    always @(*) begin
            case(AluOp)
                4'bxx00: C = w1;
                4'bxx01: C = w2;
                4'bxx10: C = w3;
                4'bxx11: C = w4;   
        endcase  
     end        
endmodule
