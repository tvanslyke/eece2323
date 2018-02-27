`timescale 1ns / 1ps

module reg_file #( parameter WIDTH = 9, DEPTH = 4 )(
	input rst, 
	input clk, 
	input wr_en, 
	input [1:0] rd0_addr, 
	input [1:0] rd1_addr, 
	input [1:0] wr_addr, 
	input [8:0] wr_data,
	output reg [8:0] rd0_data,
	output reg [8:0] rd1_data
);
	reg [WIDTH-1:0] storage [0:DEPTH-1];
	always @(posedge clk) begin
		if(rst) begin
			storage[0] <= 0;
			storage[1] <= 0;
			storage[2] <= 0;
			storage[3] <= 0;
		end else if(wr_en) begin
			storage[wr_addr] <= wr_data;
		end else begin
			rd0_data <= storage[rd0_addr];
			rd1_data <= storage[rd1_addr];
		end
	end
endmodule
