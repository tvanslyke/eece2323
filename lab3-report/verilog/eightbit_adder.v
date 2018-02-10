module eightbit_palu(
		input signed [7:0] a,
		input signed [7:0] b,
		output reg [7:0] f, 
		output reg ovf
	);
	always @(a, b) begin
		f = a + b;
		// overflow check for addition
		ovf = (s == 0) && (f[7] != a[7]) && (f[7] != b[7]);
	end
endmodule
