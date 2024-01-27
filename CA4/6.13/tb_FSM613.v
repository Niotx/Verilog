`timescale 1ns/100ps

module tb_prob813;

  reg Clock, Resetn, w;
  wire p;

  prob813 uut (
    .Clock(Clock),
    .Resetn(Resetn),
    .w(w),
    .p(p)
  );

  initial begin
    Clock = 0;
    Resetn = 0;
    w = 0;

    #10 Resetn = 1;

    // Test Case 1
    #10 w = 0;
    #20 w = 1;
    #30 w = 0;

    // Test Case 2
    #10 w = 1;
    #20 w = 0;
    #30 w = 1;

    #50 $finish;
  end

  always #5 Clock = ~Clock;

endmodule
