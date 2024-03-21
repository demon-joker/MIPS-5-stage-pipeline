`timescale 1ns/1ps
module ID_EX(
    input reset,
    input clk,
    input stall,
	input Branch,
	input RegWrite,
	input RegDst,
	input MemRead,
	input MemWrite,
	input MemtoReg,
	input ALUSrc1,
	input ALUSrc2,
    input [31:0] Read_data1,
    input [31:0] Read_data2,
    input [4:0] Read_register1,
    input [4:0] Read_register2,
    input [4:0] Write_register,
    input [31:0] ImmOrShamt,
    input [3:0] ALUCtrl,
    input Sign,

	output reg branch,
	output reg regWrite,
	output reg regDst,
	output reg memRead,
	output reg memWrite,
	output reg memtoReg,
	output reg aLUSrc1,
	output reg aLUSrc2,
    output reg [31:0] rs_data,
    output reg [31:0] rt_data,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [31:0] immOrShamt,
    output reg [3:0] aLUCtrl,
    output reg sign
);

    always @(posedge reset or posedge clk)
        if(reset)
        begin
            branch <= 0;
            regWrite <= 0;
            regDst <= 0;
            memRead <= 0;
            memWrite <= 0;
            memtoReg <= 0;
            aLUSrc1 <= 0;
            aLUSrc2 <= 0;
            rs_data <= 0;
            rt_data <= 0;
            rs <= 0;
            rt <= 0;
            rd <= 0;
            immOrShamt <= 0;
            aLUCtrl <= 0;
            sign <= 0;
        end
        else if(stall)
        begin
            branch <= 0;
            regWrite <= 0;
            regDst <= 0;
            memRead <= 0;
            memWrite <= 0;
            memtoReg <= 0;
            aLUSrc1 <= 0;
            aLUSrc2 <= 0;
            rs_data <= 0;
            rt_data <= 0;
            rs <= 0;
            rt <= 0;
            rd <= 0;
            immOrShamt <= 0;
            aLUCtrl <= 0;
            sign <= 0;
        end
        else 
        begin
            branch <= Branch;
            regWrite <= RegWrite;
            regDst <= RegDst;
            memRead <= MemRead;
            memWrite <= MemWrite;
            memtoReg <= MemtoReg;
            aLUSrc1 <= ALUSrc1;
            aLUSrc2 <= ALUSrc2;
            rs_data <= Read_data1;
            rt_data <= Read_data2;
            rs <= Read_register1;
            rt <= Read_register2;
            rd <= Write_register;
            immOrShamt <= ImmOrShamt;
            aLUCtrl <= ALUCtrl;
            sign <= Sign;
        end
endmodule