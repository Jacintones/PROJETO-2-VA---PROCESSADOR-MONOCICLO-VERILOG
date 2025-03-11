module tb_mux_alusrc;

    // Declaração das variáveis de entrada
    reg [31:0] read_data2;           // Valor do banco de registradores (ReadData2)
    reg [31:0] sign_extended;        // Valor imediato estendido (SignExtended)
    reg alusrc;                      // Sinal de controle ALUSrc

    // Declaração da variável de saída
    wire [31:0] alusrc_result;       // Resultado que vai para a ALU

    // Instancia o módulo a ser testado
    mux_alusrc uut (
        .read_data2(read_data2),
        .sign_extended(sign_extended),
        .alusrc(alusrc),
        .alusrc_result(alusrc_result)
    );

    // Bloco de simulação
    initial begin
        // Teste 1: alusrc = 0, deve selecionar read_data2
        read_data2 = 32'hA5A5A5A5;      // Dado para read_data2
        sign_extended = 32'hDEADBEEF;   // Dado para sign_extended
        alusrc = 0;                     // Seleção de read_data2
        #10;                            // Aguarda 10 unidades de tempo
        $display("Teste 1: alusrc = 0, alusrc_result = %h", alusrc_result);
        // Verifique se alusrc_result foi igual a read_data2

        // Teste 2: alusrc = 1, deve selecionar sign_extended
        alusrc = 1;                     // Seleção de sign_extended
        #10;                            // Aguarda 10 unidades de tempo
        $display("Teste 2: alusrc = 1, alusrc_result = %h", alusrc_result);
        // Verifique se alusrc_result foi igual a sign_extended

        // Teste 3: alusrc = 0 com novos valores
        read_data2 = 32'h12345678;
        sign_extended = 32'h87654321;
        alusrc = 0;                     // Seleção de read_data2
        #10;                            // Aguarda 10 unidades de tempo
        $display("Teste 3: alusrc = 0, alusrc_result = %h", alusrc_result);
        // Verifique se alusrc_result foi igual a read_data2

        // Teste 4: alusrc = 1 com novos valores
        alusrc = 1;                     // Seleção de sign_extended
        #10;                            // Aguarda 10 unidades de tempo
        $display("Teste 4: alusrc = 1, alusrc_result = %h", alusrc_result);
        // Verifique se alusrc_result foi igual a sign_extended

        $finish; // Finaliza a simulação
    end

endmodule
