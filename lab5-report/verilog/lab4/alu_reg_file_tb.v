`timescale 1ns / 1ps

module alu_regfile_tb();
	reg clk;
	always #5 clk = !clk;
	reg rst;
	reg write_enable;
	reg [1:0] read_address1;
	reg [1:0] read_address2;
	reg [1:0] write_address;
	reg [8:0] write_data;
	reg [7:0] instr_i;
	reg alu_src1;
	reg alu_src2;
	reg [2:0] alu_op;

	wire [7:0] alu_result;
	wire [7:0] alu_input1;
	wire [7:0] alu_input2;
	wire ovf;
	wire take_branch;

	alu_regfile AluReg(
		// inputs
		.rst(rst), 
		.clk(clk), 
		.RegWrite(write_enable), 
		.ReadAddr1(read_address1), 
		.ReadAddr2(read_address2), 
		.WriteAddr(write_address), 
		.WriteData(write_data),
		.Instr_i(instr_i),
		.ALUSrc1(alu_src1),
		.ALUSrc2(alu_src2),
		.ALUOp(alu_op),
		// outputs
		.result(alu_result),
		.input1(alu_input1),
		.input2(alu_input2),
		.ovf(ovf),
		.take_branch(take_branch)
	); // AluReg();

	integer test_duration = 150;
	
	initial begin
		clk = 0;
		rst = 0;
		read_address1 = 1;
		read_address2 = 1;
		write_enable = 1;
		write_address = 1;
		write_data = 0;
		instr_i = 0;
		alu_src1 = 0;
		alu_src2 = 0;
		alu_op = 0;
		#10  // 10
		rst = 1;
		#10 // 20
		rst = 0;
		// read registers
		write_enable = 0;

		#10 // 30
		// immediate
		instr_i = 1;
		// enable mux to load immediate 
		alu_src2 = 1;
		// write to reg
		write_data = 8'hab;
		write_enable = 1;
		alu_op = 0;
		#10   // 40
		write_enable = 0;
		#10   // 50
		// load immediate
		instr_i = 8'hA0;
		// and op
		alu_op = 2;
		#10   // 60
		// and reg value with instr_i
		instr_i = 8'hAB;
		alu_src1 = 1;
		alu_src2 = 0;
		#10   // 70
		write_data = alu_result; 
		#10  // 80
		write_enable = 1;
		#10   //90
		alu_op = 2; // noop
		
	
	end

endmodule
