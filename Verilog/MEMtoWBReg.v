module MEMtoWBReg (input clk, rst, regWriteIn, memToRegIn,
				  input[31:0] resIn, dataIn,
				  input[4:0] destIn,
				  output reg regWrite, memToReg,
				  output reg[31:0] res, data,
				  output reg[4:0] dest);

always @(posedge clk, posedge rst) begin
	if(rst) begin
		{regWrite, memToReg, res, data, dest} <= 0;
	end
	else begin
		{regWrite, memToReg, res, data, dest} <= {regWriteIn, memToRegIn, resIn, dataIn, destIn};
	end
end

endmodule

