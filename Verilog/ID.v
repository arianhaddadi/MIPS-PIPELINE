module ID(input clk, rst, regWriteWb, memReadEX,
		  input [4:0] RdMem, writeAddress, RtEX, 
		  input [31:0] addressOrRes, instruction, pcAdded, writeData,  
		  output pcLd, regWriteOut, memReadOut, memWriteOut, memToRegOut, regDstOut, ALUSrcOut, flush, IFtoIDldOut,
		  output [1:0] pcSrc,
		  output[4:0] Rs, Rd, Rt, 
		  output[5:0] opcode, func,
		  output[31:0] dataRead1Out, dataRead2Out, extendedOut, branchAddress, jAddress);

	wire nopSel, regWrite, memRead, memWrite, memToReg, regDst, ALUSrc;
	wire [27:0] shited28;
	wire [31:0] extended, shifted32, dataRead1, dataRead2;

	assign jAddress = {pcAdded[31:28],shited28};
	assign Rs = instruction[25:21];
	assign Rt = instruction[20:16];
	assign Rd = instruction[15:11];
	assign opcode = instruction[31:26];
	assign extendedOut = extended;
	assign func = instruction[5:0];
	assign regWriteOut = (nopSel) ? 0 : regWrite;
	assign memReadOut = (nopSel) ? 0 : memRead;
	assign memWriteOut = (nopSel) ? 0 : memWrite;
	assign memToRegOut = (nopSel) ? 0 : memToReg;
	assign regDstOut = (nopSel) ? 0 : regDst;
	assign ALUSrcOut = (nopSel) ? 0 : ALUSrc;
	assign dataRead1Out = dataRead1;
	assign dataRead2Out = dataRead2;

	RegFile regFile(clk, regWriteWb, instruction[25:21], instruction[20:16], writeAddress, writeData, dataRead1, dataRead2);	
  Controller controller(instruction[31:26], regWrite, memRead, memWrite, memToReg, regDst, ALUSrc);
	HazardUnit hazardUnit(memReadEX, RtEX, instruction[25:21], instruction[20:16], nopSel, IFtoIDldOut, pcLd);
	CheckBranch checkBranch(dataRead1, dataRead2, addressOrRes, instruction[25:21], instruction[20:16], RdMem, instruction[31:26], rst, pcSrc, flush);
	signExtend se(instruction[15:0], extended);
	Shifter32 sh32(extended, shifted32);
	Shifter26 sh26(instruction[25:0], shited28);
	Adder adder(pcAdded, shifted32, branchAddress);


endmodule
