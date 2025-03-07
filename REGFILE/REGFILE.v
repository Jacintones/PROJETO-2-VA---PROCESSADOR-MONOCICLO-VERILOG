module REGFILE(
    input [4:0] ReadAddr1,        // Endereço do primeiro registrador a ser lido
    input [4:0] ReadAddr2,        // Endereço do segundo registrador a ser lido
    output reg [31:0] ReadData1,  // Dado lido do primeiro registrador
    output reg [31:0] ReadData2,  // Dado lido do segundo registrador
    input Clock,                  // Sinal de clock (para escrita)
    input [4:0] WriteAddr,        // Endereço do registrador a ser escrito
    input [31:0] WriteData,       // Dado a ser escrito
    input RegWrite,               // Sinal de controle para habilitar a escrita
    input Reset                   // Sinal para resetar os registradores
);
    // Definindo o banco de registradores de 32 de 32 bits
    reg [31:0] registers [31:0];
    
    // Lógica de leitura assíncrona
    always @(*) begin
        ReadData1 = registers[ReadAddr1];
        ReadData2 = registers[ReadAddr2];
    end

    // Lógica de escrita síncrona com o clock
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            // Resetando todos os registradores para 0x00000000
            registers[0] <= 32'b0;  // O registrador $0 deve sempre ser 0
            registers[1] <= 32'b0;
            registers[2] <= 32'b0;
            registers[3] <= 32'b0;
            registers[4] <= 32'b0;
            registers[5] <= 32'b0;
            registers[6] <= 32'b0;
            registers[7] <= 32'b0;
            registers[8] <= 32'b0;
            registers[9] <= 32'b0;
            registers[10] <= 32'b0;
            registers[11] <= 32'b0;
            registers[12] <= 32'b0;
            registers[13] <= 32'b0;
            registers[14] <= 32'b0;
            registers[15] <= 32'b0;
            registers[16] <= 32'b0;
            registers[17] <= 32'b0;
            registers[18] <= 32'b0;
            registers[19] <= 32'b0;
            registers[20] <= 32'b0;
            registers[21] <= 32'b0;
            registers[22] <= 32'b0;
            registers[23] <= 32'b0;
            registers[24] <= 32'b0;
            registers[25] <= 32'b0;
            registers[26] <= 32'b0;
            registers[27] <= 32'b0;
            registers[28] <= 32'b0;
            registers[29] <= 32'b0;
            registers[30] <= 32'b0;
            registers[31] <= 32'b0;
        end
        else if (RegWrite && WriteAddr != 5'b0) begin
            // Caso RegWrite seja 1 e o endereço não seja o registrador $0
            registers[WriteAddr] <= WriteData;
        end
    end

endmodule
