`timescale 1ns / 1ps
module Control(
	input [5:0] OpCode,
	input [5:0] Funct,

	output [1:0] PCSrc,
	output RegDst,
	output Jal_write,
	output ExtOp,
	output LuOp,

	output Branch,
	output ALUSrc1,
	output ALUSrc2,

	output MemRead,
	output MemWrite,

	output RegWrite,
	output MemtoReg
	);

	assign PCSrc=
		(OpCode==6'h02)?2'b01://j
		(OpCode==6'h03)?2'b01://jal
		(OpCode==0&&Funct==6'h08)?2'b10://jr
		(OpCode==0&&Funct==6'h09)?2'b10://jalr	
		0;

	assign Branch=
		(OpCode==6'h04)?1://beq
		(OpCode==6'h05)?1://bne
		(OpCode==6'h06)?1://blez,<=0
		(OpCode==6'h07)?1://bgtz,>0
		(OpCode==6'h01)?1://bltz,<0
		0;

	assign RegWrite=
		(OpCode==6'h2b)?0://sw
		(OpCode==6'h04)?0://beq
		(OpCode==6'h05)?0://bne
		(OpCode==6'h06)?0://blez
		(OpCode==6'h07)?0://bgtz
		(OpCode==6'h01)?0://bltz
		(OpCode==6'h02)?0://j
		(OpCode==0&&Funct==6'h08)?0://jr
		(OpCode==0&&Funct==6'h09)?0://jalr
		1;

	assign RegDst=
		(OpCode==0&&Funct==6'h20)?1://add
		(OpCode==0&&Funct==6'h21)?1://addu
		(OpCode==0&&Funct==6'h22)?1://sub
		(OpCode==0&&Funct==6'h23)?1://subu
		(OpCode==0&&Funct==6'h24)?1://and
		(OpCode==0&&Funct==6'h25)?1://or
		(OpCode==0&&Funct==6'h26)?1://xor
		(OpCode==0&&Funct==6'h27)?1://nor
		(OpCode==0&&Funct==0)?1:	//sll
		(OpCode==0&&Funct==6'h02)?1://srl
		(OpCode==0&&Funct==6'h03)?1://sra
		(OpCode==0&&Funct==6'h2a)?1://slt
		(OpCode==0&&Funct==6'h2b)?1://sltu
		0;

	assign MemRead=
		(OpCode==6'h23)?1://lw
		0;

	assign MemWrite=
		(OpCode==6'h2b)?1://sw
		0;

	assign MemtoReg=
		(OpCode==6'h23)?1://lw
		0;

	assign ALUSrc1=
		(OpCode==0&&Funct==0)?1:	//sll
		(OpCode==0&&Funct==6'h02)?1://srl
		(OpCode==0&&Funct==6'h03)?1://sra
		0;

	assign ALUSrc2=
		(OpCode==6'h23)?1://lw
		(OpCode==6'h2b)?1://sw
		(OpCode==6'h0f)?1://lui
		(OpCode==6'h08)?1://addi
		(OpCode==6'h09)?1://addiu
		(OpCode==6'h0c)?1://andi
		(OpCode==6'h0d)?1://ori
		(OpCode==6'h0a)?1://slti
		(OpCode==6'h0b)?1://sltiu
		0;

	assign ExtOp=
		(OpCode==6'h0c)?0://andi
		(OpCode==6'h0d)?0://ori
		1;

	assign LuOp=
		(OpCode==6'h0f)?1://lui
		0;

	assign Jal_write=
		(OpCode==6'h03)?1://jal
		(OpCode==0&&Funct==6'h09)?1:// jalr
		0;

endmodule