module StateMachineOutput (
  input clk, reset, w,
  output z
);

  reg [2:0] p_state, n_state;
  parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

  always @(p_state)
    case (p_state)
      A: if (w) n_state = C; else n_state = B;
      B: if (w) n_state = E; else n_state = D;
      C: if (w) n_state = D; else n_state = E;
      D: if (w) n_state = F; else n_state = A;
      E: if (w) n_state = A; else n_state = F;
      F: if (w) n_state = C; else n_state = B;
      default: n_state = A;
    endcase

  always @(negedge reset or posedge clk)
    if (!reset) p_state <= A;
    else p_state <= n_state;

  assign z = (p_state == F);

endmodule
