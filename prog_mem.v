`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2023 10:26:32 PM
// Design Name: 
// Module Name: prog_mem
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


module prog_mem(
    input [7:0] add,
    output reg [16:0] data
    );
    reg [7:0]mem[16:0]; //memory register for storing data
//	 initial
//	 begin
		
//		assign data=8'b00000000;  //set default data as 0
//	 end
	 
	 always @(*) 
	 begin
		 case(add)		//assign 8-bit values to each memory block
		 8'h00: mem[add]=17'h000000;
		 8'h01: mem[add]=17'h000001;
		 8'h02: mem[add]=17'h000002;
		 8'h03: mem[add]=17'h000003;
		 8'h04: mem[add]=17'h000004;
		 8'h05: mem[add]=17'h000005;
		 8'h06: mem[add]=17'h000006;
		 8'h07: mem[add]=17'h000007;
		 8'h08: mem[add]=17'h000008;
		 8'h09: mem[add]=17'h000009;
		 8'h0a: mem[add]=17'h00000a;
		 8'h0b: mem[add]=17'h00000b;
		 8'h0c: mem[add]=17'h00000c;
		 8'h0d: mem[add]=17'h00000d;
		 8'h0e: mem[add]=17'h00000e;
		 8'h0f: mem[add]=17'h00000f;
		 8'h10: mem[add]=17'h000010;
		 8'h11: mem[add]=17'h000011;
		 8'h12: mem[add]=17'h000012;
		 8'h13: mem[add]=17'h000013;
		 8'h14: mem[add]=17'h000014;
		 8'h15: mem[add]=17'h000015;
		 8'h16: mem[add]=17'h000016;
		 8'h17: mem[add]=17'h000017;
		 
		 
		 
		 
		 
		 
		 
		 
		 default:mem[add]=8'b00000010;
		 endcase
		 
	
		data<=mem[add];
		$monitor("address_in=%h,data_out=%d",add,data);
	 
	 end
endmodule
