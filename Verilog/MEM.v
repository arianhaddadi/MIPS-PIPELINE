module MEM(input clk, regWriteIn, memToRegIn, memRead, memWrite,
		   input [4:0] Rdin, destIn,
		   input [31:0] addressOrResIn, data,
		   output regWrite, memToReg, 
		   output [4:0] dest, Rd,
		   output [31:0] memOut, addressOrRes);

	assign regWrite = regWriteIn;
	assign memToReg = memToRegIn;
	assign Rd = Rdin;
	assign dest = destIn;
  assign addressOrRes = addressOrResIn;
  
	DataMem DM(clk, memRead, memWrite, addressOrResIn , data, memOut);


endmodule
