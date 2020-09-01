module WB(input regWrite, memToReg, 
		  input [4:0] dest,
		  input [31:0] data, res,
		  output regWriteOut,
		  output [4:0] destOut, 
		  output [31:0] RFdata);
	
	assign destOut = dest;
	assign RFdata = (memToReg) ? data : res;
	assign regWriteOut = regWrite;
endmodule
