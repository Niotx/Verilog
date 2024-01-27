module CarryLookaheadAdder(Cin,A,B,S,Cout);
  parameter n = 4;
  input Cin;
  input [n-1:0] A, B;
  output Cout;
  output [n-1:0] S;
  wire [n:0] c, g;
  wire [n-1:0] p;
  assign g[0] = c[0];
  assign c[0] = Cin;
  assign Cout = c[n];
  genvar k;
  generate
    for(k=0; k<n; k=k+1)
    begin: pg
    and(g[k+1], A[k], B[k]);
    or(p[k], A[k], B[k]);
    end
  endgenerate
  genvar i;
  generate
    for(i=1; i<= n; i=i+1)
    begin: Stages
    wire [i:0]w;
    assign c[i] = |w;
    assign w[i] = g[i];
    genvar j;
    for(j=0; j<i; j=j+1)
    begin: Carry_in_Stage
      assign w[j] = (&p[i-1:j])&g[j];
    end
    end
  endgenerate
  genvar r;
  generate
    for(r=0; r<n; r=r+1)
    begin: sum
    assign S[r] = A[r] ^ B[r] ^ c[r];
    end
  endgenerate
endmodule