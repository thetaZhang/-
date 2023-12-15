`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 23:31:25
// Design Name: 
// Module Name: FrequencyMeter
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


module FrequencyMeter (
    input Fxin,
    inout Clk,
    output reg[31:0] Frequency
    );
    
    reg Gate_Signal;
    reg[31:0] Wave_Count;


    always @(posedge Fxin) 
    begin
        if (Gate_Signal)
            Wave_Count<=Wave_Count+1'b1;        
    end

    always @(negedge Gate_Signal)
    begin
        Frequency<=Wave_Count;
        Wave_Count<=32'b0;
    end




    GateSignal myGateSignal (
        .Clk(Clk),
        .Gate_Signal(Gate_Signal)
    )
endmodule