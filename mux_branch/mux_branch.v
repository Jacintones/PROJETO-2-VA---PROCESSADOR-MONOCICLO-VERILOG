module mux_branch (
    input [31:0] branch_addr,   // Endereço de salto
    input [31:0] pc_plus4,      // Endereço do próximo PC (PC + 4)
    input branch,               // Sinal de controle (1 para branch, 0 para PC + 4)
    output [31:0] mux_out      // Saída do multiplexador
);

    // Seleção com base no sinal de controle
    assign mux_out = (branch) ? branch_addr : pc_plus4;

endmodule
