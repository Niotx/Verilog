module Q3(input x1,x2,x3,output f);
    wire min1,min2,min3,min4;
    assign min1 = (~x1)&&(~x2)&&(~x3);
    assign min2 = (~x1)&&(x2)&&(x3);
    assign min3 = (x1)&&(~x2)&&(x3);
    assign  min4 = (x1)&&(x2)&&(~x3);
    assign f = (min1)  ||  (min2)  ||  (min3)  ||  (min4);
endmodule

