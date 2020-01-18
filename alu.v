module alu(
input clk,
input wire[31:0] read1,
input wire[31:0] read2, 
input wire[3:0] operation, 
output reg[31:0] result,
output zero);

assign zero = (result == 0);  //zero is true if result = 0 
always @(*) begin
	case (operation)
		4'b0000: 
			result <= read1 & read2; //bitwise and
		4'b0001:   
			result <= read1 | read2; 
			 //bitwise or
		4'b0010: 
			result <= read1 + read2;  
			//arithmetic add
		4'b0110:   
			result <= read1 - read2; 
			//arithmetic substract
		4'b0111:  
			result <= read1 <= read2; 
			//relational sll
		4'b1100:   
			result <= read1 ~| read2; 
			//reduction NOR
		default: result <= 0;
endcase 
end
endmodule 
