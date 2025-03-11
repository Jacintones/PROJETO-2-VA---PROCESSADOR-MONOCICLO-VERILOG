module tb_control;
    // Declaração de sinais de entrada
    reg clk;
    reg [5:0] opcode;
    
    // Declaração de sinais de saída
    wire RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, PCSrc;
    wire [3:0] ALUOp;
    
    // Instancia o módulo control
    control uut (
        .clk(clk),
        .opcode(opcode),
        .RegDst(RegDst),
        .Jump(Jump),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc)
    );
    
    // Geração de clock
    always begin
        #5 clk = ~clk; // Gera o clock a cada 5 unidades de tempo
    end
    
    // Inicialização e estímulos
    initial begin
        // Inicializa o sinal de clock
        clk = 0;
        
        // Inicia o código de operação
        // Testando todas as instruções possíveis
        $display("Testando todas as instruções com diferentes opcodes:\n");
        
        // Tipo-R (Opcode = 000000)
        opcode = 6'd0;  // Tipo-R (instruções como add, sub, etc)
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // addi
        opcode = 6'd8;  // addi
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // andi
        opcode = 6'd12;  // andi
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // ori
        opcode = 6'd13;  // ori
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // xori
        opcode = 6'd14;  // xori
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // beq
        opcode = 6'd4;   // beq
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // bne
        opcode = 6'd5;   // bne
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // slti
        opcode = 6'd10;  // slti
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // lw
        opcode = 6'd35;  // lw
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // sw
        opcode = 6'd43;  // sw
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // j
        opcode = 6'd2;   // j
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // jal
        opcode = 6'd3;   // jal
        #10;
        $display("Opcode: %b, RegDst: %b, Jump: %b, Branch: %b, MemRead: %b, MemToReg: %b, ALUOp: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, PCSrc: %b", 
                 opcode, RegDst, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite, PCSrc);
        
        // Termina a simulação
        $finish;
    end
endmodule
