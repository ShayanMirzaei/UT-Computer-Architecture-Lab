`timescale 1ns/1ns

module PC_Reg
(
  input clk, rst, freeze,
  input [31:0] PC_in,
  output reg [31:0] PC_out
);

  always @(rst, posedge clk) begin
      if (rst)
        PC_out <= 32'b0;
      else if (~freeze)
        PC_out <= PC_in;
  end
  
  
endmodule