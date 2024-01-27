module FlowMeter(input wire [4:0] flow_rate, output wire [4:0] y);

    assign y[4] = (flow_rate >= 50);
    assign y[3] = (flow_rate >= 40);
    assign y[2] = (flow_rate >= 30);
    assign y[1] = (flow_rate >= 20);
    assign y[0] = (flow_rate >= 10);

endmodule
