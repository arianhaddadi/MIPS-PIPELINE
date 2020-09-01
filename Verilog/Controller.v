module Controller(input[5:0] opcode, output reg regWrite, memRead, memWrite, memToReg, regDst, ALUSrc);
	always @(opcode) begin 
		case(opcode) 
			6'b000000: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b100010;//RType
			6'b100011: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b110101;//LW
			6'b101011: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b001001;//SW
			6'b000010: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b000000;//JUMP
			6'b000100: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b000000;//BEQ
			6'b000101: {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b000000;//BNEQ
			default:   {regWrite, memRead, memWrite, memToReg, regDst, ALUSrc} = 6'b000000;
		endcase
	end
endmodule
