`timescale 1ns/1ns

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