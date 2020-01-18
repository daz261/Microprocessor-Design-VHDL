`include "im.v"

module im_tb;

reg clk;
reg [31:0] address;
wire [31:0] instruction;

im trial(.clk(clk), .address(address), .instruction(instruction));


initial begin
	$dumpfile("im.vcd");	
	$dumpvars(0, im_tb);
end 


initial begin
	clk = 0;
	address = 32'h0;
	#10;
	address = 32'h4; 	
	#10;
	address = 32'h8;
	#10;	
	address = 32'hC;
	#10;
end

always 
#5 clk = !clk;

initial 
 #200 $finish;

endmodule

