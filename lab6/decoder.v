nput [15:0]instr,
	output [3:0]opcode,
	output [1:0]rs_addr,
	output [1:0]rt_addr,
	output [1:0]rd_addr,
	output [7:0]immediate,
	output reg RegDst,
	output reg RegWrite,
	output reg ALUSrc1,
	output reg ALUSrc2,
	output reg [2:0]ALUOp,
	output reg MemWrite,
	output reg MemToReg
);
	localparam LW   = 4'b0000;
	localparam SW   = 4'b0001;
	localparam ADD  = 4'b0010;
	localparam ADDI = 4'b0011;
	localparam INV  = 4'b0100;
	localparam AND  = 4'b0101;
	localparam ANDI = 4'b0110;
	localparam OR   = 4'b0111;
	localparam ORI  = 4'b1000;
	localparam SRA  = 4'b1001;
	localparam SLL  = 4'b1010;
	localparam BEQ  = 4'b1011;
	localparam BNE  = 4'b1100;
	localparam CLR  = 4'b1101;
	// unconditional
	assign opcode = instr[15:12];
	assign rs_addr = instr[11:10];
	assign rt_addr = instr[9:8];
	assign rd_addr = instr[7:6];
	assign immediate = instr[7:0];
	
	always @(*) begin
		case(opcode) 
			LW  : begin 
				ALUOp    <= 3'b000;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b1;
				MemWrite <= 1'b0;
				MemToReg <= 1'b1;
			end
			SW  : begin
				ALUOp <= 3'b000;
				RegDst   <= 1'b0;
				RegWrite <= 1'b0;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b1;
				MemWrite <= 1'b1;
				MemToReg <= 1'b0;
			end
			ADD : begin 
				ALUOp <= 3'b000;
				RegDst   <= 1'b1;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			ADDI: begin 
				ALUOp <= 3'b000;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b1;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			INV : begin 
				ALUOp <= 3'b001;
				RegDst   <= 1'b1;
				RegWrite <= 1'b1;
				//ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			AND : begin 
				ALUOp <= 3'b010;
				RegDst   <= 1'b1;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			ANDI: begin 
				ALUOp <= 3'b010;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b1;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			OR  : begin 
				ALUOp <= 3'b011;
				RegDst   <= 1'b1;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			ORI : begin 
				ALUOp <= 3'b011;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b1;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			SRA : begin
				 ALUOp <= 3'b100;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				//ALUSrc2  <= 1'b1;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			SLL : begin 
				ALUOp <= 3'b101;
				RegDst   <= 1'b0;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b0;
				//ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			BEQ : begin 
				ALUOp <= 3'b110;
				RegDst   <= 1'b0;
				RegWrite <= 1'b0;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			BNE : begin 
				ALUOp <= 3'b111;
				RegDst   <= 1'b0;
				RegWrite <= 1'b0;
				ALUSrc1  <= 1'b0;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
			CLR : begin 
				ALUOp <= 3'b010;
				RegDst   <= 1'b1;
				RegWrite <= 1'b1;
				ALUSrc1  <= 1'b1;
				ALUSrc2  <= 1'b0;
				MemWrite <= 1'b0;
				MemToReg <= 1'b0;
			end
		endcase
	end
endmodule

