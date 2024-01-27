`timescale 1ns/100ps

module tb_ArrayMultiplier_8bit();
	
	reg [7:0] A, B;
	wire [15:0] S;
	
	q3_AMP U1(A,B,S);
	defparam U1.n = 8;

	integer i, j;
	initial begin
		for(i = 0; i < 16; i=i+1) begin
			for(j = 0; j < 16; j=j+1) begin
				A <= i*16;
				B <= j*16;
				#1000;
			end
		end
	end
endmodule
