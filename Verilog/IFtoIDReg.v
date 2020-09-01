module IFtoIDReg(input clk, rst, flush, ld, input [31:0] InstIn, pcIn, 
				 output reg [31:0] inst, pc);
always @(posedge clk, posedge rst) begin
	if (rst) begin
		pc <= 0;
	end
	else begin
		if (flush) inst <= {6'b000000,26'b0};
		else if(ld) begin
			pc <= pcIn;
			inst <= InstIn;
		end
	end
end

endmodule
