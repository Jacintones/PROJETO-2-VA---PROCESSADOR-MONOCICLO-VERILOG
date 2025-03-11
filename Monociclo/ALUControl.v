module ALUControl (ALUOp, funct, ALUControl, PCregs);
	//Descrição dos sinais de entrada e saída          
	input wire [3:0] ALUOp;       // Código de operação da unidade de controle
	input wire [5:0] funct;       // Campo funct para operações tipo R
	output reg [3:0] ALUControl;  // Código para a ALU
	output reg PCregs;            // Sinal de controle para jr


	always @(*) begin
		PCregs = 0; // Inicializa a saída PCregs como 0 por padrão
		
		case(ALUOp)
			4'b0001: ALUControl = 4'b0001; // ADDI (soma imediato)
			4'b0010: ALUControl = 4'b1010; // ANDI (AND imediato)
			4'b0011: ALUControl = 4'b1011; // ORI (OR imediato)
			4'b0100: ALUControl = 4'b1100; // XORI (XOR imediato)
			4'b0101: ALUControl = 4'b0010; // BEQ (subtrai e verifica zero)
			4'b0110: ALUControl = 4'b0010; // BNE (subtrai e verifica não-zero)
			4'b0111: ALUControl = 4'b0111; // SLTI (setar menor que imediato)
			4'b1000: ALUControl = 4'b0111; // SLTIU (setar menor que imediato sem sinal)
			4'b1001: ALUControl = 4'b0000; // LUI (não usa ALU)
			4'b1010: ALUControl = 4'b0001; // LW (soma endereço)
			4'b1011: ALUControl = 4'b0001; // SW (soma endereço)
			4'b1100, 4'b1101: ALUControl = 4'b0000; // JUMP e JAL (não usam ALU)
			4'b1111: begin // Tipo R
				case(funct)
					6'd32: ALUControl = 4'b0001; // ADD
					6'd34: ALUControl = 4'b0010; // SUB
					6'd36: ALUControl = 4'b1010; // AND
					6'd37: ALUControl = 4'b1011; // OR
					6'd38: ALUControl = 4'b1100; // XOR
					6'd39: ALUControl = 4'b1101; // NOR
					6'd42: ALUControl = 4'b0111; // SLT
					6'd43: ALUControl = 4'b0111; // SLTU
					6'd00: ALUControl = 4'b0011; // SLL (shift left lógico)
					6'd02: ALUControl = 4'b0100; // SRL (shift right lógico)
					6'd03: ALUControl = 4'b0110; // SRA (shift right aritmético)
					6'd03: ALUControl = 4'b0110; // SRA (shift right aritmético)
					6'd08: begin
                        ALUControl = 4'bxxxx;  // Não realiza operação de ALU
                        PCregs = 1;            // Ativa o sinal para o mux jump
                    end
					default: ALUControl = 4'bxxxx; // Operação inválida
				endcase
				end
			default: ALUControl = 4'bxxxx; // Caso ALUOp não reconhecido
		endcase
	end
endmodule
