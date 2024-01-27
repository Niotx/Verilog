`timescale 1ns/100ps
module Q3_TB();
    reg X1,X2,X3;
    wire F;
    Tamrin_3 test(.x1(X1),.x2(X2),.x3(X3),.f(F));
    initial begin
        X1<=0;
        X2<=0;
        X3<=0;
        #100
        X1<=0;
        X2<=0;
        X3<=1;

        #100
        X1<=0;
        X2<=1;
        X3<=0;

        #100
        X1<=0;
        X2<=1;
        X3<=1;

        #100
        X1<=1;
        X2<=0;
        X3<=0;

        #100
        X1<=1;
        X2<=0;
        X3<=1;

        #100
        X1<=1;
        X2<=1;
        X3<=0;

        #100
        X1<=1;
        X2<=1;
        X3<=1;

        #100;
    end
endmodule