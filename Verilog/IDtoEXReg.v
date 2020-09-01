module IDtoEXReg(input clk, rst, regWriteIn, memReadIn, memWriteIn, memToRegIn, regDstIn, ALUSrcIn,
				 input [31:0] RegAIn, RegBIn, ExtendedIn,
				 input [5:0] funcIn, opcodeIn,
				 input [4:0] RsIn, RtIn, RdIn,
				 output reg regWrite, memRead, memWrite, memToReg, regDst, ALUSrc,
				 output reg [31:0] RegA, RegB, Extended,
				 output reg [5:0] func, opcode,
				 output reg [4:0] Rs, Rt, Rd);

	always @(posedge clk , posedge rst) begin
		if (rst) begin
		  {RegA, RegB, Extended, func, opcode, Rs, Rt, Rd} <= 0;
		  {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} <= 0;
		end
		else begin
		  {RegA, RegB, Extended, func, opcode, Rs, Rt, Rd} <= {RegAIn, RegBIn, ExtendedIn, funcIn, opcodeIn, RsIn, RtIn, RdIn};
		  {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} <= {regWriteIn, memReadIn, memWriteIn, memToRegIn, regDstIn, ALUSrcIn};
		end
	end
endmodule
