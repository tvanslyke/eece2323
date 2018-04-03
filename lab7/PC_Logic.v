
module PC_Logic(input clk, rst, output [7:0] count);

	reg [7:0] internal_count;
	always @(rst) internal_count <= 0;
	always @(clk) internal_count <= internal_count + 1;
	assign count = internal_count;

endmodule

