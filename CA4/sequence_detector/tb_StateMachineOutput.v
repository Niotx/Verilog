module tb_StateMachineOutput;

  reg clk, reset, w;
  wire z;

  StateMachineOutput uu (clk, reset, w, z);

  always #5 clk = ~clk;

  initial begin
    reset = 0;
    clk = 0;
    w = 0;
    #50;

    reset = 1;
    w = 1;
    #50;

    reset = 0;
    #50;

    reset = 1;
    w = 0;
    #50;

    // Add more test cases as needed

    $stop();

  end

endmodule
