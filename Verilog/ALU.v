module ALU(input [2:0] operation, input [31:0] operand1, operand2, output [31:0] result);
	assign result = (operation == 3'b000)? operand1 & operand2:
					(operation == 3'b001)? operand1 | operand2:
					(operation == 3'b010)? operand1 + operand2:
					(operation == 3'b110)? operand1 - operand2:
					(operation == 3'b111)? operand1 < operand2:
					(operation == 3'b101)? operand1: 32'bZ;
endmodule
