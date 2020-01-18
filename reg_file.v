`include "in_out.v"
`include "register.v"

module reg_file
(input clk,
input rst,
input wire[4:0] reg1, 		//read register 1
input wire[4:0] reg2, 		//read register 2
input wire[4:0] writeReg,		//write register
input wire[31:0] WriteData,   	//input from Data Memory
input wire RegWrite,		//signal
output [31:0] read1,
output [31:0] read2); 


/////////////////////////////////////////////////////////////////////////////////////////////
wire[31:0] out_reg1, out_reg2, out_writeReg;
wire[31:0] Registers[0:31]; //array of 32 registers, 32-bit each

//in_out IN_OUT_1 (.in(reg1), .out(out_reg1));
//in_out IN_OUT_2 (.in(reg2), .out(out_reg2));
in_out IN_OUT_3 (.rst(rst), .in(writeReg), .out(out_writeReg));

Register R0(.clk(clk),
            .rst(1'b1),
	    .RegWrite(1'b0),
	    .addr(1'b0),
	    .WriteData(32'h0000_0000),
	    .out(Registers[0]));
Register R1(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[1]),
	    .WriteData(WriteData),
	    .out(Registers[1]));
Register R2(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[2]),
	    .WriteData(WriteData),
	    .out(Registers[2]));
Register R3(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[3]),
	    .WriteData(WriteData),
	    .out(Registers[3]));
Register R4(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[4]),
	    .WriteData(WriteData),
	    .out(Registers[4]));
Register R5(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[5]),
	    .WriteData(WriteData),
	    .out(Registers[5]));
Register R6(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[6]),
	    .WriteData(WriteData),
	    .out(Registers[6]));
Register R7(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[7]),
	    .WriteData(WriteData),
	    .out(Registers[7]));
Register R8(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[8]),
	    .WriteData(WriteData),
	    .out(Registers[8]));
Register R9(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[9]),
	    .WriteData(WriteData),
	    .out(Registers[9]));
Register R10(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[10]),
	    .WriteData(WriteData),
	    .out(Registers[10]));
Register R11(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[11]),
	    .WriteData(WriteData),
	    .out(Registers[11]));
Register R12(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[12]),
	    .WriteData(WriteData),
	    .out(Registers[12]));
Register R13(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[13]),
	    .WriteData(WriteData),
	    .out(Registers[13]));
Register R14(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[14]),
	    .WriteData(WriteData),
	    .out(Registers[14]));
Register R15(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[15]),
	    .WriteData(WriteData),
	    .out(Registers[15]));
Register R16(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[16]),
	    .WriteData(WriteData),
	    .out(Registers[16]));
Register R17(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[17]),
	    .WriteData(WriteData),
	    .out(Registers[17]));
Register R18(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[18]),
	    .WriteData(WriteData),
	    .out(Registers[18]));
Register R19(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[19]),
	    .WriteData(WriteData),
	    .out(Registers[19]));
Register R20(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[20]),
	    .WriteData(WriteData),
	    .out(Registers[20]));
Register R21(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[21]),
	    .WriteData(WriteData),
	    .out(Registers[21]));
Register R22(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[22]),
	    .WriteData(WriteData),
	    .out(Registers[22]));
Register R23(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[23]),
	    .WriteData(WriteData),
	    .out(Registers[23]));
Register R24(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[24]),
	    .WriteData(WriteData),
	    .out(Registers[24]));
Register R25(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[25]),
	    .WriteData(WriteData),
	    .out(Registers[25]));
Register R26(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[26]),
	    .WriteData(WriteData),
	    .out(Registers[26]));
Register R27(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[27]),
	    .WriteData(WriteData),
	    .out(Registers[27]));
Register R28(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[28]),
	    .WriteData(WriteData),
	    .out(Registers[28]));
Register R29(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[29]),
	    .WriteData(WriteData),
	    .out(Registers[29]));
Register R30(.clk(clk),
            .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[30]),
	    .WriteData(WriteData),
	    .out(Registers[30]));
Register R31(.clk(clk),
             .rst(rst),
	    .RegWrite(RegWrite),
	    .addr(out_writeReg[31]),
	    .WriteData(WriteData),
	    .out(Registers[31]));

assign read1 = Registers[reg1];
assign read2 = Registers[reg2];


endmodule 


