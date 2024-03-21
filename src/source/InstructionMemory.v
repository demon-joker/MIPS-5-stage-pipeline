`timescale 1ns / 1ps
module InstructionMemory(
    input [8:0] address, 
    output reg [31:0] Instruction
    );
	
	always @(*)
		case (address)

9'd0: Instruction <= {32'h00000000};
9'd1: Instruction <= {32'h8d100000};
9'd2: Instruction <= {32'h00102021};
9'd3: Instruction <= {32'h21050004};
9'd4: Instruction <= {32'h0c100010};
9'd5: Instruction <= {32'h24080004};
9'd6: Instruction <= {32'h24040000};
9'd7: Instruction <= {32'h3c010010};
9'd8: Instruction <= {32'h34290400};
9'd9: Instruction <= {32'h21290004};
9'd10: Instruction <= {32'h8d2a0000};
9'd11: Instruction <= {32'h008a2020};
9'd12: Instruction <= {32'h21080004};
9'd13: Instruction <= {32'h0106082a};
9'd14: Instruction <= {32'h1420fffa};
9'd15: Instruction <= {32'h0c100043};
9'd16: Instruction <= {32'h3c010010};
9'd17: Instruction <= {32'h34310400};
9'd18: Instruction <= {32'hae200000};
9'd19: Instruction <= {32'h20080001};
9'd20: Instruction <= {32'h2009ffff};
9'd21: Instruction <= {32'h00115021};
9'd22: Instruction <= {32'h0104082a};
9'd23: Instruction <= {32'h10200005};
9'd24: Instruction <= {32'h214a0004};
9'd25: Instruction <= {32'had490000};
9'd26: Instruction <= {32'h21080001};
9'd27: Instruction <= {32'h0104082a};
9'd28: Instruction <= {32'h1420fffb};
9'd29: Instruction <= {32'h00043021};
9'd30: Instruction <= {32'h00063080};
9'd31: Instruction <= {32'h20080001};
9'd32: Instruction <= {32'h0104082a};
9'd33: Instruction <= {32'h10200020};
9'd34: Instruction <= {32'h00004821};
9'd35: Instruction <= {32'h00005021};
9'd36: Instruction <= {32'h00095940};
9'd37: Instruction <= {32'h016a5820};
9'd38: Instruction <= {32'h02296020};
9'd39: Instruction <= {32'h8d8c0000};
9'd40: Instruction <= {32'h200dffff};
9'd41: Instruction <= {32'h11ac0010};
9'd42: Instruction <= {32'h00ab6020};
9'd43: Instruction <= {32'h8d8c0000};
9'd44: Instruction <= {32'h11ac000d};
9'd45: Instruction <= {32'h022a6020};
9'd46: Instruction <= {32'h8d8c0000};
9'd47: Instruction <= {32'h02297020};
9'd48: Instruction <= {32'h8dce0000};
9'd49: Instruction <= {32'h00ab7820};
9'd50: Instruction <= {32'h8def0000};
9'd51: Instruction <= {32'h01cf7020};
9'd52: Instruction <= {32'h01cc082a};
9'd53: Instruction <= {32'h14200002};
9'd54: Instruction <= {32'h11ac0001};
9'd55: Instruction <= {32'h0810003a};
9'd56: Instruction <= {32'h022a6020};
9'd57: Instruction <= {32'had8e0000};
9'd58: Instruction <= {32'h214a0004};
9'd59: Instruction <= {32'h0146082a};
9'd60: Instruction <= {32'h1420ffe7};
9'd61: Instruction <= {32'h21290004};
9'd62: Instruction <= {32'h0126082a};
9'd63: Instruction <= {32'h1420ffe3};
9'd64: Instruction <= {32'h21080001};
9'd65: Instruction <= {32'h08100020};
9'd66: Instruction <= {32'h03e00008};
9'd67: Instruction <= {32'h3088000f};
9'd68: Instruction <= {32'h00044902};
9'd69: Instruction <= {32'h3129000f};
9'd70: Instruction <= {32'h00045202};
9'd71: Instruction <= {32'h314a000f};
9'd72: Instruction <= {32'h00045b02};
9'd73: Instruction <= {32'h316b000f};
9'd74: Instruction <= {32'h24050834};
9'd75: Instruction <= {32'h24060000};
9'd76: Instruction <= {32'h3c014000};
9'd77: Instruction <= {32'h34270010};
9'd78: Instruction <= {32'h20010000};
9'd79: Instruction <= {32'h14280002};
9'd80: Instruction <= {32'h240c013f};
9'd81: Instruction <= {32'hacec0000};
9'd82: Instruction <= {32'h20010001};
9'd83: Instruction <= {32'h14280002};
9'd84: Instruction <= {32'h240c0106};
9'd85: Instruction <= {32'hacec0000};
9'd86: Instruction <= {32'h20010002};
9'd87: Instruction <= {32'h14280002};
9'd88: Instruction <= {32'h240c015b};
9'd89: Instruction <= {32'hacec0000};
9'd90: Instruction <= {32'h20010003};
9'd91: Instruction <= {32'h14280002};
9'd92: Instruction <= {32'h240c014f};
9'd93: Instruction <= {32'hacec0000};
9'd94: Instruction <= {32'h20010004};
9'd95: Instruction <= {32'h14280002};
9'd96: Instruction <= {32'h240c0166};
9'd97: Instruction <= {32'hacec0000};
9'd98: Instruction <= {32'h20010005};
9'd99: Instruction <= {32'h14280002};
9'd100: Instruction <= {32'h240c016d};
9'd101: Instruction <= {32'hacec0000};
9'd102: Instruction <= {32'h20010006};
9'd103: Instruction <= {32'h14280002};
9'd104: Instruction <= {32'h240c017d};
9'd105: Instruction <= {32'hacec0000};
9'd106: Instruction <= {32'h20010007};
9'd107: Instruction <= {32'h14280002};
9'd108: Instruction <= {32'h240c0107};
9'd109: Instruction <= {32'hacec0000};
9'd110: Instruction <= {32'h20010008};
9'd111: Instruction <= {32'h14280002};
9'd112: Instruction <= {32'h240c017f};
9'd113: Instruction <= {32'hacec0000};
9'd114: Instruction <= {32'h20010009};
9'd115: Instruction <= {32'h14280002};
9'd116: Instruction <= {32'h240c016f};
9'd117: Instruction <= {32'hacec0000};
9'd118: Instruction <= {32'h20c60001};
9'd119: Instruction <= {32'h00c5082a};
9'd120: Instruction <= {32'h1420ffd5};
9'd121: Instruction <= {32'h24060000};
9'd122: Instruction <= {32'h20010000};
9'd123: Instruction <= {32'h14290002};
9'd124: Instruction <= {32'h240c023f};
9'd125: Instruction <= {32'hacec0000};
9'd126: Instruction <= {32'h20010001};
9'd127: Instruction <= {32'h14290002};
9'd128: Instruction <= {32'h240c0206};
9'd129: Instruction <= {32'hacec0000};
9'd130: Instruction <= {32'h20010002};
9'd131: Instruction <= {32'h14290002};
9'd132: Instruction <= {32'h240c025b};
9'd133: Instruction <= {32'hacec0000};
9'd134: Instruction <= {32'h20010003};
9'd135: Instruction <= {32'h14290002};
9'd136: Instruction <= {32'h240c024f};
9'd137: Instruction <= {32'hacec0000};
9'd138: Instruction <= {32'h20010004};
9'd139: Instruction <= {32'h14290002};
9'd140: Instruction <= {32'h240c0266};
9'd141: Instruction <= {32'hacec0000};
9'd142: Instruction <= {32'h20010005};
9'd143: Instruction <= {32'h14290002};
9'd144: Instruction <= {32'h240c026d};
9'd145: Instruction <= {32'hacec0000};
9'd146: Instruction <= {32'h20010006};
9'd147: Instruction <= {32'h14290002};
9'd148: Instruction <= {32'h240c027d};
9'd149: Instruction <= {32'hacec0000};
9'd150: Instruction <= {32'h20010007};
9'd151: Instruction <= {32'h14290002};
9'd152: Instruction <= {32'h240c0207};
9'd153: Instruction <= {32'hacec0000};
9'd154: Instruction <= {32'h20010008};
9'd155: Instruction <= {32'h14290002};
9'd156: Instruction <= {32'h240c027f};
9'd157: Instruction <= {32'hacec0000};
9'd158: Instruction <= {32'h20010009};
9'd159: Instruction <= {32'h14290002};
9'd160: Instruction <= {32'h240c026f};
9'd161: Instruction <= {32'hacec0000};
9'd162: Instruction <= {32'h20c60001};
9'd163: Instruction <= {32'h00c5082a};
9'd164: Instruction <= {32'h1420ffd5};
9'd165: Instruction <= {32'h24060000};
9'd166: Instruction <= {32'h20010000};
9'd167: Instruction <= {32'h142a0002};
9'd168: Instruction <= {32'h240c043f};
9'd169: Instruction <= {32'hacec0000};
9'd170: Instruction <= {32'h20010001};
9'd171: Instruction <= {32'h142a0002};
9'd172: Instruction <= {32'h240c0406};
9'd173: Instruction <= {32'hacec0000};
9'd174: Instruction <= {32'h20010002};
9'd175: Instruction <= {32'h142a0002};
9'd176: Instruction <= {32'h240c045b};
9'd177: Instruction <= {32'hacec0000};
9'd178: Instruction <= {32'h20010003};
9'd179: Instruction <= {32'h142a0002};
9'd180: Instruction <= {32'h240c044f};
9'd181: Instruction <= {32'hacec0000};
9'd182: Instruction <= {32'h20010004};
9'd183: Instruction <= {32'h142a0002};
9'd184: Instruction <= {32'h240c0466};
9'd185: Instruction <= {32'hacec0000};
9'd186: Instruction <= {32'h20010005};
9'd187: Instruction <= {32'h142a0002};
9'd188: Instruction <= {32'h240c046d};
9'd189: Instruction <= {32'hacec0000};
9'd190: Instruction <= {32'h20010006};
9'd191: Instruction <= {32'h142a0002};
9'd192: Instruction <= {32'h240c047d};
9'd193: Instruction <= {32'hacec0000};
9'd194: Instruction <= {32'h20010007};
9'd195: Instruction <= {32'h142a0002};
9'd196: Instruction <= {32'h240c0407};
9'd197: Instruction <= {32'hacec0000};
9'd198: Instruction <= {32'h20010008};
9'd199: Instruction <= {32'h142a0002};
9'd200: Instruction <= {32'h240c047f};
9'd201: Instruction <= {32'hacec0000};
9'd202: Instruction <= {32'h20010009};
9'd203: Instruction <= {32'h142a0002};
9'd204: Instruction <= {32'h240c046f};
9'd205: Instruction <= {32'hacec0000};
9'd206: Instruction <= {32'h20c60001};
9'd207: Instruction <= {32'h00c5082a};
9'd208: Instruction <= {32'h1420ffd5};
9'd209: Instruction <= {32'h24060000};
9'd210: Instruction <= {32'h20010000};
9'd211: Instruction <= {32'h142b0002};
9'd212: Instruction <= {32'h240c083f};
9'd213: Instruction <= {32'hacec0000};
9'd214: Instruction <= {32'h20010001};
9'd215: Instruction <= {32'h142b0002};
9'd216: Instruction <= {32'h240c0806};
9'd217: Instruction <= {32'hacec0000};
9'd218: Instruction <= {32'h20010002};
9'd219: Instruction <= {32'h142b0002};
9'd220: Instruction <= {32'h240c085b};
9'd221: Instruction <= {32'hacec0000};
9'd222: Instruction <= {32'h20010003};
9'd223: Instruction <= {32'h142b0002};
9'd224: Instruction <= {32'h240c084f};
9'd225: Instruction <= {32'hacec0000};
9'd226: Instruction <= {32'h20010004};
9'd227: Instruction <= {32'h142b0002};
9'd228: Instruction <= {32'h240c0866};
9'd229: Instruction <= {32'hacec0000};
9'd230: Instruction <= {32'h20010005};
9'd231: Instruction <= {32'h142b0002};
9'd232: Instruction <= {32'h240c086d};
9'd233: Instruction <= {32'hacec0000};
9'd234: Instruction <= {32'h20010006};
9'd235: Instruction <= {32'h142b0002};
9'd236: Instruction <= {32'h240c087d};
9'd237: Instruction <= {32'hacec0000};
9'd238: Instruction <= {32'h20010007};
9'd239: Instruction <= {32'h142b0002};
9'd240: Instruction <= {32'h240c0807};
9'd241: Instruction <= {32'hacec0000};
9'd242: Instruction <= {32'h20010008};
9'd243: Instruction <= {32'h142b0002};
9'd244: Instruction <= {32'h240c087f};
9'd245: Instruction <= {32'hacec0000};
9'd246: Instruction <= {32'h20010009};
9'd247: Instruction <= {32'h142b0002};
9'd248: Instruction <= {32'h240c086f};
9'd249: Instruction <= {32'hacec0000};
9'd250: Instruction <= {32'h20c60001};
9'd251: Instruction <= {32'h00c5082a};
9'd252: Instruction <= {32'h1420ffd5};
9'd253: Instruction <= {32'h0c100043};




             default: Instruction <= 32'h00000000;


		endcase
		
endmodule
