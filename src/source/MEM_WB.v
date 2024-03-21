`timescale 1ns/1ps
module MEM_WB(
        input reset, 
        input clk, 
        input [4:0] RegWrAddr, 
        input RegWrite,
        input MemtoReg, 
        input [31:0] Read_data, 
        input [31:0] ALUOut, 
        output reg [31:0] MDR,
        

    output reg [4:0] regWrAddr,
    output reg regWrite,
    output reg memtoReg,
    output reg [31:0] aLUOut
    );

    always @(posedge reset or posedge clk)
    begin
        if(reset)
        begin
            regWrAddr <= 0;
            regWrite <= 0;
            memtoReg <= 0;
            MDR <= 0;
            aLUOut <= 0;
        end
        else begin
            regWrAddr <= RegWrAddr;
            regWrite <= RegWrite;
            memtoReg <= MemtoReg;
            MDR <= Read_data;
            aLUOut <= ALUOut;
        end
    end
endmodule