`timescale 1ns/100ps

module tb_FSM610;

  reg Clock, Resetn, w1, w2;
  wire z;

  FSM610 uut (
    .Clock(Clock),
    .Resetn(Resetn),
    .w1(w1),
    .w2(w2),
    .z(z)
  );

  initial begin
    Clock = 0;
    Resetn = 0;
    w1 = 0;
    w2 = 0;

    #10 Resetn = 1;

    // Test Case 1
    #10 w1 = 0; w2 = 0;
    #10 w1 = 1; w2 = 0;
    #10 w1 = 0; w2 = 1;
    #10 w1 = 1; w2 = 1;


    #50 $finish;
  end

  always #5 Clock = ~Clock;

endmodule
