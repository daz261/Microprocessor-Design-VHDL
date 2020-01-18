`include "toplevel.v"

module toplevel_tb;
  reg clk;
  reg rst;

toplevel TL(
	.clk(clk),
	.rst(rst)
	);


always 
	#5 clk = ~clk;

initial

	begin
	$dumpfile("toplevel.vcd");  //Creates a vcd file for GTKWave view
	$dumpvars(0, toplevel_tb);   

		clk    = 1'b0      ; // time = 0 
		 #5 rst    = 1'b1;
		
	repeat(1)
		@(posedge clk);
	rst = 1'b0;

	#600
	repeat(30)
		@(posedge clk);
		
	$finish;
end
endmodule

