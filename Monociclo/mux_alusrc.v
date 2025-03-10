module mux_alusrc(
    input wire [31:0] read_data2,         // Valor do banco de registradores (ReadData2)
    input wire [31:0] sign_extended,      // Valor imediato estendido (SignExtended)
    input wire alusrc,                    // Sinal de controle ALUSrc
    output wire [31:0] alusrc_result      // Resultado que vai para a ALU
);

    // Seleção do operando para a ALU
    assign alusrc_result = (alusrc) ? sign_extended : read_data2;

endmodule
