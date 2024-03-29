`timescale 1ns/1ns

module ID_Stage_Reg
(
    input clk, rst,
    input [31:0] PC_in,
    output reg [31:0] PC
);

always @(posedge rst, posedge clk) begin
  if (rst)
    PC <= 32'b0;
  else
    PC <= PC_in;  
end
    
endmodule