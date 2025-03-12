module main (
    input wire clk,            // Clock principal
    input wire reset,          // Sinal de reset
    output wire [31:0] PC_out, // Valor atual do PC
    output wire [31:0] ALUResult, // Saída da ULA
    output wire [31:0] MemData  // Saída da Memória de Dados
);

    // Declaração de fios para conexão entre módulos
    wire [31:0] nextPC, instruction, WriteData;
    wire [31:0] ReadData1, ReadData2, SignExtended, ALUSrcB;
    wire [4:0] WriteRegister;
    wire [3:0] ALUControlSignal;
    wire [1:0] JumpSignal;
    wire [3:0] ALUOp;
    wire RegDst, Jump, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, PCSrc;
    wire ZeroFlag, BranchTaken;

    // Registrador de Programa (PC)
    PC pc_reg (
        .clk(clk),
        .nextPC(nextPC),
        .PC(PC_out)
    );

    // Memória de Instruções
    I_MEM instr_mem (
        .address(PC_out),
        .i_out(instruction)
    );

    // Unidade de Controle
    control ctrl (
        .clk(clk),
        .opcode(instruction[31:26]),
        .RegDst(RegDst),
        .Jump(JumpSignal),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc)
    );

    // Banco de Registradores
    REGFILE regfile (
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

    // Extensor de Sinal
    assign SignExtended = {{16{instruction[15]}}, instruction[15:0]}; // Extensão de sinal

    // Multiplexador para escolher o registrador de destino (RegDst)
    mux_regdst mux_reg (
        .rt(instruction[20:16]),
        .rd(instruction[15:11]),
        .RegDst(RegDst),
        .WriteRegister(WriteRegister)
    );

    // Unidade de Controle da ALU
    ALUControl alu_ctrl (
        .ALUOp(ALUOp),
        .funct(instruction[5:0]),
        .ALUControl(ALUControlSignal)
    );

    // Multiplexador para escolher a fonte do operando B (ALUSrc)
    mux_alusrc mux_alu (
        .read_data2(ReadData2),
        .sign_extended(SignExtended),
        .alusrc(ALUSrc),
        .alusrc_result(ALUSrcB)
    );

    // Unidade Lógica e Aritmética (ULA)
    ALU alu (
        .ALUSelector(ALUControlSignal),
        .A(ReadData1),
        .B(ALUSrcB),
        .result(ALUResult),
        .zero_flag(ZeroFlag)
    );

    // Multiplexador para decidir se o branch é tomado
    assign BranchTaken = Branch & ZeroFlag;
    mux_branch mux_branch_pc (
        .branchAddr(PC_out + (SignExtended << 2)),
        .pc_plus4(PC_out + 4),
        .branchTaken(BranchTaken),
        .mux_out(nextPC)
    );

    // Memória de Dados
    dmem data_mem (
        .clk(clk),
        .address(ALUResult),
        .writeData(ReadData2),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ReadData(MemData) // Saída da Memória de Dados
    );

    // Multiplexador para escolher entre resultado da ALU ou Memória (MemToReg)
    mux_memtoreg mux_mem (
        .MemtoReg(MemToReg),
        .ALUResult(ALUResult),
        .MemData(MemData),
        .WriteData(WriteData)
    );

endmodule
