`timescale 1ns / 1ps
module ALU(
	input [31:0] ALU_In_1,
	input [31:0] ALU_In_2,
	input [3:0] ALUCtrl,
	input Sign,
	output [31:0] ALU_Out,
	output ALU_zero
	);
	

	assign ALU_Out=	(ALUCtrl==0)?(ALU_In_1 + ALU_In_2):
					(ALUCtrl==2)?(ALU_In_1 - ALU_In_2):
					(ALUCtrl==3)?(ALU_In_1 & ALU_In_2):
					(ALUCtrl==4)?(ALU_In_1 | ALU_In_2):
					(ALUCtrl==5)?(ALU_In_1 ^ ALU_In_2):
					(ALUCtrl==6)?~(ALU_In_1 | ALU_In_2):
					(ALUCtrl==7)?(ALU_In_2 << ALU_In_1):
					(ALUCtrl==8)?(ALU_In_2 >> ALU_In_1):
					(ALUCtrl==9)?({{32{ALU_In_2[31]}} , ALU_In_2} >> ALU_In_1):
					(ALUCtrl==10&&Sign==0)?(ALU_In_1 < ALU_In_2):
					(ALUCtrl==10&&Sign==1)?((ALU_In_1[31] == ALU_In_2[31])? (ALU_In_1 < ALU_In_2):ALU_In_1[31]):
					(ALUCtrl==11)?(ALU_In_1 == ALU_In_2)://beq
					(ALUCtrl==12)?((ALU_In_1[31] == 1)||(ALU_In_1 == 0))://blez
					(ALUCtrl==13)?((ALU_In_1[31] == 0)&&(ALU_In_1!=0))://bgtz
					(ALUCtrl==14)?(ALU_In_1[31])://bltz
					(ALUCtrl==15)?(ALU_In_1!=ALU_In_2)://bne
					32'b0;//0 

	assign ALU_zero = (ALU_Out); 


	     

	
endmodule