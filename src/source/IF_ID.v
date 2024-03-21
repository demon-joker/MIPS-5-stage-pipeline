`timescale 1ns/1ps
module IF_ID(
    input reset,
    input clk,
    input [31:0] Instruction,
    

    output reg [31:0] instruction
);

always @ (posedge clk or posedge reset)
begin
    if(reset)
        instruction <= 32'h00000000;
    else 
    instruction <= Instruction;
end

endmodule