module ALU (
    input [3:0] func_code,  // Código da operação (4 bits)
    input [31:0] A,         // Operando A (32 bits)
    input [31:0] B,         // Operando B (32 bits)
    output reg [31:0] result,  // Resultado da operação (32 bits)
    output reg zero_flag       // Flag zero (1 bit)
);
    // Define os códigos de operação
    parameter ADD     = 4'b0001;
    parameter SUB     = 4'b0010;
    parameter SHL_U   = 4'b0011;  // Shift Left Unsigned
    parameter SHR_U   = 4'b0100;  // Shift Right Unsigned
    parameter SHL_S   = 4'b0101;  // Shift Left Signed
    parameter SHR_S   = 4'b0110;  // Shift Right Signed
    parameter LT      = 4'b0111;  // Menor que
    parameter EQ      = 4'b1000;  // Igualdade
    parameter NEQ     = 4'b1001;  // Diferença
    parameter AND     = 4'b1010;
    parameter OR      = 4'b1011;
    parameter XOR     = 4'b1100;
    parameter NOR     = 4'b1101;

    // Lógica da ULA
    always @(*) begin
        case(func_code)
            ADD:    result = A + B;  // Soma
            SUB:    result = A - B;  // Subtração
            SHL_U:  result = A << B; // Shift Left Unsigned
            SHR_U:  result = A >> B; // Shift Right Unsigned
            SHL_S:  result = $signed(A) <<< B; // Shift Left Signed
            SHR_S:  result = $signed(A) >>> B; // Shift Right Signed
            LT:     result = (A < B) ? 32'b1 : 32'b0;  // Menor que
            EQ:     result = (A == B) ? 32'b1 : 32'b0; // Igualdade
            NEQ:    result = (A != B) ? 32'b1 : 32'b0; // Diferença
            AND:    result = A & B;  // AND
            OR:     result = A | B;  // OR
            XOR:    result = A ^ B;  // XOR
            NOR:    result = ~(A | B);  // NOR
            default: result = 32'b0;  // Caso padrão, resultado 0
        endcase

        // Atualiza a zero flag
        zero_flag = (result == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule
