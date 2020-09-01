module PCReg(input clk,rst, ld, input [31:0] pcIn, output reg[31:0] PC);
	always @(posedge clk , posedge rst) begin
		if (rst) begin
			PC <= 32'b0;
		end
		else if (ld) begin
			PC <= pcIn;
		end
	end

endmodule
