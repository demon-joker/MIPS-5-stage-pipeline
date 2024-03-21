module ForwardingUnit(
        input reset,
        input [4:0] ID_EX_RegisterRs,
        input [4:0] ID_EX_RegisterRt,
        input EX_MEM_RegWrite,
        input [4:0] EX_MEM_RegWrAddr,
        input [4:0] EX_MEM_MemWrAddr,
        input EX_MEM_MemWrite,
        input MEM_WB_RegWrite,
        input [4:0] MEM_WB_RegWrAddr,
        output reg [1:0] ForwardA,
        output reg [1:0] ForwardB,
        output reg ForwardC
        );
   

    always @ (*)
    begin
        if (reset)
        begin
            ForwardA <= 2'b00;
            ForwardB <= 2'b00;
            ForwardC <= 0;
        end
        else
        begin
            if (EX_MEM_RegWrite && (EX_MEM_RegWrAddr != 0)  && (EX_MEM_RegWrAddr == ID_EX_RegisterRs))    
                    ForwardA <= 2'b10;
            else if (MEM_WB_RegWrite && (MEM_WB_RegWrAddr != 0) && (MEM_WB_RegWrAddr == ID_EX_RegisterRs))
                    ForwardA <= 2'b01;
            else ForwardA <= 2'b00;
                    
            if (EX_MEM_RegWrite && (EX_MEM_RegWrAddr != 0) && (EX_MEM_RegWrAddr == ID_EX_RegisterRt))
                    ForwardB <= 2'b10;
            else if (MEM_WB_RegWrite && (MEM_WB_RegWrAddr != 0) && (MEM_WB_RegWrAddr == ID_EX_RegisterRt))
                    ForwardB <= 2'b01;
            else 
                ForwardB <= 2'b00;

            if ((EX_MEM_MemWrite != 0) && (EX_MEM_MemWrAddr == MEM_WB_RegWrAddr) && (MEM_WB_RegWrite == 1) && (MEM_WB_RegWrAddr != 0))
                    ForwardC <= 1'b1;
            else 
                ForwardC <= 1'b0;
        end
    end
endmodule