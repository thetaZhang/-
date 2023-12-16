`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/16 22:27:58
// Design Name: 
// Module Name: BinaryToBCD
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


module BinaryToBCD(
    input [13:0] Binary,
    output [15:0] BCD
    );
    
    reg[3:0] one,ten,hundred,thousand;
    integer i,j=0;

    always @(*)
    begin
    one=4'b0;
    ten=4'b0;
    hundred=4'b0;
    thousand=4'b0;
   
        for (i=13;i>=0;i=i-1) 
        begin
            if (one>=4'd5) one=one+4'd3;
            if (ten>=4'd5) ten=ten+4'd3;
            if (hundred>=4'd5) hundred=hundred+4'd3;
            if (thousand>=4'd5) thousand=thousand+4'd3;
            thousand={thousand[2:0],hundred[3]};
            hundred={hundred[2:0],ten[3]};
            ten={ten[2:0],one[3]};
            one={one[2:0],Binary[i]};
        end
    end

    assign BCD={thousand,hundred,ten,one};

endmodule
