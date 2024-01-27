`timescale 1ns/100ps
//`include "ConsecutiveZerosOnesDetector.v"
module ConsecutiveZerosOnesDetector_tb;
	reg r_A, r_B, r_C, r_D;
	wire w_Z;
	ConsecutiveZerosOnesDetector dut (.A(r_A),.B(r_B),.C(r_C),.D(r_D),.Z(w_Z));
    	//reg clk;
    	//always #5 clk = ~clk;
    initial begin
        	r_A = 1'b1;
		r_B = 1'b0;
		r_C = 1'b0;
		r_D = 1'b0;
        	#10;
        	r_A = 1'b0;
		r_B = 1'b1;
		r_C = 1'b1;
		r_D = 1'b1;
        	#10; 
        	r_A = 1'b1;
		r_B = 1'b0;
		r_C = 1'b1;
		r_D = 1'b0;
       		#10;
		$stop();
    end

endmodule