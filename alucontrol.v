module ALUControl (op, funct, alu_control);

input wire[5:0] op;
input wire[5:0] funct;
output reg[3:0] alu_control;

always @(*) begin


//alu control
		if ((op == 6'h0 && funct == 6'h12) || op == 6'h03) begin // AND & ANDI
			alu_control = 4'b0000;
		end else if ((op == 6'h0 && funct == 6'h13) || op == 6'h04) begin // OR & ORI
			alu_control = 4'b0001;
		end else if (((op == 6'h0) && (funct == 6'h10)) || (op == 6'h01)) begin // ADD & ADDI
			alu_control = 4'b0010; 
		end else if ((op == 6'h0 && funct == 6'h14)) begin // XOR
			alu_control = 4'b0011;
		end else if ((op == 6'h0 && funct == 6'h11) || op == 6'h02) begin // SUB & SUBI - unsigned
			alu_control = 4'b0110;
		end else if (op == 6'h05) begin // SLL
			alu_control = 4'b1000;
		end else if (op == 6'h06) begin // SRL
			alu_control = 4'b1001;
		end else if (op == 6'h09 || op == 6'h0A || op == 6'h0B) begin // SUB - signed - AND bne, beq, blt
			alu_control = 4'b0110;
		end else if (op == 6'h07 || op == 6'h08) begin // ADD - signed - AND lw, sw
			alu_control = 4'b0010;
        end else begin
			alu_control = 4'b1111;
		end		
		
end
endmodule  

