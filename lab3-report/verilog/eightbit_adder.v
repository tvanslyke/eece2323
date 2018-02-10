module eightbit_palu(
		input signed [7:0] a,
		input signed [7:0] b,
		output [7:0] f, 
		output ovf
	);
	// module-local registers
	reg [7:0] f_reg, ovf_reg;
	// continuous assignment to outputs from module-local registers
	assign f = f_reg;
	assign ovf = ovf_reg;
	always @(a, b) begin
		f_reg = a + b;
		// overflow check for addition
		ovf_reg = (s == 0) && (f[7] != a[7]) && (f[7] != b[7]);
	end
endmodule
