`timescale 1ns/100ps

module test_ex4;

	reg clk, reset, w;
	wire z;


	ex4 uu (clk, reset, w, z);

	always #5 clk = ~clk;

	initial begin
		w=1;
		clk=0;
		reset=0;
		#50;

		reset=1;
		w=0;
		#50;

		reset=0;
		#50;

		reset=1;
		w=1;
		#50;

		reset=0;
		#50;

		reset=1;
		w=0;
		#50;

		reset=0;
		$stop();

	end

endmodule