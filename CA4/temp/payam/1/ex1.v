module ex1(A, B, Reset, Clock, Sum);

	input [7:0] A, B;
	input Reset, Clock;
	output wire [7:0] Sum;
	reg [3:0] Count;
	reg s, p_state, n_state;
	wire [7:0] a, b;
	wire Run;

	parameter G=1'b0, H=1'b1;

	shiftrne shift_A (A, Reset, 1'b1, 1'b0, Clock, a);
	shiftrne shift_B (B, Reset, 1'b1, 1'b0, Clock, b);
	shiftrne shift_Sum (8'b00000000, Reset, Run, s, Clock, Sum);

	always @(a, b, p_state)
		case (p_state)
			G: begin
			s = a[0]^b[0];
			if (a[0] & b[0]) n_state = H;
			else n_state = G;
			end

			H: begin
			s = a[0]~^b[0];
			if ( ~a[0] & ~b[0]) n_state = G;
			else n_state = H;
			end

			default: n_state = H;

		endcase

	always @(posedge Clock)
		if (!Reset) p_state <= G;
		else p_state <= n_state;

	always @(posedge Clock) 
		if (!Reset)  Count = 8;
		else if (Run) Count = Count-1;
	assign Run =| Count;
endmodule

module shiftrne (R, L, E, w, Clock, Q);

	parameter n = 8;
	input [n-1:0] R;
	input L, E, w, Clock;
	output reg [n-1:0] Q;
	integer k;

	always @(posedge Clock)
		if (L)
			Q <= R;
		else if (E)
		begin
		for (k = n-1; k > 0; k = k -1) 
			Q[k- 1]<=Q[k];
			Q[n -1]<=w; 
		end
endmodule
