`timescale 1ns/1ns

module ARM_TB();
  
  reg clk, rst;
  
  ARM arm(.CLOCK_50(clk), .SW({17'b0, rst}));
  
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk = 1; rst = 1;
    #18 rst = 0;
    
    #200 $stop;
  end
  
endmodule;