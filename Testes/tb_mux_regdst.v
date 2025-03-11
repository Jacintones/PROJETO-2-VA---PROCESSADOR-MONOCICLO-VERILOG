module tb_mux_regdst;

    // Declaração de sinais
    reg [4:0] rt, rd;           // Campos rt e rd da instrução
    reg RegDst;                 // Sinal de controle RegDst
    wire [4:0] WriteRegister;   // Resultado da saída do multiplexador

    // Instância do módulo mux_regdst
    mux_regdst uut (
        .rt(rt),
        .rd(rd),
        .RegDst(RegDst),
        .WriteRegister(WriteRegister)
    );

    // Bloco inicial para configurar e testar
    initial begin
        // Inicializando variáveis
        rt = 5'b10101;  // Exemplo de valor para rt
        rd = 5'b11011;  // Exemplo de valor para rd

        // Teste 1: RegDst = 0 (Seleciona rt)
        RegDst = 0;
        #10;  // Espera 10 unidades de tempo (um ciclo de clock)
        $display("Teste 1: RegDst = 0, WriteRegister = %b", WriteRegister); // Esperado: 10101 (valor de rt)

        // Teste 2: RegDst = 1 (Seleciona rd)
        RegDst = 1;
        #10;
        $display("Teste 2: RegDst = 1, WriteRegister = %b", WriteRegister); // Esperado: 11011 (valor de rd)

        // Teste 3: RegDst = 0 (Seleciona rt novamente)
        RegDst = 0;
        #10;
        $display("Teste 3: RegDst = 0, WriteRegister = %b", WriteRegister); // Esperado: 10101 (valor de rt)

        // Teste 4: RegDst = 1 (Seleciona rd novamente)
        RegDst = 1;
        #10;
        $display("Teste 4: RegDst = 1, WriteRegister = %b", WriteRegister); // Esperado: 11011 (valor de rd)

        // Finaliza a simulação
        $finish;
    end

endmodule
