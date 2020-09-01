`timescale 1ns/1ns
module HazardUnit(input memRead, input[4:0] IDtoEXRt, IFtoIDRs, IFtoIDRt,
                  output reg nopSel, IFtoIDwrite, pcLd);
  always @(*) begin
    if((memRead == 1) && ((IDtoEXRt == IFtoIDRs) || (IDtoEXRt == IFtoIDRt))) begin
      nopSel = 1;
      pcLd = 0;
      IFtoIDwrite = 0;
    end
    else begin
      nopSel = 0;
      pcLd = 1;
      IFtoIDwrite = 1;
    end
  end            
endmodule
