module testbench();

    reg clk;
    reg reset;
    wire [31:0] PC;
    wire [31:0] ReadData1, ReadData2; // Sinais de leitura dos registradores

    // Instancia o processador
    main uut (
        .clk(clk),
        .reset(reset),
        .PC(PC)
    );

    // Clock gerado para a simulação
    always begin
        #5 clk = ~clk;  // Toggling a cada 5 unidades de tempo
    end

    // Inicialização do teste
    initial begin
        // Inicializa sinais
        clk = 0;
        reset = 1;
        #10 reset = 0;  // Desativa o reset após 10 unidades de tempo

        // Observe os valores lidos dos registradores
        $monitor("PC: %h, ReadData1: %h, ReadData2: %h", PC, ReadData1, ReadData2);

        // Simule o clock e as operações do processador
        #1000; // Execute por 1000 unidades de tempo
        $finish; // Fim da simulação
    end

endmodule
