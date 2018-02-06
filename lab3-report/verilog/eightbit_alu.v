module eightbit_alu(
		input signed [7:0] a,
		input signed [7:0] b,
		input [2:0] s, 
		output [7:0] f, 
		output ovf, 
		output take_branch
	);
	// module-local registers
	reg [7:0] f_reg, ovf_reg, take_branch_reg;
	always @(a, b, s) begin
		// operations on 'f'
		case(s)
			0: f_reg = a + b;
			1: f_reg = ~b;
			2: f_reg = a & b;
			3: f_reg = a | b;
			4: f_reg = a >>> 1;
			5: f_reg = a << 1;
			6: f_reg = 0;
			7: f_reg = 0;
		endcase
		// overflow check for addition
		ovf_reg = (s == 0) && ((f[7] != a[7]) || (f[7] != b[7]));
		// 'take_branch' special cases
		take_branch_reg = ((s == 6) && (a == b)) || ((s == 7) && (a != b));
	end
	// continuous assignment to outputs from module-local registers
	assign f = f_reg;
	assign ovf = ovf_reg;
	assign take_branch = take_branch_reg;
endmodule
