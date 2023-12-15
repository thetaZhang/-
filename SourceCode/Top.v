`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/18 16:10:21
// Design Name: 
// Module Name: Top
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


module Top(
    input Clk,//clock, use the 100MHz clock source on the board by p17 pin
    input En,//enable,if enable ==0, the display is light off;
  //  input Button,
    input [7:0]sw,
    output [6:0] A_2_GRight4, //right 4 LED display digitals segment output
    output [6:0] A_2_GLeft4,//left 4 LED display digitals segment output
    output [7:0] DigitalSel,//digitals select control signals, from left to digitals 8 to 1;
    output DpLeft,// dp for left 4 digitals
    output DpRight//dp for right 4 digitals 
    
    );
    reg [31:0]Number=32'h12345678;    //example of a number for display ,you can modify here for your number to display.;
    wire Fxin,Pxin,Dxin;
    wire [31:0]Frequency;
    //wire [15:0]Periodic;
    //wire [15:0]Duty;
    
    assign DpLeft=DigitalSel[6];
    assign DpRight=DigitalSel[2];
    //these two sentence above is to control the dp for display, as above value of these sentences, 
    // the result is show as 1.2345.678, you can modify the subscript number of DigitlaSel for your own needs.


    always @(Frequency)
    begin
        Number=Frequency;
    end


    Display myDisplay(.Clk(Clk),    
                      .En(1), 
                      .Digital1(Number[3:0]),
                      .Digital2(Number[7:4]),
                      .Digital3(Number[11:8]),
                      .Digital4(Number[15:12]),
                      .Digital5(Number[19:16]),
                      .Digital6(Number[23:20]),
                      .Digital7(Number[27:24]),
                      .Digital8(Number[31:28]),
                      .DigitSel(DigitalSel),
                      .A_2_GRight4(A_2_GRight4),
                      .A_2_GLeft4(A_2_GLeft4));
  
  
    FrequencyMeter U10(.Fxin(Fxin),
                    .Clk(Clk), 
                    .Frequency(Frequency));
                     
//     PeriodicMeter U12(.Pxin(Pxin),
   //                  .Clk(Clk),
  //                   .Periodic(Periodic));
                     
  //   DutyMeter U13(.Dxin(Dxin),
  //              .Clk(Clk),
  //              .Duty(Duty));
    
    
    SignalGenerator U11(.Clk(Clk),
                    .ControlFrequency(sw[7:5]),//these three switch is for control Frequency;
                    .ControlPeriodic(sw[4:2]),//these three switch is for control Periodic;
                    .ControlDuty(sw[1:0]),//these two switch is for control Duty;
                    .SignalOutFrequency(Fxin),//this signal is Frequency signal output, vaild in 
                    //sw[7:5],000,000Hz;
                    //sw[7:5],001,0.763KHz
                    //sw[7:5],010,1.526KHz
                    //sw[7:0],100,3.051KHz
                    .SignalOutPeridic(Pxin),//this signal is Periodic signal output, vaild in
                    //sw[4:2],001,2.622ms
                    //sw[4:2],010,1.310ms
                    //sw[4:2],100,0.655ms
                    .SignalOutDuty(Dxin));//this signal is Duty signal output,vaild in 
                    //sw[1:0],00,6.25% duty
                    //sw[1:0],01,18.78% duty
                    //sw[1:0],10,31.27% duty
                    //sw[1:0],11,43.78% duty
 
endmodule
