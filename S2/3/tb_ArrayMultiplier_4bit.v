`timescale 1ns/100ps

module tb_ArrayMultiplier_4bit();
	
	reg [3:0] A, B;
	wire [7:0] S;
	
	q3_AMP U1(A,B,S);
	defparam U1.n = 4;

	integer i, j;
	initial begin
		for(i = 0; i < 16; i=i+1) begin
			for(j = 0; j < 16; j=j+1) begin
				A <= i;
				B <= j;
				#1000;
			end
		end
	end
endmodule
