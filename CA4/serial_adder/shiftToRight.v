module shiftToRight #(parameter n = 8)(
  input clock,
  input serial_shift_to_right_input,
  input [n-1:0] parallel_data_load,
  output reg serial_shift_to_right_output
);

  reg [n-1:0] Q;

  initial begin
    Q <= parallel_data_load;
  end

  always @(posedge clock) begin
    serial_shift_to_right_output <= Q[0];
    Q <= {serial_shift_to_right_input, Q[n-1:1]};
  end

endmodule
