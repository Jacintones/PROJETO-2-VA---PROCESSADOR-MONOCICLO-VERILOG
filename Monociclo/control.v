
/*
#######################################################
#               DOCUMENTACAO CONTROLE                 # 
#######################################################
# Instruções do Tipo-R (OpCode):  							#		
#  -> Todas: 0  										   		#
#																		#
# Instruções do Tipo-I (Opcode):								#
# 	-> addi:  8														#
# 	-> andi:  12													#
# 	-> ori:   13													#
# 	-> xori   14													#
# 	-> beq:   4														#
# 	-> bne:   5														#
# 	-> slti:  10													#
# 	-> sltiu: 11													#
# 	-> lui:   15													#
# 	-> lw:	 35													#
# 	-> sw:	 43													#
#																		#
# Instruções do Tipo-J (Opcode): 							#
# 	-> j:     2														#
#  -> jaL:   3														#
# 																		#
#######################################################
*/


module control (clk, opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
	//Descrição das Entradas e Sinais:
	input wire [5:0] opcode; //6 bits com o opcode da instrucao
	input wire clk;
	output reg RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, PCSrc;
	output reg [1:0] Jump;
	output reg [3:0] ALUOp;
	
	always @ (posedge clk) begin
		case(opcode)
			// Instrucoes do Tipo-R
			6'd0: begin
				RegDst = 1;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd15;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 1;
				PCSrc = 0;
			end
			//addi
			6'd8: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd1;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//andi
			6'd12: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd2;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//ori
			6'd13: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd3;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//xori
			6'd14: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd4;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//beq
			6'd4: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 1;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd5;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
				PCSrc = 0;
			end
			//bne
			6'd5: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 1;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd6;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
				PCSrc = 0;
			end
			//slti
			6'd10: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd7;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//sltiu
			6'd11: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd8;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//lui
			6'd15: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 1;
				ALUOp = 4'd9;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//lw
			6'd35: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 1;
				MemToReg = 1;
				ALUOp = 4'd10;
				MemWrite = 0;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//sw
			6'd43: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd11;
				MemWrite = 1;
				ALUSrc = 1;
				RegWrite = 1;
				PCSrc = 0;
			end
			//j
			6'd2: begin
				RegDst = 0;
				Jump = 2'd1;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd12;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
				PCSrc = 0;
			end
			//jal
			6'd3: begin
				RegDst = 0;
				Jump = 2'd1;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd13;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 1;
			end
			//Caso padrão
			default: begin
				RegDst = 0;
				Jump = 2'd0;
				Branch = 0;
				MemRead = 0;
				MemToReg = 0;
				ALUOp = 4'd0;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
			end
		endcase
	end	
endmodule