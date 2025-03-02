`timescale 1ns/1ps

module tb_PC;

    reg clk;
    reg [31:0] nextPC;
    wire [31:0] PC;

    // Instanciando o módulo do PC
    ProgramCounter uut (
        .clk(clk),
        .nextPC(nextPC),
        .PC(PC)
    );

    // Geração do clock (50 MHz, por exemplo)
    always #10 clk = ~clk;

    initial begin
        // Inicialização
        clk = 0;
        nextPC = 32'h00000000;

        // Teste 1: Primeira atualização do PC
        #20;
        nextPC = 32'h00000004;
        #20;
        
        // Teste 2: Próximo incremento
        nextPC = 32'h00000008;
        #20;

        // Teste 3: Pular para um endereço específico
        nextPC = 32'h00000020;
        #20;

        // Finaliza simulação
        $stop;
    end

endmodule
