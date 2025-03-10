module mux_regdst (
    input wire [4:0] rt,      // Campo rt da instrução
    input wire [4:0] rd,      // Campo rd da instrução
    input wire RegDst,        // Sinal de seleção
    output wire [4:0] WriteRegister // Saída do MUX
);

    assign WriteRegister = (RegDst) ? rd : rt;

endmodule
