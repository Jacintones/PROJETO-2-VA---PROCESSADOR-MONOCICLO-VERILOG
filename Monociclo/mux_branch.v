module mux_branch (
    input wire [31:0] branchAddr,  // Endereço de branch
    input wire [31:0] pc_plus4,    // Próximo endereço normal (PC + 4)
    input wire branchTaken,        // Sinal indicando se o branch deve ser tomado
    output wire [31:0] mux_out     // Próximo valor do PC
);
    
    assign mux_out = (branchTaken) ? branchAddr : pc_plus4;

endmodule
