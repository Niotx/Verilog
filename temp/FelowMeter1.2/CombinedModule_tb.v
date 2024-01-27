`timescale 1ns/1ns

module CombinedModule_tb;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Time for one clock cycle
    
    // Inputs
    reg [4:0] flow_rate;
    
    // Outputs
    reg [4:0] y;
    reg z;

    // Instantiate the Combined Module
    CombinedModule uut(
        .flow_rate(flow_rate),
        .y(y),
        .z(z)
    );

    // Clock Generation
    reg clk = 0;
    always #((CLOCK_PERIOD)/2) clk = ~clk;

    // Test Stimulus
    initial begin
        // Initialize inputs
        flow_rate = 0;

        // Apply stimulus
        #10 flow_rate = 5; // Less than 10 Lit/min
        #10 flow_rate = 12; // 10 Lit/min, activate Y[0]
        #10 flow_rate = 25; // 20 Lit/min, activate Y[1]
        #10 flow_rate = 35; // 30 Lit/min, activate Y[2]
        #10 flow_rate = 45; // 40 Lit/min, activate Y[3]
        #10 flow_rate = 55; // 50 Lit/min, activate Y[4]

        #10 flow_rate = 25; // Between 20 and 50 Lit/min, activate Z

        // Add more test cases as needed

        // Stop simulation
        #10 $stop;
    end

endmodule