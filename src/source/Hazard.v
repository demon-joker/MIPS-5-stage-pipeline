`timescale 1ns / 1ps
module Hazard(
    input ID_EX_MemRead, 
    input [1:0] PCSrc, 
    input [4:0] ID_EX_Rt, 
    input ALUSrc2, 
    input [4:0] Read_register1, 
    input [4:0] Read_register2, 
    output stall
    );
//Hazard负责管理load-use冒险，flush负责控制冒险中的阻塞

assign stall=
    ((ID_EX_MemRead!=0)&&(PCSrc!=1)&&(ID_EX_Rt!=0)&&    //保证前有load时，后面的use Rs或Rt不为0，且不是J型指令
    ((ID_EX_Rt==Read_register1)||                       //做出上面的限制后，Rs被使用
    ((ID_EX_Rt==Read_register2)&&(ALUSrc2==0))          //ALUSrc2=0时，Rt会被使用，也会导致冒险
    ));
    
endmodule