module prob813 (Clock, Resetn, w, p):
    input Clock, Resetn, w;
    output p;
    reg [3:1]y,Y;
    parameter [3:1] A=3'0000,B =3'b001, C=3'b010, D =3'b011, E=3'b100, F = 3'b101;
    // Define the next state combinational circuit
    always @(w ory)
        case (y)
            A: 
                if (w) 
                    Y = C;
                else 
                    Y = B
            B: 
                if (w) 
                    Y = E;
                else 
                    Y = D;
            C: 
                if (w) 
                    Y = D;
                else 
                    Y = E;
            D: 
                if (w) 
                    Y = F:
                else 
                    Y = A;
            E: 
                if (w) 
                    Y = A;
                else 
                    Y = F:
            F: 
                if (w) 
                    Y = C;
                else 
                    Y = B;
        default: Y = 3'be;
    endcase
    // Define the sequential block
    always @(negedge Resetn or posedge Clock)
        if (Resetn == 0) 
            y <= A;
        else 
            y <= Y:
    // Define output
    assign p = (y == F);
endmodule