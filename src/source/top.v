module top(sysclk, reset,BCD_out);
input sysclk;
input reset;
output [11:0] BCD_out;
wire clock_out;
// PLL PLL0(.clk_out1(clock_out), .reset(reset), .clk_in1(sysclk));
 //CPU CPU0(.clk(clock_out), .reset(reset),.BCD_out(BCD_out));
CPU CPU0(.clk(sysclk), .reset(reset),.BCD_out(BCD_out));
endmodule
