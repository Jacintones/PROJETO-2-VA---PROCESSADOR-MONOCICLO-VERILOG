module PC (
    input clk,                 // Clock (síncrono, borda de subida)
    input [31:0] nextPC,       // Próximo valor do PC
    output reg [31:0] PC       // Valor atual do PC (endereça a memória de instrução)
);

    always @(posedge clk) begin
        PC <= nextPC; // Atualiza o PC a cada ciclo de clock
    end

endmodule
