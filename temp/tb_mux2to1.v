`include "mux2to1.v"
module tb_mux2to1;

  reg x1, x2, s;
  wire f;

  // Instantiate the mux2to1 module
  mux2to1 uut (
    .x1(x1),
    .x2(x2),
    .s(s),
    .f(f)
  );

  // Apply test vectors
  initial begin
    // Test case 1: s = 0, expect f = x1
    x1 = 1; x2 = 0; s = 0;
    #10;
    if (f !== x1) $display("Test failed: Case 1");

    // Test case 2: s = 1, expect f = x2
    x1 = 1; x2 = 0; s = 1;
    #10;
    if (f !== x2) $display("Test failed: Case 2");

    // Add more test cases as needed

    $finish;
  end

endmodule
