module IF(input clk, rst, PCLd, 
      input [1:0] PCSrc,
		  input [31:0] jAddress, branchAddress, 
		  output [31:0] PCadded, instruction);
	wire [31:0] newPC, PC;

	InstructionMem instructionMem(PC, instruction);
	Adder adder(4, PC, PCadded);
	PCReg pcreg(clk,rst, PCLd, newPC, PC);

	assign newPC = (PCSrc == 0) ?  PCadded:
				   (PCSrc == 1) ? branchAddress: 
				   (PCSrc == 2) ? jAddress : 32'bZ;

endmodule
