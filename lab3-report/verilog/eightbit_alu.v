module eightbit_alu(
		input signed [7:0] a,
		input signed [7:0] b,
		input [2:0] s, 
		output reg [7:0] f, 
		output reg ovf, 
		output reg take_branch
	);
	always @(a, b, s) begin
		// operations on 'f'
		case(s)
			0: f = a + b;
			1: f = ~b;
			2: f = a & b;
			3: f = a | b;
			4: f = a >>> 1;
			5: f = a << 1;
			6: f = 0;
			7: f = 0;
		endcase
		// overflow check for addition
		ovf = (s == 0) && (f[7] != a[7]) && (f[7] != b[7]);
		// 'take_branch' special cases
		take_branch = ((s == 6) && (a == b)) || ((s == 7) && (a != b));
	end
endmodule
