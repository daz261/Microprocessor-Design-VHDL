module reg_file
(input clk,
input reset,
input wire[4:0] reg1, 		//read register 1
input wire[4:0] reg2, 		//read register 2
input wire[4:0] writeReg,		//write register
input wire[31:0] WriteData,   	//input from Data Memory
input wire RegWrite,		//signal
output reg[31:0] read1,
output reg[31:0] read2); 

module in_out (input[4:0] in, output[31:0] out)
always @(*)
	Registers[5'h00] <= 32'h0;
	Register[5'h01] <= 32'h0;
	Registers[5'h02] <= 32'h0;
	Registers[5'h03] <= 32'h0;
	Registers[5'h04] <= 32'h0;
	Registers[5'h05] <= 32'h0;
	Registers[5'h06] <= 32'h0;
	Registers[5'h07] <= 32'h0;
	Registers[5'h08] <= 32'h0;
	Registers[5'h09] <= 32'h0;
	Registers[5'h0A] <= 32'h0;
	Registers[5'h0B] <= 32'h0;
	Registers[5'h0C] <= 32'h0;
	Registers[5'h0D] <= 32'h0;
	Registers[5'h0E] <= 32'h0;
	Registers[5'h0F] <= 32'h0;
	Registers[5'h10] <= 32'h0;
	Registers[5'h11] <= 32'h0;
	Registers[5'h12] <= 32'h0;
	Registers[5'h13] <= 32'h0;
	Registers[5'h14] <= 32'h0;
	Registers[5'h15] <= 32'h0;
	Registers[5'h16] <= 32'h0;
	Registers[5'h17] <= 32'h0;
	Registers[5'h18] <= 32'h0;
	Registers[5'h19] <= 32'h0;
	Registers[5'h1A] <= 32'h0;
	Registers[5'h1B] <= 32'h0;
	Registers[5'h1C] <= 32'h0;
	Registers[5'h1D] <= 32'h0;
	Registers[5'h1E] <= 32'h0;
	Registers[5'h1F] <= 32'h0;
	
end 
endmodule 
reg[31:0] Registers[31:0]; //array of 32 registers, 32-bit each
initial begin
	
end


