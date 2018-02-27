`timescale 1ns / 1ps

module alu_regfile(
	// inputs
	input rst, 
	input clk, 
	input RegWrite, 
	input [1:0] ReadAddr1, 
	input [1:0] ReadAddr2, 
	input [1:0] WriteAddr, 
	input [8:0] WriteData,
	input [7:0] Instr_i,
	input ALUSrc1,
	input ALUSrc2,
	input [2:0] ALUOp,
	// outputs
	output wire [7:0] result,
	output wire [7:0] input1,
	output wire [7:0] input2,
	output wire ovf,
	output wire take_branch
);
	// reg file outpus
	wire [8:0] reg_data0;
	wire [8:0] reg_data1;
	// mux'd inputs to alu

	// register file instantiation
	reg_file RegFile(
		.rst(rst),
		.wr_en(RegWrite),
		.clk(clk),
		.rd0_addr(ReadAddr1),
		.rd1_addr(ReadAddr2),
		.wr_addr(WriteAddr),
		.wr_data(WriteData),
		.rd0_data(reg_data0),
		.rd1_data(reg_data1)
	);
	
	assign input1 = ALUSrc1 ? 8'b0000_0000 : reg_data0; 
	assign input2 = ALUSrc2 ? Instr_i : reg_data1;

	// ALU instantiation
	eightbit_alu EightbitALU(
		.a(input1),
		.b(input2),
		.s(ALUOp),
		.f(result),
		.ovf(ovf),
		.take_branch(take_branch)
	);

endmodule