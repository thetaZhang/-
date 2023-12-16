`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/17 00:24:34
// Design Name: 
// Module Name: sim_BinaryToBCD
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


module sim_BinaryToBCD();

reg[13:0] in;
wire[15:0] out;

initial begin
    in=14'b00001110000110;
    #100
    in=14'b00000000011111;
    
    end

BinaryToBCD sim_BtB(
    .Binary(in),
    .BCD(out)
);
endmodule
