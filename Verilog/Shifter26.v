module Shifter26(input [25:0] inp , output [27:0] out);
		
		assign out = {inp, 2'b0} ;

endmodule
