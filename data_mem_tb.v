`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 12:09:58 AM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb();
    
  reg [7:0] add;
  reg [7:0] in;
  wire [7:0] data_out;
  reg wr;
  integer inp;
  

  data_mem UUT(add, in, data_out, wr);
    
  // Test writing to memory
  initial begin
   wr = 1;
   
    for (inp = 0; inp < 8; inp=inp+1) begin
        add = inp;
        in = inp+8;
        #5;
        $monitor("input add = %d, input data = %d", add, in);
        
    end
   wr=0;
     for (inp = 0; inp < 8; inp=inp+1) begin
        add = inp;
       
        #5;
        $monitor("input add = %d, input data = %d", add, in);
        
    end
    $finish;
  end
 
 endmodule
