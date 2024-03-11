`timescale 1ns/1ns

module IF_Stage 
(
    input clk, rst, branch_taken, freeze,
    input [31:0] BranchAddr,
    output [31:0] PC, Instruction
);

  wire [31:0] PC_in;
  
  PC_Reg PC_Register(.clk(clk), .rst(rst), .freeze(freeze), .PC_in(PC_in), .PC_out(PC));

  InstructionMemory instruction_mem(.Addr(PC), .Instruction(Instruction));
  
  assign PC_in = branch_taken ? BranchAddr : PC + 4;

endmodule
