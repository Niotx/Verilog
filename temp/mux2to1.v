module mux2to1 (input x1, x2, s, output reg f);
    always @*
        f = (~s & x1) | (s & x2);
endmodule
