module Q4_1 (input x1,x2,x3,x4,x5,output ffinal);
    wire f1,f2,f3,f4,f5;
    assign f1 = (x2)&&(~x3)&&(~x4);
    assign f2 = (~x2)&&(x3);
    assign f3 = (~x2)&&(x4);
    assign f4 = (x1)&&(x2)&&(~x4);
    assign f5 = (x1)&&(x2)&&(~x3)&&(~x5);
    assign ffinal = (f1)  ||  (f2)  ||  (f3)  ||  (f4) || (f5);
endmodule

module Q4_2(input x1,x2,x3,x4,x5,output gfinal);
    wire g1,g2,g3,g4;
    assign g1 = (x2)||(x3)||(x4);
    assign g2 = (~x2)||(~x4)||(x5);
    assign g3 = (x1)||(~x2)||(~x3);
    assign g4 = (~x2)||(x3)||(~x4)||(~x5);
    assign gfinal = (g1)  &&  (g2)  &&  (g3)  &&  (g4);
endmodule
