module FrequencyMeter (
    input Fxin,
    inout Clk,
    output Frequency
    );
    reg[27:0] Clk_Count;
    reg Gate_Signal;
    always @(posedge Clk)   //set 1s gate signal
    begin
        if (Clk_Count>=27'd100000000) 
            begin
                Clk_Count<=28'b0;
                Gate_Signal<=~Gate_Signal;
            end
        else
            Clk_Count<=Clk_Count+1'b1;
        
    end
endmodule