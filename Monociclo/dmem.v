module dmem #(parameter MEM_SIZE = 64) (
    input wire clk,               // Clock para escrita síncrona
    input wire [31:0] address,     // Endereço de acesso (fornecido pela ULA)
    input wire [31:0] writeData,   // Dado a ser escrito (fornecido pelo regfile)
    input wire MemWrite,           // Sinal de controle de escrita
    input wire MemRead,            // Sinal de controle de leitura
    output reg [31:0] ReadData     // Saída da memória (dado lido)
);

    // Memória RAM de 32 bits x MEM_SIZE palavras
    reg [31:0] memory [0:MEM_SIZE - 1];

    // Escrita na memória (SÍNCRONA, precisa do clock para funcionar no Quartus)
    always @(posedge clk) begin
        if (MemWrite)
            memory[address >> 2] <= writeData; // Armazena dados corretamente
    end

    // Leitura da memória (ASSÍNCRONA)
    always @(*) begin
        if (MemRead)
            ReadData = memory[address >> 2];
        else
            ReadData = 32'bz; // Alta impedância quando MemRead = 0
    end

endmodule
