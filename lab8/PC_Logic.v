module PC_Logic (
	input clk ,
	input rst ,
	input [7 : 0] branch_target ,
	input take_branch ,
	output reg [7 : 0] counter
);
	always @( posedge clk)
		counter <= (rst ? 0 : ( counter + ( take_branch ? branch_target : 1)));
endmodule
