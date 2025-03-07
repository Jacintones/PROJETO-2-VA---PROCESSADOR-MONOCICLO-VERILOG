module IMEM_tb;

    // Declarando os sinais
    reg [31:0] address;
    wire [31:0] i_out;

    // Instanciando o módulo I_MEM
    I_MEM #(
        .MEM_SIZE(256)
    ) uut (
        .address(address),
        .i_out(i_out)
    );

    // Inicializando o *testbench*
    initial begin
        // Definindo o endereço inicial
        address = 32'b0;
        
        // Gerando uma sequência de endereços para testar a leitura da memória
        #5 address = 32'h00000004;  // Teste do endereço 4 (instrução 1)
        #5 address = 32'h00000008;  // Teste do endereço 8 (instrução 2)
        #5 address = 32'h0000000C;  // Teste do endereço 12 (instrução 3)
        #5 address = 32'h00000010;  // Teste do endereço 16 (instrução 4)
        
        // Finalizando o teste após 25 unidades de tempo
        #5 $finish;
    end

    // Monitorando as variáveis para visualizar a execução
    initial begin
        $monitor("Address: %h, Instruction: %h", address, i_out);
    end

endmodule
