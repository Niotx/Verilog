module CarryLookaheadUnit(Ci,A,B,S,G,P);
	parameter n = 8;
	input Ci;
	input [n-1:0] A, B;
	output G, P;
	output [n-1:0] S;
	
	wire [n:0] c, g;
	wire [n-1:0] p;
	
	assign g[0] = c[0];
	assign c[0] = Ci;
	
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
	
	generate
		wire[n:1] b;
		assign G = |b;
		assign b[n] = g[n];
		genvar j;
		for(j=1; j<n; j=j+1)
		begin: Ca1rry_in_Stage
			assign b[j] = (&p[n-1:j])&g[j];
		end
		assign P = (&p)&c[0];
	endgenerate
	
	genvar r;
	generate
		for(r=0; r<n; r=r+1)
		begin: sum
			assign S[r] = A[r] ^ B[r] ^ c[r];
		end
	endgenerate
endmodule

module HierarchicalCLA32Bit(Cin,A,B,S,Cout);
	parameter n = 4;
	parameter m = 8;

	input Cin;
	input [(n*m)-1:0] A,B;
	output [(n*m)-1:0] S;
	output Cout;

	wire[n:0] c, g;
	wire [n-1:0] p;
	
	assign c[0] = Cin;
	assign g[0] = c[0];
	
	genvar i, j;
	
	generate
		for(i=1; i<=n; i=i+1)
		begin: Carry_Between_Stages
			wire [i:0] w;
			assign w[i] = g[i];
			for(j=0; j<i; j=j+1)
			begin: Carry_Blocks
				assign w[j] = (&p[i-1:j])&g[j];
			end
			assign c[i] = |w;
		end
	endgenerate
	
	genvar k;
	generate
		for(k=0; k< n; k=k+1)
		begin: blocks
			wire [m-1:0] a, b, s;
			assign a[m-1:0] = A[((k+1)*m)-1:k*m];
			assign b[m-1:0] = B[((k+1)*m)-1:k*m];
			wire gg, pp;
			CarryLookaheadUnit CLA1(c[k], a[m-1:0], b[m-1:0], s[m-1:0], gg, pp);
			assign S[((k+1)*m)-1:k*m] = s[m-1:0];
			assign g[k+1] = gg;
			assign p[k] = pp;
		end
	endgenerate
	
	assign Cout = c[n];
	
endmodule
