`timescale 1ns/100ps

module tb_T1;

  reg clock;
  reg [7:0] x, y;
  reg [7:0] parallel_data_load;
  wire [7:0] z;

  T1 #(8) uut (
    .clock(clock),
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    clock = 0;
    x = 8'b00000000;
    y = 8'b11111111;
    parallel_data_load = 8'b01010101;

    #5 clock = 1;
    #5 clock = 0;
    #5 x = 8'b10101010;
    #5 y = 8'b01010101;
    #5 parallel_data_load = 8'b11001100;

    // Add more test cases as needed

    #50 $finish;
  end

  always #1 clock = ~clock;

endmodule
