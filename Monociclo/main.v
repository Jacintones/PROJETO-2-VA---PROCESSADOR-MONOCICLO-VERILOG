module main (clk, opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc, address, writeData, ReadData, nextPC, PC);
	//Descrição das Entradas e Sinais:
	input wire [5:0] opcode; //6 bits com o opcode da instrucao
	input wire clk;          //Clk do monociclo
	output wire RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, PCSrc; //Saidas do modulo de controle
	output wire [3:0] ALUOp; //Codigo com a operacao da ALU
	
	input wire [31:0] address;     // Endereço de acesso (fornecido pela ULA)
   input wire [31:0] writeData;   // Dado a ser escrito (fornecido pelo regfile)
   output wire [31:0] ReadData;    // Saída da memória (dado lido)
	
	input wire [31:0] nextPC;       // Próximo valor do PC
   output wire [31:0] PC;
	
	control ctrl(clk, opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);

	dmem teste(clk, address, writeData, MemWrite, MemRead, ReadData);

	PC pc(clk, nextPC, PC);
	
endmodule