module main (
    input wire clk,         // Clock do processador
    input wire reset,       // Reset geral do processador
    output wire [31:0] PC   // Saída do Program Counter
);

    // Sinais de controle da unidade de controle
    wire RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
    wire [3:0] ALUOp;

    // Sinais de interconexão
    wire [31:0] instruction;     // Instrução lida da memória de instrução
    reg [31:0] nextPC;           // ✅ `nextPC` agora é `reg` para permitir atribuição dentro do `always`
    wire [31:0] ReadData1, ReadData2, WriteData; // Dados dos registradores
    wire [31:0] ALUResult, MemData;  // ALU e memória
    wire [31:0] SignExtImm;       // Imediato estendido
    wire [4:0] WriteRegister;     // Registrador destino
    wire [31:0] ALUSrcB;          // Segundo operando da ALU
    wire zero_flag;               // Sinal da ALU para condição de zero

    // PC - Contador de Programa
    PC pc(
        .clk(clk), 
        .nextPC(nextPC), 
        .PC(PC)
    );

    // Memória de Instruções
    I_MEM instr_mem(
        .address(PC), 
        .i_out(instruction)
    );

    // Unidade de Controle
    control ctrl(
        .clk(clk), 
        .opcode(instruction[31:26]), 
        .RegDst(RegDst), 
        .Jump(Jump), 
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemToReg(MemToReg), 
        .ALUOp(ALUOp), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite)
    );

    // Banco de Registradores
    REGFILE regfile(
        .ReadAddr1(instruction[25:21]), 
        .ReadAddr2(instruction[20:16]), 
        .ReadData1(ReadData1), 
        .ReadData2(ReadData2), 
        .Clock(clk), 
        .WriteAddr(WriteRegister), 
        .WriteData(WriteData), 
        .RegWrite(RegWrite), 
        .Reset(reset)
    );

    // MUX para selecionar registrador de destino
    mux_regdst muxRegDst(
        .rt(instruction[20:16]), 
        .rd(instruction[15:11]), 
        .RegDst(RegDst), 
        .WriteRegister(WriteRegister)
    );

    // Extensão de sinal do imediato (para instruções tipo I)
    assign SignExtImm = {{16{instruction[15]}}, instruction[15:0]};

    // MUX para seleção do operando da ALU (segundo operando)
    mux_alusrc muxALUSrc(
        .read_data2(ReadData2), 
        .sign_extended(SignExtImm), 
        .alusrc(ALUSrc), 
        .alusrc_result(ALUSrcB)
    );

    // ALU - Unidade Lógica e Aritmética
    ALU alu(
        .ALUOp(ALUOp), 
        .A(ReadData1), 
        .B(ALUSrcB), 
        .result(ALUResult), 
        .zero_flag(zero_flag)
    );

    // Memória de Dados
    dmem data_mem(
        .clk(clk), 
        .address(ALUResult), 
        .writeData(ReadData2), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(MemData)
    );

    // MUX para selecionar valor escrito no registrador (Memória ou ALU)
    mux_memtoreg muxMemToReg(
        .MemtoReg(MemToReg), 
        .ALUResult(ALUResult), 
        .MemData(MemData), 
        .WriteData(WriteData)
    );

    // Cálculo dos endereços de Branch e Jump
    wire [31:0] branchAddr = PC + (SignExtImm << 2);
    wire [31:0] jumpAddr = {PC[31:28], instruction[25:0], 2'b00};
    wire branchTaken = Branch & zero_flag; // Determina se o branch será tomado
    wire [31:0] pc_branch;

    // Instanciação do MUX para Branch
    mux_branch muxBranch(
        .branchAddr(branchAddr),
        .pc_plus4(PC + 4),
        .branchTaken(branchTaken),
        .mux_out(pc_branch)
    );

    // MUX para decidir o próximo PC (com suporte a Jump)
    always @(*) begin
        if (Jump) 
            nextPC = jumpAddr;  // Salto incondicional (j, jal)
        else 
            nextPC = pc_branch; // Caminho normal ou branch
    end

endmodule
