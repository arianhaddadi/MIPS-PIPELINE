`timescale 1ns/1ns
module ForwardUnit(input EXtoMEMregWrite, MEMtoWBregWrite, input[4:0] EXtoMEMRd, MEMtoWBRd, Rs, Rt, 
                   output reg[1:0] forwardA, forwardB);
  always @(*) begin
    case({EXtoMEMregWrite, MEMtoWBregWrite})
      2'b10: begin
        if(Rs == EXtoMEMRd) forwardA = 1;
        else forwardA = 0;
        if(Rt == EXtoMEMRd) forwardB = 1;
        else forwardB = 0;
      end
      2'b01: begin
        if(Rs == EXtoMEMRd) forwardA = 2;
        else forwardA = 0;
        if(Rt == EXtoMEMRd) forwardB = 2;
        else forwardB = 0;
      end
      2'b11: begin
        if(Rs == EXtoMEMRd) forwardA = 1;
        else forwardA = 0;
        if(Rt == EXtoMEMRd) forwardB = 1;
        else forwardB = 0;
      end
      2'b00: begin
        forwardA = 0;
        forwardB = 0;
      end
    endcase
  end  
endmodule

