`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ETH Zurich
// Engineer: Rayan Behr
// 
// Create Date: 04/06/2022 03:38:10 AM
// Design Name: 
// Module Name: FSM
// Project Name: LAB_4_report
// Target Devices: XILINX FPGA UNIVERSITY PROGRAM
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
        input switch,
        output reg [8:0]D
    );
    reg [8:0]sta_n;
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
            if(sta_n[3] & sta_n[4] & sta_n[5])     
                sta_p <= 9'b000000000;
            else              
            if(sta_n[0] & sta_n[1] & sta_n[2])                     
                sta_p <= 9'b000000000;                 
            else
            if(~sta_n[0] & ~sta_n[1] & sta_n[2]) 
                sta_p <= 9'b000000110; 
            else
            if(sta_n[3] & ~sta_n[4] & ~sta_n[5])     
                sta_p <= 9'b000011000;  
            else                                                              
            if(sta_n[3] & sta_n[4] & ~sta_n[5]) 
                sta_p <= 9'b000111000;          
            else              
            if(~sta_n[0] & sta_n[1] & sta_n[2])  
                sta_p <= 9'b000000111; 
            else                         
            if(sta_n[7] & ~sta_n[8])         
                sta_p <= 9'b000000100; 
            else
            if(~sta_n[7] & sta_n[8])
                sta_p <= 9'b000001000;     
       end   
    always @ (posedge div_clock)
        begin
            sta_n <= sta_p;
            sta_n[8] <= left;
            sta_n[7] <= right;
            sta_n[6] <= reset;
        end
    // Clock // TODO implement PWM transitions 
    wire div_clock_f;
    reg [21:0]clk_count_f; // 3 bits less (8x faster)
    always @ (posedge clock)
        begin
            clk_count_f <= clk_count_f + 1;
        end
    assign div_clock_f = &clk_count_f;  
    //Counting & stop before overflow
    //we represent them as unary numbers
    reg [2:0]dr_LC = 3'b111;
    reg [2:0]dr_LB = 3'b111;
    reg [2:0]dr_LA = 3'b111;
    reg [2:0]dr_RA = 3'b111;
    reg [2:0]dr_RB = 3'b111;
    reg [2:0]dr_RC = 3'b111;
    always @(posedge div_clock_f)
        begin // advance brightness states
            // RC
            if((sta_p[0] < sta_n[0]) &
                dr_RC != 3'b111)
                dr_RC <= dr_RC + 1;
            if((sta_p[0] > sta_n[0]) &
                dr_RC != 3'b000)
                dr_RC <= dr_RC - 1;  
            // RB                
            if((sta_p[1] < sta_n[1]) &
                dr_RB != 3'b111)
                dr_RB <= dr_RB + 1;          
            if((sta_p[1] > sta_n[1]) &
                dr_RB != 3'b000)
                dr_RB <= dr_RB - 1;  
            // RA                    
            if((sta_p[2] < sta_n[2]) &
                dr_RA != 3'b111)
                dr_RA <= dr_RA + 1;
            if((sta_p[2] > sta_n[2]) &
                dr_RA != 3'b000)
                dr_RA <= dr_RA - 1;  
            // LA                      
            if((sta_p[3] < sta_n[3]) &
                dr_LA != 3'b111)
                dr_LA <= dr_LA + 1;
            if((sta_p[3] > sta_n[3]) &
                dr_LA != 3'b000)
                dr_LA <= dr_LA - 1; 
            // LB                   
            if((sta_p[4] < sta_n[4]) &
                dr_LB != 3'b111)
                dr_LB <= dr_LB + 1;
            if((sta_p[4] > sta_n[4]) &
                dr_LB != 3'b000)
                dr_LB <= dr_LB - 1;  
            // LC                  
            if((sta_p[5] < sta_n[5]) &
                dr_LC != 3'b111)
                dr_LC <= dr_LC + 1;
            if((sta_p[5] > sta_n[5]) &
                dr_LC != 3'b000)
                dr_LC <= dr_LC - 1;                                  
        end
    reg [2:0]pwm_reg; // for the eight ratios
    always @(posedge clock) // we do da wii_u wii_u
        begin // (very fast PWM)          
            D[0] <= switch? sta_n[0] : pwm_reg > dr_RC;
            D[1] <= switch? sta_n[1] : pwm_reg > dr_RB;
            D[2] <= switch? sta_n[2] : pwm_reg > dr_RA;
            D[3] <= switch? sta_n[3] : pwm_reg > dr_LA;
            D[4] <= switch? sta_n[4] : pwm_reg > dr_LB;
            D[5] <= switch? sta_n[5] : pwm_reg > dr_LC;
            pwm_reg <= pwm_reg + 1;
        end  // iterate over the ratio codes    
endmodule
