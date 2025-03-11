module tb_mux_jump;

    // Declaração de sinais
    reg clk;
    reg [31:0] branchAddr, pc4, ReadData1;
    reg [1:0] select;
    wire [31:0] pcInstruction;

    // Instância do módulo mux_jump
    mux_jump uut (
        .clk(clk),
        .branchAddr(branchAddr),
        .pc4(pc4),
        .ReadData1(ReadData1),
        .select(select),
        .pcInstruction(pcInstruction)
    );

    // Geração do clock
    always begin
        #5 clk = ~clk;  // Toggle o clock a cada 5 unidades de tempo
    end

    // Bloco inicial para configurar e testar
    initial begin
        // Inicializar variáveis
        clk = 0;
        branchAddr = 32'h12345678;  // Exemplo de endereço de branch
        pc4 = 32'h87654321;         // Exemplo de PC + 4
        ReadData1 = 32'hA5A5A5A5;   // Exemplo de dado do registrador

        // Teste 1: select = 01 (branchAddr)
        select = 2'b01;
        #10;  // Aguardar 1 ciclo de clock
        $display("Teste 1: select = 01, pcInstruction = %h", pcInstruction);

        // Teste 2: select = 10 (pc4)
        select = 2'b10;
        #10;
        $display("Teste 2: select = 10, pcInstruction = %h", pcInstruction);

        // Teste 3: select = 11 (ReadData1)
        select = 2'b11;
        #10;
        $display("Teste 3: select = 11, pcInstruction = %h", pcInstruction);

        // Teste 4: select = 00 (default, pcInstruction deve ser 0)
        select = 2'b00;
        #10;
        $display("Teste 4: select = 00, pcInstruction = %h", pcInstruction);

        // Finaliza a simulação
        $finish;
    end

endmodule
