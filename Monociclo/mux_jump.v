module mux_jump(clk, branchAddr, pc4, ReadData1, select, PCregs, pcInstruction);

	input wire clk;
	input wire [31:0] branchAddr, pc4, ReadData1;
	input wire [1:0] select;
	input wire PCregs;
	output reg [31:0] pcInstruction;
	
	always @ (posedge clk) begin
		if (PCregs)
			pcInstruction = ReadData1;
		else begin
			case (select)
				2'b01: pcInstruction = branchAddr;
				2'b10: pcInstruction = pc4;
				default: pcInstruction = 32'b0; 
			endcase
		end
	end
	
endmodule