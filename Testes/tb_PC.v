module tb_PC;

    // Declaração de variáveis de entrada
    reg clk;
    reg [31:0] nextPC;
    
    // Saída
    wire [31:0] PC;

    // Instanciando o módulo PC
    PC uut (
        .clk(clk),
        .nextPC(nextPC),
        .PC(PC)
    );

    // Geração do clock
    always begin
        #5 clk = ~clk;  // Clock com período de 10 unidades de tempo (5 de delay para borda de subida e descida)
    end

    // Inicialização do Testbench
    initial begin
        // Inicializando as variáveis
        clk = 0;
        nextPC = 32'b0;  // Inicializando nextPC com 0

        // Monitorando as variáveis de entrada e saída
        $monitor("Time = %0t | nextPC = %h | PC = %h", $time, nextPC, PC);

        // Teste 1: Atualizando o valor do PC para 0x4
        nextPC = 32'h00000004;
        #10; // Espera 10 unidades de tempo (um ciclo de clock)

        // Teste 2: Atualizando o valor do PC para 0x10
        nextPC = 32'h00000010;
        #10; // Espera mais 10 unidades de tempo (um ciclo de clock)

        // Teste 3: Atualizando o valor do PC para 0x20
        nextPC = 32'h00000020;
        #10;

        // Teste 4: Atualizando o valor do PC para 0x30
        nextPC = 32'h00000030;
        #10;

        // Teste 5: Atualizando o valor do PC para 0x40
        nextPC = 32'h00000040;
        #10;

        // Teste 6: Finaliza a simulação
        $finish;
    end

endmodule
