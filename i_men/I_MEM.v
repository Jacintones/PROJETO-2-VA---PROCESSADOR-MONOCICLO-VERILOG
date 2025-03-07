module I_MEM (address, i_out);
	parameter MEM_SIZE = 256;
	input wire [31:0] address;
	output reg [31:0] i_out;

    // Definindo a memória como um vetor de 32 bits de largura e tamanho parametrizável
    reg [31:0] memory [0:MEM_SIZE-1];

    // Inicialização da memória durante a simulação
    initial begin
        // Lê o arquivo contendo as instruções (instruções em formato hexadecimal)
        $readmemb("inst.txt", memory);
    end

    // Sempre que o endereço mudar, a instrução correspondente será lida
    always @ (address) begin
        i_out = memory[address >> 2]; // O endereço é dividido por 4, pois as instruções são de 32 bits
    end

endmodule