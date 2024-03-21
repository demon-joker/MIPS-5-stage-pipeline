`timescale 1ns/1ps 
module EX_MEM(
    input reset, 
    input clk, 
    input [31:0] ALUOut, 
    input [31:0] Read_data2,
    input [4:0] MemWrAddr, 
    input [4:0] RegWrAddr, 
    input RegWrite, 
	input MemRead, 
    input MemWrite, 
    input MemtoReg,
    

    output reg [31:0] aLUOut,
    output reg [31:0] read_data2,
    output reg [4:0] memWrAddr,//此为写入存储的寄存器的地�??
    output reg [4:0] regWrAddr,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg memtoReg
    );

    always @(posedge reset or posedge clk)
    begin
        if(reset)
        begin
            aLUOut <= 0;
            read_data2 <= 0;
            memWrAddr <= 0;
            regWrAddr <= 0;
            regWrite <= 0;
            memRead <= 0;
            memWrite <= 0;
            memtoReg <= 0;
        end
        else begin
            aLUOut <= ALUOut;
            read_data2 <= Read_data2;
            memWrAddr <= MemWrAddr;
            regWrAddr <= RegWrAddr;
            regWrite <= RegWrite;
            memRead <= MemRead;
            memWrite <= MemWrite;
            memtoReg <= MemtoReg;
        end
    end
endmodule