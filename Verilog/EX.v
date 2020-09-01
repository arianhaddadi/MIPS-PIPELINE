module EX(input memRead, memWrite, regWrite, regWriteWB, regWriteMEM, memToReg, RegDst, ALUSrc,
		  input[4:0] Rd, Rs, Rt, destInMEM, destInWB,
		  input[5:0] func, opcode,
		  input [31:0] dataRead1, dataRead2, extended, forwardedA, forwardedB,
		  output memReadOut, memWriteOut, memToRegOut, regWriteOut, 
		  output [4:0] RdOut, destOut, RtOut, 
		  output[31:0] res, Bout);
		
		wire [1:0] forwardA, forwardB;
		wire [2:0] ALUop;
		wire [31:0] A, B, BP;

		assign RtOut = Rt;
		assign regWriteOut = regWrite;
		assign memToRegOut = memToReg;
		assign memReadOut = memRead;
		assign memWriteOut = memWrite;
		assign Bout = BP;
		assign RdOut = Rd;
		assign destOut = (RegDst) ? Rd : Rt;
		assign B = (ALUSrc) ? extended : BP;
		assign A = (forwardA == 0) ? dataRead1 :
				   (forwardA == 1) ? forwardedA : 
				   (forwardA == 2) ? forwardedB : 2'bZ ;
		assign BP = (forwardB == 0) ? dataRead2 :
				   (forwardB == 1) ? forwardedA : 
				   (forwardB == 2) ? forwardedB : 2'bZ ;


		ALU alu(ALUop, A, B, res);
		ForwardUnit FU(regWriteMEM, regWriteWB, destInMEM, destInWB, Rs, Rt, forwardA, forwardB);
		ALUControl aluc(func, opcode, ALUop);

endmodule

