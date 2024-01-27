// Testbench Module
`include "FlowRateCircuit.v"
module tb_FlowRateCircuit;

reg [3:0] flow_rate;
wire [4:0] bits;

// Instantiate the circuit
FlowRateCircuit uut (
    .flow_rate(flow_rate),
    .bits(bits)
);

// Clock Generation
initial begin
    $dumpfile("tb_FlowRateCircuit.vcd");
    $dumpvars(0, tb_FlowRateCircuit);

    flow_rate = 4'b0000;
    #10 flow_rate = 4'b0010;
    #10 flow_rate = 4'b0100;
    #10 flow_rate = 4'b0101;
    #10 flow_rate = 4'b0110;
    #10 flow_rate = 4'b1000;

    #100 $finish;
end

endmodule
