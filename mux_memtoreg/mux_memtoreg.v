module mux_memtoreg(
    input wire MemtoReg,          // Sinal de controle MemtoReg
    input wire [31:0] ALUResult, // Resultado da ALU
    input wire [31:0] MemData,   // Dados da memória
    output wire [31:0] WriteData // Dados a serem escritos no registrador
);
    // Seleção entre ALUResult ou MemData com base no sinal MemtoReg
    assign WriteData = (MemtoReg) ? MemData : ALUResult;
endmodule
