module Register (input clk, input rst, input RegWrite, input addr, input wire[31:0] WriteData, output reg[31:0] out);

wire enable;

assign enable = RegWrite; //if RegWrite and addr = 1; bitwise comparison
assign enable_1 = addr&RegWrite; //
assign enable_2 = addr;
always @(posedge clk) begin

	if (rst) begin
		out <= 32'h0;
	end
		if (rst == 0 && enable_2 == 1) begin
			out <= WriteData;
			end else if (rst == 0 && enable_2 == 0) begin
			out <= out;
		end 

end
endmodule  
