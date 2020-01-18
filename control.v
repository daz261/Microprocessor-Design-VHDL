module control
(
	instruction,
	MemRW,
	regWrite,
	memReg,
	regDst,
	ALUSrc,
	alu_control,
	alu_zero,
	pc_control
);


        input[31:0] instruction;
	input alu_zero; 

        output MemRW;
	output regWrite;
	output memReg;
	output regDst;
	output ALUSrc;
	output[3:0] alu_control;
	output[2:0] pc_control;
	
	//reg
	reg MemRW;
	reg regWrite;
	reg memReg;
	reg regDst;
	reg ALUSrc;
	reg [3:0] alu_control;
	reg [2:0] pc_control;
    
   
	reg [25:0] address;
	reg [5:0] funct;
	reg [15:0] immediate;
    	reg [4:0] rs;
    	reg [4:0] rt;
    	reg [4:0] rd;
    	reg [4:0] shamt;
    	reg [2:0] type;
	
	wire [5:0] op;
	
	assign op = instruction[31:26]; // Set the opcode
	
	always @(*)
	begin		
		if (op == 6'h0) begin // R format
			address	  = 26'b00000000000000000000000000;
			immediate = 16'b0000000000000000;
			rs = instruction[25:21];
			rt = instruction[20:16];
			rd = instruction[15:11];
			shamt = instruction[10:6];
			type  = 3'b001;
			funct = instruction[5:0];
		end 

		else if (op == 6'h3F || op == 6'h02) begin // J format
			address = instruction[25:0];
			immediate = 16'b0000000000000000;
			rs = 5'b00000;
			rt = 5'b00000;
			rd = 5'b00000;
			shamt= 5'b00000;
			type = 3'b100;
			funct= 6'b000000;
		end 

		else begin // I format
			address = 26'b00000000000000000000000000;
			immediate = instruction[15:0];
			rs = instruction[25:21];
			rt = instruction[20:16];
			rd = 5'b00000;
			shamt= instruction[10:6];
			type = 3'b010;
			funct= instruction[5:0];
		end
	
	
	//alu control
		
		if ((op == 6'h0 && funct == 6'h13) || op == 6'h04) begin // OR & ORI
			alu_control = 4'b0001;
		end else if (((op == 6'h0) && (funct == 6'h20)) || (op == 6'h08)) begin // ADD & ADDI
			alu_control = 4'b0010; 
		end else if ((op == 6'h0 && funct == 6'h14)) begin // XOR
			alu_control = 4'b0011;
		end else if ((op == 6'h0 && funct == 6'h22) || op == 6'h02) begin // SUB & SUBI - unsigned
			alu_control = 4'b0110;
		end else if (op == 6'h05) begin // SLL
			alu_control = 4'b1000;
		end else if (op == 6'h06) begin // SRL
			alu_control = 4'b1001;
		end else if (op == 6'h09 || op == 6'h0A || op == 6'h0B) begin // SUB - signed - AND bne, beq, blt
			alu_control = 4'b0110;
		end else if (op == 6'h2b || op == 6'h23) begin // LW, SW
			alu_control = 4'b0010;
       		 end else begin
			alu_control = 4'b1111;
		end		

		//MemWrite
		if (op == 6'h2b) begin // store word
			MemRW = 1'b1;
		end 
		else begin // no write
			MemRW = 1'b0;
		end
		
		//RegWrite
		if (op == 6'h0 || op == 6'h23 || op == 6'h08 ) begin // R, lw, I
			regWrite = 1;
		end 
		else begin // Otherwise 1
			regWrite = 0;
		end
		
		
		//MemtoReg
		if (op == 6'h23) begin //load word
			memReg = 1;
		end
		else begin
			memReg = 0;
		end
		
		
		//RegDst
		if (op == 6'h0) begin // R format
			regDst = 1;
		end 
		else begin // I format or other
			regDst = 0;
		end
		
		//ALUSrc
		if (op == 6'h23 || op == 6'h2b || op == 6'h08) begin // R format or brach
			ALUSrc = 1;
		end else begin // I or J format
			ALUSrc = 0;
		end
		
		//pc_control
		if (op == 6'h02) begin // jmp
			pc_control = 3'b001;
		end else if (op == 6'h04 && alu_zero == 1) begin // beq
				pc_control = 3'b011;	
		end else if (op == 6'h0B && alu_zero == 0) begin // bne
				pc_control = 3'b011;
		end else if (op == 6'h09 && alu_zero == 0) begin //blt
				pc_control = 3'b011;
		end else if (op == 6'h3F) begin //halt
				pc_control = 3'b111;
        	end else begin 
			pc_control = 3'b000;
		end
		
		
	end
	
 endmodule  
