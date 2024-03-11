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


module InstructionMemory
(
    input [31:0] Addr,
    output reg [31:0] Instruction
);
  
  
  always @(Addr) begin
    case (Addr)
      32'd0:  Instruction = 32'b000000_00001_00010_00000_00000000000;
      32'd4:  Instruction = 32'b000000_00011_00100_00000_00000000000;
      32'd8:  Instruction = 32'b000000_00101_00110_00000_00000000000;
      32'd12: Instruction = 32'b000000_00111_01000_00010_00000000000;
      32'd16: Instruction = 32'b000000_01001_01010_00011_00000000000;
      32'd20: Instruction = 32'b000000_01011_01100_00000_00000000000;
      32'd24: Instruction = 32'b000000_01101_01110_00000_00000000000;
      default: Instruction = 32'b0;
    endcase
  end
  
  
endmodule