`timescale 1ns / 1ps
module RegisterFile(
	input reset, 
	input clk,
	input RegWrite, 
	input Jal_write,
	input [4:0] Read_register1, 
	input [4:0] Read_register2, 
	input [4:0] Write_register,
	input [31:0] Write_data,
	input [31:0] Jal_ra_data,
	output  [31:0] Read_data1,
	output  [31:0] Read_data2
	);
	
	reg [31:0] RF_data[31:1];
	

	assign Read_data1 = (Read_register1 == 5'b00000)? 32'h00000000: 
	RF_data[Read_register1];
	assign Read_data2 = (Read_register2 == 5'b00000)? 32'h00000000:
	 RF_data[Read_register2];

	integer i;
	always @(posedge clk or posedge reset)
	begin
		if (reset)
		begin
			for (i = 1; i < 29; i = i + 1)
				RF_data[i] <= 32'h00000000;

			RF_data[29] <= 32'h00F00000;
			RF_data[30] <= 32'h00000000;
			RF_data[31] <= 32'h00000000;
		end
		else 
		begin
		if (RegWrite && (Write_register>0) && (Write_register<31))
			    RF_data[Write_register] <= Write_data;
	    if (Jal_write)
                RF_data[31] <= Jal_ra_data;
        else if(Write_register == 31 && RegWrite)
                RF_data[31] <= Write_data;
        end
	end
endmodule
			