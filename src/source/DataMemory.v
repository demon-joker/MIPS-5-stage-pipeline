`timescale 1ns / 1ps
module DataMemory(
	input reset, 
	input clk, 
	input [10:0]Address, 
	input [31:0] Write_data, 
	input [3:0] of_address,
	input MemRead, 
	input MemWrite,
	output  [31:0] Read_data, 
	output reg [11:0] BCD
	);

	reg [31:0] DataMem [511:0];

	assign Read_data = (MemRead)?DataMem[Address]:32'h0;

	integer i;
	always @ (posedge clk or posedge reset)
	begin
		if (reset)
		begin
			DataMem[0]<=32'h6;
        
			DataMem[1]<=32'h0;
			DataMem[2]<=32'h9;
			DataMem[3]<=32'h3;
			DataMem[4]<=32'h6;
			DataMem[5]<=32'hffffffff;
			DataMem[6]<=32'hffffffff;
			for (i = 7; i < 33; i = i + 1)
				DataMem[i] <= 32'h00000000;
			
			DataMem[33]<=32'h9;
			DataMem[34]<=32'h0;
			DataMem[35]<=32'hffffffff;
			DataMem[36]<=32'h3;
			DataMem[37]<=32'h4;
			DataMem[38]<=32'h1;
			for (i = 39; i < 65; i = i + 1)
				DataMem[i] <= 32'h00000000;    
			
			DataMem[65]<=32'h3;
			DataMem[66]<=32'hffffffff;
			DataMem[67]<=32'h0;
			DataMem[68]<=32'h2;
			DataMem[69]<=32'hffffffff;
			DataMem[70]<=32'h5;
			for (i = 71; i < 97; i = i + 1)
				DataMem[i] <= 32'h00000000;
			
			DataMem[97]<=32'h6;
			DataMem[98]<=32'h3;
			DataMem[99]<=32'h2;
			DataMem[100]<=32'h0;
			DataMem[101]<=32'h6;
			DataMem[102]<=32'hffffffff;
			for (i = 103; i < 129; i = i + 1)
				DataMem[i] <= 32'h00000000;
			
			DataMem[129]<=32'hffffffff;
			DataMem[130]<=32'h4;
			DataMem[131]<=32'hffffffff;
			DataMem[132]<=32'h6;
			DataMem[133]<=32'h0;
			DataMem[134]<=32'h2;
			for (i = 135; i < 161; i = i + 1)
				DataMem[i] <= 32'h00000000;  
			
			DataMem[161]<=32'hffffffff;
			DataMem[162]<=32'h1;
			DataMem[163]<=32'h5;
			DataMem[164]<=32'hffffffff;
			DataMem[165]<=32'h2;
			DataMem[166]<=32'h0;
			for (i = 167; i < 193; i = i + 1)
				DataMem[i] <= 32'h00000000;
			for (i = 193; i < 512; i = i + 1)
				DataMem[i] <= 32'h00000000;
			//Read_data <=0;
			BCD <= 12'h0;
		end
		else 
		begin
			if (MemWrite)
			begin
			if(of_address == 32'h4)
			begin
				BCD<= Write_data[11:0];
			end
			else if (Address >= 32'h00000000 && Address <= 32'h000007FF) 
			begin
				DataMem[Address] <= Write_data;
			end
			end
		end
	end                                                       
endmodule
