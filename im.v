module im (clk, address, instruction);

	input clk;
	input	[31:0]	address;
	output reg [31:0] instruction;

	reg [31:0] mem[0:255];
	integer i;

	initial begin
	mem[0] <= 32'h21080002; //addi $t0, $t0, 2 
	mem[4] <= 32'h214A0002; //addi $t2, $t2, 2  214A0002
	mem[8] <= 32'h010A4020; //add $t0, $t0, $t2 //funct = 010000 
	mem[12] <= 32'h21290001; //addi $t1, $t1, 1 
	mem[16] <= 32'hAD090000; //sw $t0, 0($t1)
	mem[20] <= 32'h8D490000; //lw $t2, 0($t1)
	mem[24] <= 32'h01094022; //loop: sub $t0, $t0, $t1
	mem[28] <= 32'h11090048; //beq $t0, $t1, end
	mem[32] <= 32'h08000007; //j loop- opcode + the lower 26 bits of address 
	/*mem[36] <= 32'h01094022; //loop: sub $t0, $t0, $t1
	mem[40] <= 32'h11090048; //beq $t0, $t1, end
	mem[44] <= 32'h08000007; //j loop- opcode + the lower 26 bits of address 
	mem[48] <= 32'h01094022; //loop: sub $t0, $t0, $t1
	mem[52] <= 32'h11090048; //beq $t0, $t1, end
	mem[56] <= 32'h08000007; //j loop- opcode + the lower 26 bits of address 
	mem[60] <= 32'h01094022; //loop: sub $t0, $t0, $t1
	mem[64] <= 32'h11090048; //beq $t0, $t1, end
	mem[68] <= 32'h08000007; //j loop- opcode + the lower 26 bits of address */
	mem[36] <= 32'hFCFFFFFF;
	end

	always@*
	begin
		instruction <= mem[address];
	end
endmodule
