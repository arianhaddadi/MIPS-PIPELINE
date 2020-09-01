`timescale 1ns/1ns
module CheckBranch(input[31:0] readRs, readRt, AluOut, input[4:0] Rs, Rt, Rd, input[5:0] opcode, input rst,
                   output reg[1:0] pcSrc, output reg flush);
  always @(*) begin
    if (rst) begin
      {pcSrc, flush} = 3'b000;
    end
    else begin
      case(opcode)
        6'b000010: {pcSrc, flush} = 3'b101;
        6'b000100: begin
          if(Rd == Rs) begin
            if(AluOut == readRt) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
          if(Rd == Rt) begin
            if(AluOut == readRs) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
          else begin
            if(readRs == readRt) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
        end
        6'b000101: begin
          if(Rd == Rs) begin
            if(AluOut != readRt) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
          if(Rd == Rt) begin
            if(AluOut != readRs) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
          else begin
            if(readRs != readRt) {pcSrc, flush} = 3'b011;
            else {pcSrc, flush} = 3'b000;
          end
        end
        default {pcSrc, flush} = 3'b000;
      endcase
    end
  end
endmodule
