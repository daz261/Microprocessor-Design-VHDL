`include "pc.v"
`include "im.v"
`include "reg_file.v"
`include "alu.v"
`include "dm.v"
`include "control.v"
`include "alucontrol.v"
`include "signExtension.v"

module toplevel (clk,rst);
	
	input clk, rst;

  	//wires
	wire [31:0] pc_to_address;
	wire [31:0] instruction;
	wire [31:0] instruction_signextended;
	
	//signals
	wire		signal_memRW;
	wire		signal_regWrite;
	wire		signal_memtoReg;
	wire		signal_regDst;
	wire		signal_ALUSrc;
	wire [3:0]	signal_alu_control;
	wire [2:0]	signal_pc_control;
	
	wire [4:0] 	reg_waddr;  //rd
	
	wire [31:0]	reg_rdata0;
	wire [31:0]	reg_rdata1;
	wire [31:0]	reg_wdata;
	
	wire [31:0] alu_operand2;
	
	wire [31:0] alu_result;
	
	wire alu_flag_zero;
	
	wire [31:0] datamemory_rdata;
	
	wire [4:0] rs;
	wire [4:0] rt;

	//Instantiation
	pc PC(.clk(clk),
		.rst(rst),
		.pc(pc_to_address),
		.pc_control(signal_pc_control),
		.jump_address(instruction[25:0]),
		.branch_offset(instruction[15:0]),
		.reg_address(reg_rdata0));

	im IM(.address(pc_to_address),
			 .instruction(instruction));

	control Control (.instruction(instruction),
			.MemRW(signal_memRW),
			.regWrite(signal_regWrite),
			.memReg(signal_memtoReg),
			.regDst(signal_regDst),
			.ALUSrc(signal_ALUSrc),
			.alu_control(signal_alu_control),
			.alu_zero(alu_flag_zero),
			.pc_control(signal_pc_control));

	signExtension instrSignExtend (.in(instruction[15:0]),
					.out(instruction_signextended));

	assign rs = instruction[25:21];
	assign rt = instruction[20:16];

	//MUX RegDst
	//if (signal_regDst ==1 )
	//	reg_waddr <= instruction[15:11]
	//else 
	//      reg_waddr <= rt;
	assign reg_waddr = signal_regDst ? instruction[15:11] : rt;

	reg_file RF(.clk(clk),
			.rst(rst),
			.reg1(instruction[25:21]),
			.reg2(instruction[20:16]),
			.writeReg(reg_waddr),
			.WriteData(reg_wdata),
			.RegWrite(signal_regWrite),
			.read1(reg_rdata0),
			.read2(reg_rdata1)
			);
	
	//MUX AluSRC
	//if (signal_ALUSrc == 1)
	// 	alu_operand2 <= instruction_signextended
	//else 
	//	alu_operand2 <= reg_rdata1
	assign alu_operand2 = signal_ALUSrc ? instruction_signextended : reg_rdata1;

	alu ALU(.clk (clk), 
		 .operation(signal_alu_control),    
		 .read1(reg_rdata0),
	     	 .read2(alu_operand2),        
		 .result(alu_result),
		 .zero(alu_flag_zero)
		);

	dm DM(.clk(clk), 
		    .reset(rst), 
		    .MemWrite(signal_memRW), 
		    .result(alu_result), 
		    .WriteData(reg_rdata1),
		    .ReadData(datamemory_rdata)
		    );

	//MUX MemtoReg
	//if (signal_memtoReg == 1)
	// 	reg_wdata <= alu_result
	//else
	//	reg_wdata <= datamemory_rdata;
	
//assign reg_wdata = signal_memtoReg ? alu_result : datamemory_rdata;
	//assign reg_wdata = signal_memtoReg ? alu_result : datamemory_rdata;
	assign reg_wdata = signal_memtoReg ? datamemory_rdata : alu_result;

endmodule

