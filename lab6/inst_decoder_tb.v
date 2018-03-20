


module inst_decode_tb();

	reg  [15:0]instr;
	wire [1:0]rs_addr;
	wire [1:0]rt_addr;
	wire [1:0]rd_addr;
	wire [3:0]opcode;
	wire [7:0]immediate;
	wire RegDst;
	wire RegWrite;
	wire ALUSrc1;
	wire ALUSrc2;
	wire [2:0]ALUOp;
	wire MemWrite;
	wire MemToReg; 
	

	Decoder dec(
		.instr    	(instr), 
		.rs_addr  	(rs_addr), 
		.rt_addr  	(rt_addr), 
		.rd_addr  	(rd_addr), 
		.opcode   	(opcode), 
		.immediate	(immediate), 
		.RegDst   	(RegDst), 
		.RegWrite 	(RegWrite), 
		.ALUSrc1  	(ALUSrc1), 
		.ALUSrc2  	(ALUSrc2), 
		.ALUOp    	(ALUOp), 
		.MemWrite	(MemWrite),
		.MemToReg	(MemToReg)
	);

	initial begin

		instr = 16'b0000_01_01_01_000000; // R
		instr = 16'b0000_00_00_00000000; // I
		instr = 16'b0000_00_00_00000000; // J
		$monitor("instr = %b, rs_addr = %b, rt_addr = %b, opcode = %b, immediate = %b, RegDst = %b, RegWrite = %b, ALUSrc1 = %b, ALUSrc2 = %b, ALUOp = %b, MemWrite = %b, MemToReg = %b", instr, rs_addr, rt_addr, opcode, immediate, RegDst, RegWrite, ALUSrc1, ALUSrc2, ALUOp, MemWrite, MemToReg);
		#10
		instr = 16'b0000_00_00_00000000; // LW
		#10
		instr = 16'b0001_00_00_00000000; // SW
		#10
		instr = 16'b0010_00_00_00_000000; // ADD
		#10
		instr = 16'b0011_00_00_00000000; // ADDI
		#10
		instr = 16'b0100_00_00_01_000000; // INV
		#10
		instr = 16'b0101_00_00_11_000000; // AND
		#10
		instr = 16'b0110_11_00_00010000; // ANDI
		#10
		instr = 16'b0111_01_11_10_000000; // OR
		#10
		instr = 16'b1000_11_00_00000000; // ORI
		#10
		instr = 16'b1001_01_00_00000000; // SRA
		#10
		instr = 16'b1010_10_00_00000000; // SLL
		#10
		instr = 16'b1011_10_00_10000001; // BEQ
		#10
		instr = 16'b1100_00_00_01000001; // BNE
		#10
		instr = 16'b1101_00_00_00_000000; // CLR
		
	end
endmodule
		
