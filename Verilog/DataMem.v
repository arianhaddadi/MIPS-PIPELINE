module DataMem(input clk, memRead, memWrite, input[31:0] address , data, output[31:0] memOut);
	reg [31:0] mem[16383:0];
	integer i;
	initial begin
		for (i = 0 ; i <= 16383 ; i = i + 1) mem[i] = 0;
		mem[1000] = 10;
		mem[1001] = 15;
		mem[1002] = 19;
		mem[1003] = 13;
		mem[1004] = 20;
		mem[1005] = 24;
		mem[1006] = 11;
		mem[1007] = 45;
		mem[1008] = 23;
		mem[1009] = 31;
	end

	assign memOut = (memRead)? mem[address[13:0]]: 0;
	always @(negedge clk) begin
		if (memWrite) mem[address[13:0]] = data;
	end
endmodule
