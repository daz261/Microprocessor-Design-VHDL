`include "control.v"

module control_tb();

reg[31:0] instruction;
reg alu_zero; 

wire MemRW;
wire regWrite;
wire memReg;
wire regDst;
wire ALUSrc;
wire[3:0] alu_control;
wire[2:0] pc_control;

control Control (.instruction(instruction),
	.MemRW(MemRW),
	.regWrite(regWrite),
	.memReg(memReg),
	.regDst(regDst),
	.ALUSrc(ALUSrc),
	.alu_control(alu_control),
	.alu_zero(alu_zero),
	.pc_control(pc_control)
	);

initial begin                        //Simulation start
	$dumpfile("control.vcd");   //vcf file creation for GTKWave 
	$dumpvars(0, control_tb);
    
    	alu_zero = 0;
	instruction = 32'h00000000;                //Inputs initialization

	#10;
    	alu_zero = 1;
	instruction = 32'h21080002; //addi $t0, $t0, 2 

	#10;
    	alu_zero = 0;
	instruction =  32'h214A0002; //addi $t2, $t2, 2  214A0002

	#10;
    	alu_zero = 1;
	instruction = 32'h010A4020; //add $t0, $t0, $t2 

	#10;
    	alu_zero = 0;
	instruction = 32'h21290001; //addi $t1, $t1, 1 

	#10;
    	alu_zero = 0;
	instruction =  32'hAD090000; //sw $t0, 0($t1)
	
	#10;
    	alu_zero = 0;
	instruction = 32'h8D490000; //lw $t2, 0($t1); //sw $t0, 0($t1)

	#10;
    	alu_zero = 0;
	instruction = 32'h01094022; //loop: sub $t0, $t0, $t1

	#10;
    	alu_zero = 0;
	instruction = 32'h11090048; //beq $t0, $t1, end

	#10;
    	alu_zero = 0;
	instruction = 32'h08000007; //j loop- opcode + the lower 26 bits of address 

	#10;
    	alu_zero = 0;
	instruction = 32'hFCFFFFFF;

  	#10;
	$finish;                 //Simulation end

end

endmodule
