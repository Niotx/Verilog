module CombinedModule(input wire [4:0] flow_rate, output reg [4:0] y, output reg z);

    FlowMeter flowMeter(.flow_rate(flow_rate), .y(y));
    LogicModule logicModule(.abcde(y), .y(y[4]), .z(z));

endmodule
