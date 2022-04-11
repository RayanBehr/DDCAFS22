`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 09:17:15 AM
// Design Name: 
// Module Name: arith
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


module arith(
    input [31:0]A,
    input [31:0]B,
    input [3:0]AluOp,
    output reg [31:0]C,
    output Zero
    );
    always @(*) begin
            case(AluOp)
                4'bxx00: C = A+B;
                4'bxx01: C = A-B;
                4'b1010: C = ((A-B) < 0 )? 
                                32'b01:
                                32'b00;
  
           endcase  
           if(C == 32'b00)
     end    
endmodule
