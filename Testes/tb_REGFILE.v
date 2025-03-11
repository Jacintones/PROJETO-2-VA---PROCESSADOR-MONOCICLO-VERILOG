module tb_REGFILE;

    // Entradas
    reg [4:0] ReadAddr1;
    reg [4:0] ReadAddr2;
    reg Clock;
    reg [4:0] WriteAddr;
    reg [31:0] WriteData;
    reg RegWrite;
    reg Reset;

    // Saídas
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;

    // Instanciando o módulo REGFILE
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
        #5 Clock = ~Clock; // Clock com período de 10 unidades de tempo
    end

    // Processo de estímulo
    initial begin
        // Inicializando sinais
        Clock = 0;
        Reset = 0;
        RegWrite = 0;
        WriteAddr = 5'b0;
        WriteData = 32'b0;
        ReadAddr1 = 5'b0;
        ReadAddr2 = 5'b0;

        // Verificando comportamento do reset
        $display("Iniciando o teste com reset.");
        Reset = 1;
        #10;
        Reset = 0;

        // Teste de escrita e leitura
        $display("Teste de escrita e leitura.");
        WriteAddr = 5'b00001; // Registrador 1
        WriteData = 32'hA5A5A5A5; // Dado a ser escrito
        RegWrite = 1;
        #10;
        RegWrite = 0;

        // Lendo os dados
        ReadAddr1 = 5'b00001; // Lendo o registrador 1
        #10;
        $display("Leitura 1: %h", ReadData1); // Esperado: A5A5A5A5

        // Teste de escrita no registrador $0 (não deve ocorrer)
        $display("Tentando escrever no registrador $0 (não deve escrever).");
        WriteAddr = 5'b00000; // Registrador $0
        WriteData = 32'hDEADBEEF;
        RegWrite = 1;
        #10;
        RegWrite = 0;

        // Lendo o registrador $0 (deve ser 0)
        ReadAddr1 = 5'b00000;
        #10;
        $display("Leitura de $0: %h", ReadData1); // Esperado: 00000000

        // Teste de reset (todos os registradores devem ir para 0)
        $display("Realizando reset.");
        Reset = 1;
        #10;
        Reset = 0;

        // Verificando se os registradores foram resetados
        ReadAddr1 = 5'b00001;
        ReadAddr2 = 5'b00000;
        #10;
        $display("Leitura após reset: %h, %h", ReadData1, ReadData2); // Esperado: 00000000, 00000000

        // Finalizando o teste
        $finish;
    end
endmodule
