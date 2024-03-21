`timescale 1ns / 1ps
module CPU(
    input reset, 
    input clk,
    output [11:0] BCD_out 
    );
   
    wire stall;
    wire flush;
    wire Branch;
    wire [1:0] PCSrc;
    wire BranchTaken;
    wire ALUzero;

    wire [31:0] IF_IDinstruction;

    wire RegWrite;
	wire RegDst;
	wire Jal_write;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire ALUSrc1;
	wire ALUSrc2;
	wire ExtOp;
	wire LuOp;
	wire [3:0] ALUCtrl;
	wire Sign;

    reg [31:0] pc;

    wire [4:0] Read_register1;
    wire [4:0] Read_register2;
    wire [31:0] Read_data1;
    wire [31:0] Read_data2;

    wire ID_EXbranch;
    wire ID_EXregWrite;
    wire ID_EXregDst;
    wire ID_EXmemRead;
    wire ID_EXmemWrite;
    wire ID_EXmemtoReg;
    wire ID_EXaLUSrc1;
    wire ID_EXaLUSrc2;
    wire [31:0] ID_EXrs_data;
    wire [31:0] ID_EXrt_data;
    wire [4:0] ID_EXrs;
    wire [4:0] ID_EXrt;
    wire [4:0] ID_EXrd;
    wire [31:0] ID_EXimmOrShamt;
    wire [3:0] ID_EXaLUCtrl;
    wire ID_EXsign;

    wire [31:0] EX_MEMaLUOut;
    wire [31:0] EX_MEMread_data2;
    wire [4:0] EX_MEMmemWrAddr;
    wire [4:0] EX_MEMregWrAddr;
    wire EX_MEMregWrite;
    wire EX_MEMmemRead;
    wire EX_MEMmemWrite;
    wire EX_MEMmemtoReg;

    wire [4:0] MEM_WBregWrAddr;
    wire MEM_WBregWrite;
    wire MEM_WBmemtoReg;
    wire [31:0] MEM_WBaLUOut;

    reg [31:0] IF_IDpc;
    reg [31:0] ID_EXpc;

    //
    assign BranchTaken=ID_EXbranch&&ALUzero;
    assign flush=(BranchTaken||Branch||(PCSrc!=0));
    //

    // IF begin

    wire [31:0] Instruction;
    InstructionMemory InstructionMemory(
        .address(pc[10:2]), 
        .Instruction(Instruction)
        );
    
    // IF end

    // IF/ID register begin

    wire [31:0] Instruction_in;
    assign Instruction_in=(stall)?IF_IDinstruction:
                          (flush)?0:Instruction;


    IF_ID IF_ID(
        .reset(reset), 
        .clk(clk), 
        .Instruction(Instruction_in), 
        .instruction(IF_IDinstruction)
        );
    
    // IF/ID register end

    // ID begin

    wire [5:0] OpCode;
    wire [5:0] Funct;

    assign OpCode = IF_IDinstruction[31:26];
    assign Funct = IF_IDinstruction[5:0];
    


    Control Control(
        .OpCode(OpCode), 
        .Funct(Funct), 
        .PCSrc(PCSrc),
        .RegDst(RegDst),  
        .Jal_write(Jal_write),
        .ExtOp(ExtOp), 
        .LuOp(LuOp),
        .Branch(Branch), 
        .ALUSrc1(ALUSrc1), 
        .ALUSrc2(ALUSrc2),
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg) 
        ); 
    
    ALUControl ALUControl(
        .OpCode(OpCode),
        .Funct(Funct),
        .Sign(Sign),
        .ALUCtrl(ALUCtrl)
        );


    assign Read_register1=IF_IDinstruction[25:21];//rs
    assign Read_register2=IF_IDinstruction[20:16];//rt

    wire [31:0] RFWrite_data;
    wire [31:0] MDR;
    assign RFWrite_data=
        (MEM_WBmemtoReg) ? MDR:
        MEM_WBaLUOut;

    RegisterFile RegisterFile(
        .reset(reset), 
        .clk(clk), 
        .RegWrite(MEM_WBregWrite), 
        .Read_register1(Read_register1), 
        .Read_register2(Read_register2), 
        .Write_register(MEM_WBregWrAddr), 
        .Write_data(RFWrite_data), 
        .Read_data1(Read_data1), 
        .Read_data2(Read_data2), 
        .Jal_ra_data(IF_IDpc), 
        .Jal_write(Jal_write)
        ); 

    //assign LEDs=DataMemory.RAM_data[512][11:0];
    wire [15:0] Imm;
    assign Imm = IF_IDinstruction[15:0];
    wire [31:0] ImmOrShamt;

    assign ImmOrShamt=
        (ALUSrc1 == 1)?{27'd0 , Imm[10:6]}: //Shamt
        ((LuOp == 1)?{Imm , 16'd0}:         //Lui
        (ExtOp == 1)?{{16{Imm[15]}} , Imm}: //signed extend
        {16'd0 , Imm});                     //unsigned extend 
    
    // ID end

    // ID_EX register begin

    wire [4:0] Write_register;
    assign Write_register=IF_IDinstruction[15:11];// rd




    ID_EX ID_EX(
        .reset(reset), 
        .clk(clk), 
        .stall(stall), 
        .Branch(Branch), 
        .RegWrite(RegWrite), 
        .RegDst(RegDst), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .MemtoReg(MemtoReg),
        .ALUSrc1(ALUSrc1), 
        .ALUSrc2(ALUSrc2), 
        .Read_data1(Read_data1), 
        .Read_data2(Read_data2), 
        .Read_register1(Read_register1), 
        .Read_register2(Read_register2), 
        .Write_register(Write_register), 
        .ImmOrShamt(ImmOrShamt), 
        .ALUCtrl(ALUCtrl), 
        .Sign(Sign),
        .branch(ID_EXbranch),
        .regWrite(ID_EXregWrite),
        .regDst(ID_EXregDst),
        .memRead(ID_EXmemRead),
        .memWrite(ID_EXmemWrite),
        .memtoReg(ID_EXmemtoReg),
        .aLUSrc1(ID_EXaLUSrc1),
        .aLUSrc2(ID_EXaLUSrc2),
        .rs_data(ID_EXrs_data),
        .rt_data(ID_EXrt_data),
        .rs(ID_EXrs),
        .rt(ID_EXrt),
        .rd(ID_EXrd),
        .immOrShamt(ID_EXimmOrShamt),
        .aLUCtrl(ID_EXaLUCtrl),
        .sign(ID_EXsign)
        );
    
    // ID_EX register end

   
    // EX begin
    
    wire [31:0] ALU_In1,ALU_In2;
    wire [31:0] alu_in1,alu_in2;

    wire [1:0] ForwardA;
    wire [1:0] ForwardB;

    assign alu_in1 =
        (ForwardA == 2'b00) ? ID_EXrs_data:
        (ForwardA == 2'b10) ? EX_MEMaLUOut:
        RFWrite_data;
    assign alu_in2 =
        (ForwardB == 2'b00) ? ID_EXrt_data:
        (ForwardB == 2'b10) ? EX_MEMaLUOut:
        RFWrite_data;

    assign ALU_In1=
        (ID_EXaLUSrc1) ? ID_EXimmOrShamt:
        alu_in1;
    assign ALU_In2=
        (ID_EXaLUSrc2) ? ID_EXimmOrShamt:
        alu_in2;

    wire [31:0] ALUOut;

    ALU ALU(
        .ALU_In_1(ALU_In1), 
        .ALU_In_2(ALU_In2), 
        .ALUCtrl(ID_EXaLUCtrl), 
        .Sign(ID_EXsign), 
        .ALU_Out(ALUOut), 
        .ALU_zero(ALUzero)
        );
    
    // EX end

    // EX_MEM register begin
    
    wire [4:0] RegWrAddr;
    assign RegWrAddr=(ID_EXregDst)?ID_EXrd:ID_EXrt;



    EX_MEM EX_MEM(
        .reset(reset), 
        .clk(clk), 
        .ALUOut(ALUOut), 
        .Read_data2(ID_EXrt_data), 
        .MemWrAddr(ID_EXrt), 
        .RegWrAddr(RegWrAddr), 
        .RegWrite(ID_EXregWrite), 
        .MemRead(ID_EXmemRead), 
        .MemWrite(ID_EXmemWrite), 
        .MemtoReg(ID_EXmemtoReg), 
        .aLUOut(EX_MEMaLUOut),
        .read_data2(EX_MEMread_data2),
        .memWrAddr(EX_MEMmemWrAddr),
        .regWrAddr(EX_MEMregWrAddr),
        .regWrite(EX_MEMregWrite),
        .memRead(EX_MEMmemRead),
        .memWrite(EX_MEMmemWrite),
        .memtoReg(EX_MEMmemtoReg)
        );
    
    // EX_MEM register end
    
    // MEM begin

    wire [31:0] Read_data;
    wire [31:0] MemoryWrite_data;
    wire ForwardC;
    assign MemoryWrite_data=
        ForwardC ? RFWrite_data:
        EX_MEMread_data2;
    
    DataMemory DataMemory(
        .reset(reset), 
        .clk(clk), 
        .Address(EX_MEMaLUOut[12:2]), 
        .Write_data(MemoryWrite_data), 
        .of_address(EX_MEMaLUOut[31:28]),
        .Read_data(Read_data), 
        .MemRead(EX_MEMmemRead), 
        .MemWrite(EX_MEMmemWrite),
        .BCD(BCD_out)
        );
    
    // MEM end

    // MEM_WB register begin



    MEM_WB MEM_WB(
        .reset(reset), 
        .clk(clk), 
        .Read_data(Read_data),  
        .RegWrAddr(EX_MEMregWrAddr), 
        .RegWrite(EX_MEMregWrite), 
        .MemtoReg(EX_MEMmemtoReg), 
        .ALUOut(EX_MEMaLUOut), 
        .MDR(MDR),
        .regWrAddr(MEM_WBregWrAddr),
        .regWrite(MEM_WBregWrite),
        .memtoReg(MEM_WBmemtoReg),
        .aLUOut(MEM_WBaLUOut)
        );
    
    // MEM_WB register end
    
    // Forward 

    ForwardingUnit ForwardingUnit(
        .reset(reset),
        .ID_EX_RegisterRs(ID_EXrs),
        .ID_EX_RegisterRt(ID_EXrt),
        .EX_MEM_RegWrite(EX_MEMregWrite),
        .EX_MEM_RegWrAddr(EX_MEMregWrAddr),
        .EX_MEM_MemWrAddr(EX_MEMmemWrAddr),
        .EX_MEM_MemWrite(EX_MEMmemWrite),
        .MEM_WB_RegWrite(MEM_WBregWrite),
        .MEM_WB_RegWrAddr(MEM_WBregWrAddr),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB),
        .ForwardC(ForwardC)
        );

    // Hazard

    Hazard Hazard(
        .ID_EX_MemRead(ID_EXmemRead), 
        .PCSrc(PCSrc), 
        .ID_EX_Rt(ID_EXrt), 
        .ALUSrc2(ALUSrc2), 
        .Read_register1(Read_register1), 
        .Read_register2(Read_register2), 
        .stall(stall)
        );
    
    //PC

    //

    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            pc<= 32'h00400000;
            IF_IDpc<=0;
            ID_EXpc<=0;
        end
        else 
        begin
            if(stall||Branch) 
                pc<=pc;
            else if(BranchTaken) 
                pc<=ID_EXpc+{14'd0,ID_EXimmOrShamt,2'd0};
            else 
                case(PCSrc)
                    0:pc<=pc+4;
                    1:pc<={IF_IDpc[31:28],IF_IDinstruction[25:0],2'd0};
                    2:pc<=Read_data1;
                endcase
            if(stall)
                IF_IDpc<=IF_IDpc;
            else 
                IF_IDpc<=pc+4;
            ID_EXpc<=IF_IDpc;
        end
    end
    //--------------Your code above-----------------------

endmodule
	