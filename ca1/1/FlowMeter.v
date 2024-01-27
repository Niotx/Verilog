module FlowMeter(
  input wire [4:0] ABCDE,   // 5-bit input representing flow conditions
  input wire [5:0] flow_rate, // Flow rate input in Liters per minute

  output wire Y,            // Output Y
  output wire Z             // Output Z
);

  // Define the thresholds for different flow rates
  parameter MIN_FLOW_10 = 10;
  parameter MIN_FLOW_20 = 20;
  parameter MIN_FLOW_30 = 30;
  parameter MIN_FLOW_40 = 40;
  parameter MIN_FLOW_50 = 50;

  // Output Y logic
  assign Y = (flow_rate < MIN_FLOW_30) ? 1'b1 : 1'b0;

  // Output Z logic
  assign Z = ((flow_rate >= MIN_FLOW_20) && (flow_rate <= MIN_FLOW_50)) ? 1'b1 : 1'b0;

endmodule
