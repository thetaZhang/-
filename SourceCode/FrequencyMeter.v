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
    input Clk,
    output [15:0] Frequency
    );
    
    wire Gate_Signal;
    reg[13:0] Wave_Count=14'b0;
    reg[13:0] BinaryFrequency=14'b0;
    reg rst=1'b0;

    always @(posedge Fxin or posedge rst) 
    begin
        if (rst)
        begin
            Wave_Count<=14'b0;
            rst<=~rst;
        end
        else 
        begin
        if (Gate_Signal==1)
            Wave_Count<=Wave_Count+14'b1;        
        else if (Gate_Signal==0)
            Wave_Count<=14'b0;
        end
    end
    
    always @(negedge Gate_Signal)
    begin
        BinaryFrequency<=Wave_Count;
        rst<=~rst;
    end

    GateSignal myGateSignal (
        .Clk(Clk),
        .Gate_Signal(Gate_Signal));

    BinaryToBCD myBinaryToBCD (
        .Binary(BinaryFrequency),
        .BCD(Frequency));

endmodule