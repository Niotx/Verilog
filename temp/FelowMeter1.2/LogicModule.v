module LogicModule(input wire [4:0] abcde, output reg y, output reg z);

    always @(abcde) begin
        y = (abcde < 30);
        z = (abcde >= 20) && (abcde <= 50);
    end

endmodule
