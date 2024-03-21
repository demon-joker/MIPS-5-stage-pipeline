module ALUControl(
	input [5:0] OpCode,
	input [5:0] Funct,
	output Sign,
	output [3:0] ALUCtrl 
	);

	assign Sign=
		(OpCode==0&&Funct==6'h21)?0://addu:0:Add
		(OpCode==0&&Funct==6'h23)?0://subu:2:Sub
		(OpCode==6'h09)?0://addiu:0:Add
		(OpCode==0&&Funct==6'h2b)?0://sltu:10:(in1<in2)
		(OpCode==6'h0b)?0://sltiu:10:(in1<in2)
		1;

	assign ALUCtrl=
		(OpCode==6'h23)?0://lw:0:Add
		(OpCode==6'h20)?0://lb:0:Add
		(OpCode==6'h2b)?0://sw:0:Add
		(OpCode==6'h0f)?0://lui:0:Add
		(OpCode==0&&Funct==6'h20)?0://add:0:Add
		(OpCode==0&&Funct==6'h21)?0://addu:0:Add
		(OpCode==0&&Funct==6'h22)?2://sub:2:Sub
		(OpCode==0&&Funct==6'h23)?2://subu:2:Sub
		(OpCode==6'h08)?0://addi:0:Add
		(OpCode==6'h09)?0://addiu:0:Add
		(OpCode==0&&Funct==6'h24)?3://and:3:And
		(OpCode==0&&Funct==6'h25)?4://or:4:Or
		(OpCode==0&&Funct==6'h26)?5://xor:5:Xor
		(OpCode==0&&Funct==6'h27)?6://nor:6:Nor
		(OpCode==6'h0c)?3://andi:3:And
		(OpCode==6'h0d)?4://ori:4:Or
		(OpCode==0&&Funct==0)?7://sll:7:<<
		(OpCode==0&&Funct==6'h02)?8://srl:8:>>
		(OpCode==0&&Funct==6'h03)?9://sra:9:>>>
		(OpCode==0&&Funct==6'h2a)?10://slt:10:(in1<in2)(signed)
		(OpCode==0&&Funct==6'h2b)?10://sltu:10:(in1<in2)(unsigned)
		(OpCode==6'h0a)?10://slti:10:(in1<in2)
		(OpCode==6'h0b)?10://sltiu:10:(in1<in2)
		(OpCode==6'h04)?11://beq,==
		(OpCode==6'h06)?12://blez,<=0
		(OpCode==6'h07)?13://bgtz,>0
		(OpCode==6'h01)?14://bltz,<0
		(OpCode==6'h05)?15://bne,!=
		0;
endmodule