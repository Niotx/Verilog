`timescale 1ns/100ps
module tb_Tamrin_1;
    reg A,B,C,D,E;
    wire Y,Z;
    tamrin_1 test(.a(A),.b(B),.c(C),.d(D),.e(E),.y(Y),.z(Z));
    initial begin
        A<=0; 
        B<=0; 
        C<=0; 
        D<=0; 
        E<=0; 
        #100
        A<=1;
        #100 
        B<=1;
        #100
        C<=1;
        #100 
        D<=1;
        #100 
        E<=1;
        #100;
    end
endmodule 