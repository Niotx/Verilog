module ex2(clk,reset,z);

	input clk,reset;
	output reg [7:0]z;
	reg [7:0] p_state, n_state;

	parameter [7:0] A=8'd0 , B=8'd3, C=8'd12, D=8'd34, E=8'd59, F=8'd233, G=8'd24, H=8'd1, I=8'd155;

	always @ (p_state) begin
		case (p_state)

			A: begin n_state=B; end
			
			B: begin n_state=C; end  

			C: begin n_state=D; end 

			D: begin n_state=E; end  

			E: begin n_state=F; end
			
			F: begin n_state=G; end
			
			G: begin n_state=H; end

			H: begin n_state=I; end 
			
			I: begin n_state=A; end 

			default: begin n_state=A;  end
		endcase
		
		
	end

	always @(posedge reset or posedge clk)
		if (reset) p_state <= A; 
		else p_state <= n_state;

	always @( p_state) begin
 		z = A; 
 		case (p_state)
 			A: z = B;
			B: z = C;
			C: z = D;
			D: z = E;
			E: z = F;
			F: z = G;
			G: z = H;
			H: z = I;
			I: z = A;

		    
 		endcase
 	end


endmodule
