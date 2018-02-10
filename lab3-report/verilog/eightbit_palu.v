module eightbit_palu(
		input signed [7:0] a,
		input signed [7:0] b,
		input [1:0] s, 
		output [7:0] f, 
		output ovf
	);
	always @(a, b, s) begin
		// operations on 'f'
		case(s)
			0: f = a + b;
			1: f = ~b;
			2: f = a & b;
			3: f = a | b;
		endcase
		// overflow check for addition
		ovf = (s == 0) && (f[7] != a[7]) && (f[7] != b[7]);
	end
endmodule
