module alu_reg_tb();
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
	wire ofv;
	wire take_branch;

	alu_reg AluReg(
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
	
	// always @(posedge clk) begin
	// 	if ($time < test_duration) begin
	// 		$display("Clock Tick (posedge t = %d): ", $time);
	// 		$display({"Inputs:\n",
	// 			"rst = %b, ",
	// 			"write enable = %b, ",
	// 			"write data = %b, ",
	// 			"instr_i = %b, ",
	// 			"mux 1 select = %b, ",
	// 			"mux 2 select = %b, ",
	// 			"ALU op = %b, "
	// 		}, rst, write_enable, write_data, instr_i, alu_src1, alu_src2, alu_op);
	// 	end
	// end
	always @(negedge clk) begin
		if ($time < test_duration) begin
			$display("Clock Tick (negedge t = %d): ", $time);
			$display({"Ouputs:\n",
				"ALU operand 1 = %b, ",
				"ALU operand 2 = %b, ",
				"ALU output = %b, ",
				"ALU ovf = %b, ",
				"ALU take_branch = %b, "
			}, alu_input1, alu_input2, alu_result, ovf, take_branch);
		end
	end
	initial begin
		clk = 0;
		rst = 0;
		read_address1 = 0;
		read_address2 = 1;
		write_enable = 1;
		write_address = 0;
		write_data = 0;
		instr_i = 0;
		alu_src1 = 0;
		alu_src2 = 0;
		alu_op = 0;
		#10  // load value into addr 0
		write_address = 0;
		write_data = 8'b1000_0000;
		#10 // load value into addr 1
		write_address = 1;
		write_data = 8'b1000_0001;
		#10 // read values into respective operands
		write_enable = 0;
		read_address1 = 0;
		read_address2 = 1;
		#10 // load into address 2 
		write_enable = 1;
		write_address = 2;
		write_data = 8'b1110_0111;
		#10 // read address 2 into operand 2
		write_enable = 0;
		read_address2 = 2;
		#10 // test reset functionality
		rst = 1;
		#10 //load values back into registers
		rst = 0;
		write_enable = 1;
		write_address = 2;
		write_data = 8'b1110_0111;
		#10  
		write_address = 0;
		write_data = 8'b1000_0000;
		#10 // read values we just loaded into operands
		write_enable = 0;
		read_address1 = 0;
		read_address2 = 2;
		
		// test multiplexers
		instr_i = 8'b1111_1111;
		#10
		alu_src1 = 1;
		alu_src2 = 0;
		#10
		alu_src1 = 0;
		alu_src2 = 1;
		#10
		alu_src1 = 1;
		alu_src2 = 1;
		#10
		alu_src1 = 0;
		alu_src2 = 0;
		#10
		alu_op = 0; // no-op
		// test ALU opcodes
		// #10
		// alu_op = 1;
		// #10
		// alu_op = 1;
		// #10
		// alu_op = 2;
		// #10
		// alu_op = 3;
		// #10
		// alu_op = 4;
		// #10
		// alu_op = 5;
		// #10
		// alu_op = 6;
		// #10
		// alu_op = 7;
		// #10
		// alu_op = 7; // noop
	end

endmodule
