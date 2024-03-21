`timescale 1ns / 1ps
`define PERIOD 10
module CPU_tb();
    reg clk;
    reg rst;
    wire [11:0] BCD;
    initial begin
    forever
    #(`PERIOD/2) clk = ~clk;
    end
    // Adder Instance
    top top_1 (
    .sysclk (clk),
    .reset(rst),
    .BCD_out(BCD)
    );

    initial begin
    $display("Stimulation Start.");
    rst = 1'b0;
    clk = 1'b1;

    #(`PERIOD*500)
    rst = 1'b1;
    #(`PERIOD*500)
    rst = 1'b0;
    #(`PERIOD*20000000);
    $finish;
    end

endmodule