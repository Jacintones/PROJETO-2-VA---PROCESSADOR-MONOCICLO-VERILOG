module tb_mux_branch;

  // Definindo os sinais
  reg [31:0] branchAddr;     // Endereço de branch
  reg [31:0] pc_plus4;       // Próximo endereço normal (PC + 4)
  reg branchTaken;           // Sinal indicando se o branch deve ser tomado
  wire [31:0] mux_out;       // Saída do mux (próximo valor do PC)

  // Instanciando o módulo mux_branch
  mux_branch uut (
    .branchAddr(branchAddr),
    .pc_plus4(pc_plus4),
    .branchTaken(branchTaken),
    .mux_out(mux_out)
  );

  // Gerando estímulos para os sinais
  initial begin
    // Teste 1: branchTaken = 0 (não toma o branch)
    branchAddr = 32'h12345678;  // Endereço de branch
    pc_plus4 = 32'h00000004;    // Endereço normal (PC + 4)
    branchTaken = 0;            // Não toma o branch
    #10; // Espera 10 unidades de tempo
    $display("Teste 1: branchTaken = 0, mux_out = %h", mux_out);
    
    // Teste 2: branchTaken = 1 (toma o branch)
    branchAddr = 32'h12345678;  // Endereço de branch
    pc_plus4 = 32'h00000004;    // Endereço normal (PC + 4)
    branchTaken = 1;            // Toma o branch
    #10; // Espera 10 unidades de tempo
    $display("Teste 2: branchTaken = 1, mux_out = %h", mux_out);

    // Teste 3: branchTaken = 0 (não toma o branch)
    branchAddr = 32'h87654321;  // Outro endereço de branch
    pc_plus4 = 32'h00000008;    // Outro endereço normal (PC + 4)
    branchTaken = 0;            // Não toma o branch
    #10; // Espera 10 unidades de tempo
    $display("Teste 3: branchTaken = 0, mux_out = %h", mux_out);

    // Teste 4: branchTaken = 1 (toma o branch)
    branchAddr = 32'h87654321;  // Outro endereço de branch
    pc_plus4 = 32'h00000008;    // Outro endereço normal (PC + 4)
    branchTaken = 1;            // Toma o branch
    #10; // Espera 10 unidades de tempo
    $display("Teste 4: branchTaken = 1, mux_out = %h", mux_out);

    // Finalizando a simulação
    $finish;
  end

endmodule
