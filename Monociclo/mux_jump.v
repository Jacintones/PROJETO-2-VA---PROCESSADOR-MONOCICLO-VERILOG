	module mux_jump(clk, branchAddr, pc4, ReadData1, select, pcInstruction);

	input wire clk;
	input wire [31:0] branchAddr, pc4, ReadData1;
	input wire [1:0] select;
	output reg [31:0] pcInstruction;
	
	always @ (clk) begin
		case (select)
			2'b01: pcInstruction = branchAddr;
			2'b10: pcInstruction = pc4;
			2'b11: pcInstruction = ReadData1;
			default: pcInstruction = 32'b0; //Evitando o latch
		endcase
	end
	
endmodule