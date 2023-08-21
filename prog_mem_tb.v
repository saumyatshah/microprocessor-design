`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 10:26:32 PM
// Design Name: 
// Module Name: prog_mem_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module prog_mem_tb(

    );
     reg [7:0]in;
	 wire [16:0]out;
	 initial begin
	 
		 in=0;
		 
		 end
	 prog_mem UUT (in,out);
	
	 initial begin
	 
		 in=0;
		 #1;
		 
		 in=1;
		 #1;
		 
		 in=2;
		 #1;
		 
		 in=3;
		 #1;
		 
		 in=4;
		 #1;
		 
		 in=5;
		 #1;
		 
		 in=6;
		 #1;
		 
		 in=7;
	 
	 $finish;
	 end
endmodule
