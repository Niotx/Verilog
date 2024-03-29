`timescale 1ns/100ps
module tb_HierarchicalCLA32Bit;
    parameter n = 32; 
    reg [n-1:0] a,b;
    reg cin;
    wire cout;
    wire [n-1:0] sum;
    HierarchicalCLA32Bit dut(
        .A(a),
        .B(b),
        .Cin(cin),
        .S(sum),
        .Cout(cout)
        );
    initial begin
        a=32'd0;
        b=32'd0;
        cin=0;
    end    
    initial begin
        #100
        #100 a=32'd0;
        #100 b=32'd0;
        #100 a=32'd1;
        #100 b=32'd1;
        #100 a=32'd2;
        #100 b=32'd2;
        #100 a=32'd3;
        #100 b=32'd3;
        #100 a=32'd4;
        #100 b=32'd4;
        #100 a=32'd5;
        #100 b=32'd5;
        #100 a=32'd6;
        #100 b=32'd6;
        #100 a=32'd7;
        #100 b=32'd7;
        #100 a=32'd8;
        #100 b=32'd8;
        #100 a=32'd9;
        #100 b=32'd9; 
        #100 a=32'd10;
        #100 b=32'd10;
        #100 a=32'd11;
        #100 b=32'd11;
        #100 a=32'd12;
        #100 b=32'd12;
        #100 a=32'd13;
        #100 b=32'd13;
        #100 a=32'd14;
        #100 b=32'd14;
        #100 a=32'd15;
        #100 b=32'd15;
        #100 a=32'd40;
        #100 b=32'd40;  
        #100 a=32'd65;
        #100 b=32'd65;
        #100 a=32'd90;
        #100 b=32'd90;
        #100 a=8'd115;
        #100 b=8'd115;
        #100 a=32'd140;
        #100 b=32'd140;
        #100 a=32'd165;
        #100 b=32'd165;
        #100 a=32'd190;
        #100 b=32'd190;
        #100 a=32'd215;
        #100 b=32'd215;
        #100 a=32'd240;
        #100 b=32'd240;
        #100 a=32'd255;
        #100 b=32'd255;
        #100;
    end
endmodule