`timescale 1ns/100ps

module test_ex5;

	reg [1:3]i_request; 
	reg Resetn, Clock;
	wire[1:3] o_grant;


	ex5 uu (i_request, Resetn, Clock, o_grant);

	always #5 Clock = ~Clock;


	initial begin 

		Resetn=0;
		Clock=0;
		i_request=3'b000;
		#50;

		Resetn=1;
		i_request=3'b001;
		#50;

		Resetn=0;
		#50;

		Resetn=1;
		i_request=3'b001;
		#50;

		Resetn=0;
		$stop();

	end

endmodule