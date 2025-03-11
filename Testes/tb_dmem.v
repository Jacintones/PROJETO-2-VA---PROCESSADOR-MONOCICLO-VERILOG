module tb_dmem;
    reg clk;                    // Sinal de clock
    reg [31:0] address;         // Endereço de acesso à memória
    reg [31:0] writeData;       // Dados a serem escritos
    reg MemWrite;               // Controle de escrita
    reg MemRead;                // Controle de leitura
    wire [31:0] ReadData;       // Dados lidos da memória
    
    // Instância do módulo de memória (dmem)
    dmem #(64) uut (
        .clk(clk),
        .address(address),
        .writeData(writeData),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ReadData(ReadData)
    );

    // Gerador de clock
    always begin
        #5 clk = ~clk;  // Clock com período de 10 unidades de tempo
    end

    // Inicialização dos sinais
    initial begin
        // Inicializando sinais
        clk = 0;
        address = 0;
        writeData = 0;
        MemWrite = 0;
        MemRead = 0;
        
        // Teste 1: Escrever dados na memória
        #10;
        MemWrite = 1;
        address = 32'h4;           // Endereço 4
        writeData = 32'hA5A5A5A5;  // Dados a serem escritos
        #10;
        MemWrite = 0;  // Desativa MemWrite
        
        // Teste 2: Ler dados da memória
        #10;
        MemRead = 1;
        address = 32'h4;   // Endereço 4
        #10;
        MemRead = 0;  // Desativa MemRead
        // Observe a saída ReadData para verificar se os dados foram lidos corretamente
        
        // Teste 3: Teste de outra escrita
        #10;
        MemWrite = 1;
        address = 32'h8;           // Endereço 8
        writeData = 32'hDEADBEEF;  // Dados a serem escritos
        #10;
        MemWrite = 0;
        
        // Teste 4: Ler dados da memória em outro endereço
        #10;
        MemRead = 1;
        address = 32'h8;   // Endereço 8
        #10;
        MemRead = 0;  // Desativa MemRead
        // Verifique a saída ReadData para o valor que foi escrito anteriormente
        
        // Teste 5: Teste de leitura sem dados escritos
        #10;
        MemRead = 1;
        address = 32'h10;  // Endereço 16, sem dados escritos
        #10;
        MemRead = 0;
        
        // Finaliza o teste
        #10;
        $finish;
    end

    // Monitoramento das saídas
    initial begin
        $monitor("Time = %0t | Address = %h | WriteData = %h | ReadData = %h | MemWrite = %b | MemRead = %b", 
                  $time, address, writeData, ReadData, MemWrite, MemRead);
    end
endmodule
