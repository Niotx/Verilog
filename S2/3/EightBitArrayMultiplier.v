module ArrayMultiplier(A, B, S);
parameter n = 4;

	input [n-1:0] A, B;
	output [2*n - 1: 0] S;
	
	wire [n-1:0] w [n-1:0];
	wire [n-1:0] z [n-1:0];
	wire [n:0] c [n-1:1];
	
	genvar i1;
	generate
		for(i1=0; i1<n; i1=i1+1)
		begin: w_level_1
			genvar j1;
			for(j1=0; j1<n; j1=j1+1)
			begin: w_level_2
				assign w[i1][j1] = B[i1] & A[j1];
			end
		end
	endgenerate
	
	assign S[0] = w[0][0];
	
	genvar i2;
	generate
		for(i2=0; i2<n-1; i2=i2+1)
		begin: z_zero
			assign z[0][i2] = w[0][i2+1];
		end
	endgenerate

	assign z[0][n-1] = 0;

	genvar i3;
	generate
		for(i3=1; i3<n; i3=i3+1)
		begin: c_zero
			assign c[i3][0] = 0;
		end
	endgenerate
	
	genvar i4;
	generate
		for(i4=1; i4<n; i4=i4+1)
		begin: z_level_1
			wire H[n-2:0];
			genvar j4;
			for(j4=0; j4<n-1; j4=j4+1)
			begin: z_level_2
			  FA u1(c[i4][j4], w[i4][j4], z[i4-1][j4], H[j4], c[i4][j4+1]);
			end
			assign S[i4] = H[0];
			genvar k4;
			for(k4=1; k4<n-1; k4=k4+1)
			begin: z_assig
				assign z[i4][k4-1] = H[k4];
			end
		end
	endgenerate
	
	genvar i5, k5;
	generate
		
		for(k5=1; k5<n; k5=k5+1)
		begin: H_first_level
			assign z[k5][n-1] = c[k5][n];
		end
		for(i5=1; i5<n; i5=i5+1)
		begin: last_z
			FA u2(c[i5][n-1],  w[i5][n-1], z[i5-1][n-1], z[i5][n-2], c[i5][n]);
		end
	endgenerate
	
	genvar i6;
	generate
		for(i6=0; i6<n; i6=i6+1)
		begin: last_sum
			assign S[i6+n] = z[n-1][i6];
		end
	endgenerate

endmodule
module FullAdder(Ci,A,B,S,Co);

	input Ci, A, B;
	output S, Co;
	assign S = A ^ B ^ Ci;
	assign Co = (A&B)|(A&Ci)|(B&Ci);

endmodule


