module eightbit_palu(
		input signed [7:0] a,
		input signed [7:0] b,
		input [1:0] s, 
		output [7:0] f, 
		output ovf
	);
	// module-local registers
	reg [7:0] f_reg, ovf_reg;
	// continuous assignment to outputs from module-local registers
	assign f = f_reg;
	assign ovf = ovf_reg;
	always @(a, b, s) begin
		// operations on 'f'
		case(s)
			0: f_reg = a + b;
			1: f_reg = ~b;
			2: f_reg = a & b;
			3: f_reg = a | b;
		endcase
		// overflow check for addition
		ovf_reg = (s == 0) && (f[7] != a[7]) && (f[7] != b[7]);
	end
endmodule
