module ex5 (i_request, Resetn, Clock, o_grant);

	input [3:0] i_request ;
	input Resetn, Clock;
	output wire [1:3] o_grant;
	reg [2:1] p_state, n_state;
	localparam Idle = 2'b00, gnt1 = 2'b01, gnt2 = 2'b10, gnt3 = 2'b11;

	always @(i_request, p_state)
		case (p_state)
			Idle: casex (i_request)

				3'b000: n_state = Idle;
				3'b1xx: n_state = gnt1;
				3'b01x: n_state = gnt2;
				3'b001: n_state = gnt3;
				default: n_state = Idle;
			endcase

		gnt1: if (i_request[1]) n_state = gnt1;
			else n_state = Idle;
		gnt2: if (i_request[2]) n_state = gnt2;
			else n_state = Idle;
		gnt3: if (i_request[3]) n_state = gnt3;
			else n_state = Idle;
		default: n_state = Idle;

		endcase

	always @(posedge Clock)
		if (!Resetn) p_state <= Idle;
		else p_state <= n_state;

	assign o_grant[1] = (p_state == gnt1);
	assign o_grant[2] = (p_state == gnt2);
	assign o_grant[3] = (p_state == gnt3);

endmodule