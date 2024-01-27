module ConsecutiveZerosOnesDetector_tb;

  // Inputs
    reg A, B, C, D;
  
  // Output
    wire Z;

  // Instantiate the module
    ConsecutiveZerosOnesDetector uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Z(Z)
    );

  // Clock generation (not used in this example)
    reg clk;
    always #5 clk = ~clk;

  // Initial block
    initial begin
    // Test case 1: Three consecutive zeros
        A = 1; B = 0; C = 0; D = 0;
        #10 $display("Case 1: A=%b, B=%b, C=%b, D=%b, Z=%b", A, B, C, D, Z);
    
    // Test case 2: Three consecutive ones
        A = 0; B = 1; C = 1; D = 1;
        #10 $display("Case 2: A=%b, B=%b, C=%b, D=%b, Z=%b", A, B, C, D, Z);
    
    // Test case 3: No consecutive zeros or ones
        A = 1; B = 0; C = 1; D = 0;
        #10 $display("Case 3: A=%b, B=%b, C=%b, D=%b, Z=%b", A, B, C, D, Z);

    // Add more test cases as needed

    // End simulation
        #10 $finish;
    end

endmodule
