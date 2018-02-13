module alu_reg(
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
	output reg [7:0] result,
	output wire [7:0] input1,
	output reg [7:0] input2,
	output reg ovf,
	output reg take_branch
);
	// reg file outpus
	reg [8:0] reg_data0;
	reg [8:0] reg_data1;
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
	
