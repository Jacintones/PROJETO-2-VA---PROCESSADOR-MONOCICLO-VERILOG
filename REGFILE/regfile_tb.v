module regfile_tb;
    
    // Definindo os sinais
    reg [4:0] ReadAddr1, ReadAddr2;    // Endereços dos registradores para leitura
    reg Clock;                          // Sinal de clock
    reg [4:0] WriteAddr;                // Endereço do registrador para escrita
    reg [31:0] WriteData;               // Dados a serem escritos
    reg RegWrite;                       // Sinal para habilitar a escrita
    reg Reset;                          // Sinal para resetar o banco de registradores
    
    wire [31:0] ReadData1, ReadData2;   // Dados lidos do banco de registradores

    // Instanciando o módulo regfile
    REGFILE uut (
        .ReadAddr1(ReadAddr1),
        .ReadAddr2(ReadAddr2),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .Clock(Clock),
        .WriteAddr(WriteAddr),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .Reset(Reset)
    );

    // Gerador de clock
    always begin
        #5 Clock = ~Clock;  // Clock com período de 10 unidades de tempo (5 para a borda)
    end

    // Sequência de testes
    initial begin
        // Inicializando os sinais
        Clock = 0;
        Reset = 0;
        RegWrite = 0;
        WriteAddr = 0;
        WriteData = 0;
        ReadAddr1 = 0;
        ReadAddr2 = 0;

        // Teste 1: Resetando o banco de registradores
        $display("Teste 1: Resetando os registradores...");
        Reset = 1;  // Ativa o reset
        #10 Reset = 0;  // Desativa o reset após 10 unidades de tempo

        // Verificando se todos os registradores estão resetados para 0
        #5;
        if (uut.registers[0] !== 32'b0) $display("Erro: registrador $0 não está 0.");
        if (uut.registers[1] !== 32'b0) $display("Erro: registrador $1 não está 0.");
        if (uut.registers[31] !== 32'b0) $display("Erro: registrador $31 não está 0.");
        $display("------------------------------------------------");

        // Teste 2: Escrevendo e lendo de registradores
        $display("Teste 2: Escrevendo e lendo registradores...");
        WriteAddr = 5'b00001;    // Endereço do registrador 1
        WriteData = 32'h12345678; // Dado a ser escrito
        RegWrite = 1;            // Habilita a escrita
        #10 RegWrite = 0;        // Desabilita a escrita

        ReadAddr1 = 5'b00001;    // Lê o registrador 1
        #10;
        if (ReadData1 !== 32'h12345678) $display("Erro: leitura de $1 falhou.");
        
        // Teste 3: Verificando o comportamento do registrador $0
        $display("Teste 3: Verificando o registrador $0...");
        WriteAddr = 5'b00000;    // Endereço do registrador $0
        WriteData = 32'hFFFFFFFF; // Tentando escrever em $0
        RegWrite = 1;            // Habilita a escrita
        #10 RegWrite = 0;        // Desabilita a escrita

        ReadAddr1 = 5'b00000;    // Lê o registrador $0
        #10;
        if (ReadData1 !== 32'b0) $display("Erro: registrador $0 não manteve 0.");
        $display("------------------------------------------------");

        // Teste 4: Escrevendo em outros registradores
        $display("Teste 4: Escrevendo e lendo em registradores diferentes de $0...");
        WriteAddr = 5'b00010;    // Endereço do registrador 2
        WriteData = 32'hAABBCCDD; // Dado a ser escrito
        RegWrite = 1;            // Habilita a escrita
        #10 RegWrite = 0;        // Desabilita a escrita

        ReadAddr1 = 5'b00010;    // Lê o registrador 2
        #10;
        if (ReadData1 !== 32'hAABBCCDD) $display("Erro: leitura de $2 falhou.");
        $display("------------------------------------------------");

        // Teste 5: Simulando várias escritas
        $display("Teste 5: Simulando várias escritas...");
        WriteAddr = 5'b00011;    // Registrador 3
        WriteData = 32'h55555555; // Dado a ser escrito
        RegWrite = 1;
        #10 WriteData = 32'hAAAAAAAA; // Novo dado para escrever
        #10 RegWrite = 0;
        
        ReadAddr1 = 5'b00011;    // Lê o registrador 3
        #10;
        if (ReadData1 !== 32'hAAAAAAAA) $display("Erro: leitura de $3 falhou.");
        $display("------------------------------------------------");

        // Teste 6: Confirmando que o registrador $0 não pode ser alterado
        $display("Teste 6: Confirmando que $0 não pode ser alterado...");
        WriteAddr = 5'b00000;    // Endereço do registrador $0
        WriteData = 32'hDEADBEEF; // Tentando escrever em $0
        RegWrite = 1;            // Habilita a escrita
        #10 RegWrite = 0;        // Desabilita a escrita

        ReadAddr1 = 5'b00000;    // Lê o registrador $0
        #10;
        if (ReadData1 !== 32'b0) $display("Erro: registrador $0 não manteve 0.");
        $display("------------------------------------------------");

        // Finalizando o teste
        $finish;
    end

endmodule
