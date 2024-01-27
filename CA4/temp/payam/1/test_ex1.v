`timescale 1ns/100ps

module test_ex1;

	reg [7:0] A, B;
	reg Reset, Clock;
	wire [7:0] Sum;


	ex1 uu (A, B, Reset, Clock, Sum);

	always #5 Clock = ~Clock;

	initial begin

		Reset=1;
		Clock = 0;
		A=8'b00000000;
		B=8'b00000000;
		#50;
		
		Reset=0;
		#50;

		Reset=1;
		A=8'b00000000;
		B=8'b11111111;
		#50;
		
		Reset=0;
		#50;

		Reset=1;
		A=8'b10110111;
		B=8'b00001101;
		#50;

		Reset=0;
		#50;

		Reset=1;
		A=8'b00000001;
		B=8'b10000000;
		#50;

		Reset=0;
		#50;

		Reset=1;
		A=8'b01000010;
		B=8'b00100001;
		#50;
		
		Reset=0;
		#50;
		$stop();

	end

endmodule