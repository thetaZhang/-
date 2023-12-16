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
    output [15:0] Frequency
    );
    
    wire Gate_Signal;
    reg[13:0] Wave_Count;
    reg[13:0] BinaryFrequency;


    always @(posedge Fxin) 
    begin
        if (Gate_Signal)
            Wave_Count<=Wave_Count+1'b1;        
        else 
            Wave_Count<=14'b0;

    end

    always @(negedge Gate_Signal)
    begin
        BinaryFrequency<=Wave_Count;
        
    end

    GateSignal myGateSignal (
        .Clk(Clk),
        .Gate_Signal(Gate_Signal));

    BinaryToBCD myBinaryToBCD (
        .Binary(BinaryFrequency),
        .BCD(Frequency));

endmodule