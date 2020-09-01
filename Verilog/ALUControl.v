`timescale 1ns/1ns
module ALUControl(input[5:0] func, opcode, output reg[2:0] ALUop);
  always @(*) begin
    case(opcode)
      6'b100011: ALUop = 3'b010;
      6'b101011: ALUop = 3'b010;
      6'b000000: begin
        case(func)
          6'b100000: ALUop = 3'b010;
          6'b100010: ALUop = 3'b110;
          6'b100100: ALUop = 3'b000;
          6'b100101: ALUop = 3'b001;
          6'b101010: ALUop = 3'b111;
          6'b000000: ALUop = 3'b101;
        endcase
      end
      default ALUop = 3'b101;
    endcase
  end
endmodule
