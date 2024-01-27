// Circuit Module
module FlowRateCircuit(
    input wire [3:0] flow_rate,
    output reg [4:0] bits
);

always @(posedge flow_rate) begin
    if (flow_rate < 4'b0011) begin
        bits <= 5'b00000; // If flow rate is less than 10 Lit/min
    end else if (flow_rate < 4'b0100) begin
        bits <= 5'b00001; // If flow rate is at least 10 Lit/min
    end else if (flow_rate < 4'b0101) begin
        bits <= 5'b00011; // If flow rate is at least 20 Lit/min
    end else if (flow_rate < 4'b0110) begin
        bits <= 5'b00111; // If flow rate is at least 30 Lit/min
    end else if (flow_rate < 4'b0111) begin
        bits <= 5'b01111; // If flow rate is at least 40 Lit/min
    end else begin
        bits <= 5'b11111; // If flow rate is at least 50 Lit/min
    end
end

endmodule

