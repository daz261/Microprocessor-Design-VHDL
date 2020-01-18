module dm(
input clk,
input reset,
input wire[31:0] result,
input wire[31:0] WriteData,
input wire zero, 
input wire MemWrite, 
output [31:0] ReadData);

//1024 words of 32-bit memory
reg[31:0] mem[0:1023]; 
integer k;



always @(*) begin
	if (reset) begin 
	 	for (k=0; k<64; k=k+1) begin
			mem[k] = 32'b0;
	end
	end
	else if (MemWrite == 1) begin		//sw
 		mem[result]<= WriteData;		//write value of WriteData into mem[result]
	end
	
end

assign ReadData = mem[result];

endmodule
