module shiftXor #(
  parameter n = 8
)(
  input clock,
  input [n-1:0] x, y,
  output reg [n-1:0] z
);
  reg p_state, n_state;
  localparam G = 1'b0, H = 1'b1;
  wire x2, y2, bm;
  reg z2;

  shiftTR shift_x(clock, 1'b0, x, x2);
  shiftTR shift_y(clock, 1'b0, y, y2);
  shiftTR shift_z(clock, z2, z, bm);

  always @(x2, y2, p_state) begin
    n_state = G;
    z2 = 0;
    case (p_state)
      G:
        case ({x2, y2})
          2'b00:
            begin
              n_state = G;
              z2 = 1'b0;
            end
          2'b01:
            begin
              n_state = G;
              z2 = 1'b1;
            end
          2'b10:
            begin
              n_state = G;
              z2 = 1'b1;
            end
          2'b11:
            begin
              n_state = H;
              z2 = 1'b0;
            end
        endcase
      H:
        case ({x2, y2})
          2'b00:
            begin
              n_state = G;
              z2 = 1'b1;
            end
          2'b01:
            begin
              n_state = H;
              z2 = 1'b0;
            end
          2'b10:
            begin
              n_state = H;
              z2 = 1'b0;
            end
          2'b11:
            begin
              n_state = H;
              z2 = 1'b1;
            end
        endcase
    endcase
  end

  always @(posedge clock)
    p_state <= n_state;

  assign z = bm;

endmodule
