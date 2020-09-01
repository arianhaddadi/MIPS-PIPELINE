module signExtend(input [15:0] inp, output [31:0] out);
	assign out = (inp[15])? {16'b1111111111111111,inp} : {16'b0,inp};

endmodule
