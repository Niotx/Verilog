`timescale 1ns/100ps
module test_tamrin_2_1;
parameter n = 4; 
  reg [n-1:0] a,b;
  reg cin; 
  wire cout;
  wire [n-1:0] sum;  
  CarryLookaheadAdder tb(
    .A(a),
    .B(b),
    .Cin(cin),
    .S(sum),
    .Cout(cout)
    );
  initial begin
    a=4'd0;
    b=4'd0;
    cin=0;
  end     
  initial begin
    #100
    #100 a=4'd0;
    #100 b=4'd0;
    #100 a=4'd1;
    #100 b=4'd1;
    #100 a=4'd2;
    #100 b=4'd2;
    #100 a=4'd3;
    #100 b=4'd3;
    #100 a=4'd4;
    #100 b=4'd4;
    #100 a=4'd5;
    #100 b=4'd5;
    #100 a=4'd6;
    #100 b=4'd6;
    #100 a=4'd7;
    #100 b=4'd7;
    #100 a=4'd8;
    #100 b=4'd8;
    #100 a=4'd9;
    #100 b=4'd9;
    #100 a=4'd10;
    #100 b=4'd10;
    #100 a=4'd11;
    #100 b=4'd11;
    #100 a=4'd12;
    #100 b=4'd12;
    #100 a=4'd13;
    #100 b=4'd13;
    #100 a=4'd14;
    #100 b=4'd14;
    #100 a=4'd15;
    #100 b=4'd15;
    #100;
  end
endmodule