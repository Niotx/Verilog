module ConsecutiveZerosOnesDetector (
    input A, B, C, D,
    output Z
);
    assign Z = ((A & B & C) | (~A & ~B & ~C) | (B & C & D) | (~B & ~C & ~D));

endmodule
