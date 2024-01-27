`timescale 1ns/100ps

module test_ex2;

	reg reset, clk;
	wire [7:0]z;


	ex2 uu (.clk(clk),.reset(reset),.z(z));

	always #5 clk = ~clk;

	initial begin
		
		clk = 0;
		reset=1;
		#50;

		reset=0;
		#100;

		
		reset=1;
		#50;
		
		$stop();

	end

endmodule
