


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Majid Sabbagh (sabbagh.m@husky.neu.edu)
// 
// Create Date: 08/17/2014 02:18:36 PM
// Design Name: 
// Module Name: eightbit_alu_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module pdatapath_top(
		input wire clk,
        input wire rst_general
    );
    
    wire [7:0] alu_1st_input, alu_2nd_input, alu_2nd_input_vio;
    wire [7:0] alu_output;
    wire [2:0] ALUOp;
    wire       alu_ovf_flag;
    wire       alu_take_branch_output;

    wire RegWrite;//Write enable
    //wire RegRead;//Read enable
    wire [1:0] regfile_read_address1;//source register1 address
    wire [1:0] regfile_read_address2;//source register2 address
    wire [1:0] regfile_write_address;//destination register address
    wire [8:0] regfile_write_data;//result data
    wire [8:0] read_data1;//source register1 data
    wire [8:0] read_data2;//source register2 data
    
    wire ALUSrc1, ALUSrc2;
	wire [8:0] alu_result;
    wire [8:0] zero_register;
    
    wire MemtoReg;
    wire MemWrite;
    
    wire [8:0] data_mem_out;
       
    assign zero_register = 8'b0;//ZERO constant
    /* Instantiate the reg-file, MUXes, ALU that you have created here
	
	
	
	/* Instantiate the VIO that you have created here, 
	make sure the number of probes and their width are correctly configured */

    /* Instantiate the data memory that you have created here*/

    
endmodule
