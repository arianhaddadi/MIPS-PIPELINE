module EXtoMEMReg(input clk, rst, regWriteIn, memReadIn, memWriteIn, memToRegIn,
				  input[31:0] addressIn, dataIn,
				  input[4:0] RdIn, destIn,
				  output reg regWrite, memRead, memWrite, memToReg,
				  output reg[31:0] address, data,
				  output reg[4:0] Rd, dest);

always @(posedge clk, posedge rst) begin
	if(rst) begin
		{regWrite, memRead, memWrite, memToReg, address, data, Rd, dest} <= 0;
	end
	else begin
		{regWrite, memRead, memWrite, memToReg, address, data, Rd, dest} <= {regWriteIn, memReadIn, memWriteIn, memToRegIn, addressIn, dataIn, RdIn, destIn};
	end
end

endmodule
