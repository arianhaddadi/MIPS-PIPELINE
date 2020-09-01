module TB();
	reg clk = 0, rst = 0;
	Pipeline pipeline(clk,rst);
	always #20 clk = ~clk;
	initial begin
		#2
		rst = 1;
		#2
		rst = 0;
		#4000
		$stop;
	end

endmodule
