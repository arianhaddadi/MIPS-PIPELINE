module RegFile(input clk, regWrite, input[4:0] Rs, Rt, WA,
			   input [31:0] WD,
			   output [31:0] D1, D2);
	reg [31:0] regs[31:0];
	assign D1 = regs[Rs];
	assign D2 = regs[Rt];
	integer i;
	initial begin
		for (i = 0 ; i <= 31 ; i = i + 1) regs[i] = 0;
	end
	always @(negedge clk) begin
		if (regWrite && (WA!=0)) regs[WA] <= WD;
	end

endmodule
