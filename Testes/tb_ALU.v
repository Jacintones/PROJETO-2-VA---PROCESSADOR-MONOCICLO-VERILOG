module tb_ALU;

    // Definindo os sinais de entrada e saída
    reg [3:0] ALUOp;
    reg [31:0] A, B;
    wire [31:0] result;
    wire zero_flag;

    // Instanciando o módulo ALU
    ALU uut (
        .ALUOp(ALUOp),
        .A(A),
        .B(B),
        .result(result),
        .zero_flag(zero_flag)
    );

    // Procedimento inicial para aplicar os estímulos
    initial begin
        // Exibindo os resultados no console
        $display("ALU Testbench");

        // Testando soma (ADD)
        A = 32'h00000005; B = 32'h00000003; ALUOp = 4'b0001; // 5 + 3 = 8
        #10; // Aguarda 10 unidades de tempo
        $display("ADD: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando subtração (SUB)
        A = 32'h0000000A; B = 32'h00000003; ALUOp = 4'b0010; // 10 - 3 = 7
        #10;
        $display("SUB: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Shift Left Unsigned (SHL_U)
        A = 32'h00000001; B = 32'h00000002; ALUOp = 4'b0011; // 1 << 2 = 4
        #10;
        $display("SHL_U: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Shift Right Unsigned (SHR_U)
        A = 32'h00000008; B = 32'h00000002; ALUOp = 4'b0100; // 8 >> 2 = 2
        #10;
        $display("SHR_U: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Shift Left Signed (SHL_S)
        A = 32'hFFFFFFF0; B = 32'h00000002; ALUOp = 4'b0101; // -16 << 2 = -64
        #10;
        $display("SHL_S: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Shift Right Signed (SHR_S)
        A = 32'hFFFFFFF0; B = 32'h00000002; ALUOp = 4'b0110; // -16 >> 2 = -4
        #10;
        $display("SHR_S: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Menor que (LT)
        A = 32'h00000005; B = 32'h00000003; ALUOp = 4'b0111; // 5 < 3 -> 0
        #10;
        $display("LT: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Igualdade (EQ)
        A = 32'h00000005; B = 32'h00000005; ALUOp = 4'b1000; // 5 == 5 -> 1
        #10;
        $display("EQ: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando Diferença (NEQ)
        A = 32'h00000005; B = 32'h00000003; ALUOp = 4'b1001; // 5 != 3 -> 1
        #10;
        $display("NEQ: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando AND
        A = 32'h0000000F; B = 32'h00000003; ALUOp = 4'b1010; // 0xF & 0x3 = 0x3
        #10;
        $display("AND: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando OR
        A = 32'h0000000F; B = 32'h00000003; ALUOp = 4'b1011; // 0xF | 0x3 = 0xF
        #10;
        $display("OR: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando XOR
        A = 32'h0000000F; B = 32'h00000003; ALUOp = 4'b1100; // 0xF ^ 0x3 = 0xC
        #10;
        $display("XOR: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Testando NOR
        A = 32'h0000000F; B = 32'h00000003; ALUOp = 4'b1101; // ~(0xF | 0x3) = 0xFFFFFFF0
        #10;
        $display("NOR: A = %h, B = %h, result = %h, zero_flag = %b", A, B, result, zero_flag);

        // Fim da simulação
        $finish;
    end

endmodule
