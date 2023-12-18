`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 23:31:25
// Design Name: 
// Module Name: GateSignal
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
module GateSignal (
    input Clk,
    output reg Gate_Signal
    );
    reg[27:0] Clk_Count;
    always @(posedge Clk)   //set 1s gate signal
    begin
        if (Clk_Count>=27'd100000000) 
            begin
                Clk_Count<=28'b0;
                Gate_Signal<=~Gate_Signal;
            end
        else
            Clk_Count<=Clk_Count+28'b1;
        
    end
endmodule

