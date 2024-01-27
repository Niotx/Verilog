module ex3 (Clock, Resetn, w1, w2, z);

	input Clock, Resetn, w1, w2;
	output reg z;
	reg [2:1]p_state, n_state;
	wire K;
	localparam [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

	assign K = w1^w2;
	always @(K or p_state) begin
		n_state = A;
		case (p_state)
			A: if (!K) 
			n_state = B; 

			else 
			n_state = A; 

			B: if (!K) 
			n_state = C; 
			

			else
			n_state = A; 
			

			C: if (!K) 
			n_state = D; 
			

			else 
			n_state = A; 
			

			D: if (!K)
			n_state = D; 
			

			else 
			n_state = A; 
			

		endcase
		end

	always @(negedge Resetn or posedge Clock) begin
		if (!Resetn) n_state <= A;
		else p_state <= n_state;
		end

	always @(K, p_state) begin
 		z = 0; 
 		case (p_state)
 			A: z = 0;
			B: z = 0;
			C: z = 0;
			D: if(!K)
 				z = 1;
 			else 
 				z = 0;
 		endcase
 	end
endmodule