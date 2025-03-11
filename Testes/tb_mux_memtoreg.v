module tb_mux_memtoreg;

    // Declaração de sinais
    reg MemtoReg;
    reg [31:0] ALUResult, MemData;
    wire [31:0] WriteData;

    // Instância do módulo mux_memtoreg
    mux_memtoreg uut (
        .MemtoReg(MemtoReg),
        .ALUResult(ALUResult),
        .MemData(MemData),
        .WriteData(WriteData)
    );

    // Bloco inicial para configurar e testar
    initial begin
        // Inicializando variáveis
        ALUResult = 32'hA5A5A5A5;  // Exemplo de dado da ALU
        MemData = 32'hDEADBEEF;    // Exemplo de dado da memória

        // Teste 1: MemtoReg = 0 (Seleciona ALUResult)
        MemtoReg = 0;
        #10;  // Espera 10 unidades de tempo (um ciclo de clock)
        $display("Teste 1: MemtoReg = 0, WriteData = %h", WriteData); // Esperado: A5A5A5A5

        // Teste 2: MemtoReg = 1 (Seleciona MemData)
        MemtoReg = 1;
        #10;
        $display("Teste 2: MemtoReg = 1, WriteData = %h", WriteData); // Esperado: DEADBEEF

        // Teste 3: MemtoReg = 0 (Seleciona ALUResult novamente)
        MemtoReg = 0;
        #10;
        $display("Teste 3: MemtoReg = 0, WriteData = %h", WriteData); // Esperado: A5A5A5A5

        // Teste 4: MemtoReg = 1 (Seleciona MemData novamente)
        MemtoReg = 1;
        #10;
        $display("Teste 4: MemtoReg = 1, WriteData = %h", WriteData); // Esperado: DEADBEEF

        // Finaliza a simulação
        $finish;
    end

endmodule
