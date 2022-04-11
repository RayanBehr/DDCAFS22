`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 03:38:10 AM
// Design Name: 
// Module Name: FSM
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


module FSM( 
        input left,
        input reset,
        input right,
        input clock,
        output reg [8:0]sta_n
    );
    reg [8:0]sta_p;   
    wire div_clock;
    reg [24:0]clk_count;
    always @ (posedge clock)
        begin
            clk_count <= clk_count + 1;
        end
    assign div_clock = &clk_count;   
    always @ (*)
        begin
            if(sta_n[6]) // reset
                sta_p <= 9'b000000000; 
            else              
            if(sta_n[0] & sta_n[1] & sta_n[2])                     
                sta_p <= 9'b000000000; 
            else              
            if(~sta_n[0] & sta_n[1] & sta_n[2])  
                sta_p <= 9'b000000111; 
            else
            if(~sta_n[0] & ~sta_n[1] & sta_n[2]) 
                sta_p <= 9'b000000110; 
            else
            if(sta_n[7] & ~sta_n[8]) // start right          
                sta_p <= 9'b000000100; 
            else             
            if(sta_n[3] & sta_n[4] & sta_n[5])     
                sta_p <= 9'b000000000; 
            else            
            if(sta_n[3] & sta_n[4] & ~sta_n[5]) 
                sta_p <= 9'b000111000; 
            else
            if(sta_n[3] & ~sta_n[4] & ~sta_n[5])     
                sta_p <= 9'b000011000; 
            else
            if(~sta_n[7] & sta_n[8]) // start left 
                sta_p <= 9'b000001000; 
       end   
    always @ (posedge div_clock)
        begin
            sta_n <= sta_p;
            sta_n[8] <= left;
            sta_n[7] <= right;
            sta_n[6] <= reset;
        end
endmodule
