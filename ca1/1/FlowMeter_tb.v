`timescale 1ns/1ps

module FlowMeter_tb;

  reg [4:0] ABCDE;         // Input representing flow conditions
  reg [5:0] flow_rate;     // Input representing flow rate
  wire Y;                 // Output Y
  wire Z;                 // Output Z

  // Instantiate the FlowMeter modules
  FlowMeter UUT(
    .ABCDE(ABCDE),
    .flow_rate(flow_rate),
    .Y(Y),
    .Z(Z)
  );

  // Initial block for test stimulus
  initial begin
    // Test case 1: Flow rate less than 10 Lit/min
    ABCDE = 5'b00000;
    flow_rate = 8; // Less than 10
    #10;
    if (Y !== 1'b0 || Z !== 1'b0) $display("Test failed for case 1");

    // Test case 2: Flow rate equal to 10 Lit/min
    ABCDE = 5'b00001;
    flow_rate = 10;
    #10;
    if (Y !== 1'b0 || Z !== 1'b0) $display("Test failed for case 2");

    // Test case 3: Flow rate equal to 20 Lit/min
    ABCDE = 5'b00011;
    flow_rate = 20;
    #10;
    if (Y !== 1'b0 || Z !== 1'b1) $display("Test failed for case 3");

    // Test case 4: Flow rate equal to 30 Lit/min
    ABCDE = 5'b00111;
    flow_rate = 30;
    #10;
    if (Y !== 1'b0 || Z !== 1'b1) $display("Test failed for case 4");

    // Test case 5: Flow rate equal to 40 Lit/min
    ABCDE = 5'b01111;
    flow_rate = 40;
    #10;
    if (Y !== 1'b0 || Z !== 1'b1) $display("Test failed for case 5");

    // Test case 6: Flow rate equal to 50 Lit/min
    ABCDE = 5'b11111;
    flow_rate = 50;
    #10;
    if (Y !== 1'b0 || Z !== 1'b1) $display("Test failed for case 6");

    // Test case 7: Flow rate greater than 50 Lit/min
    ABCDE = 5'b11111;
    flow_rate = 60;
    #10;
    if (Y !== 1'b0 || Z !== 1'b0) $display("Test failed for case 7");

    // Test case 8: Flow rate between 20 and 50 Lit/min
    ABCDE = 5'b11111;
    flow_rate = 30;
    #10;
    if (Y !== 1'b0 || Z !== 1'b1) $display("Test failed for case 8");

    $stop;
  end

endmodule
