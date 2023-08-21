`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111
module Register(
            input wire [2:0] AA,
            input wire [2:0] BA,
            input wire [2:0] DA,
            input wire [7:0] Data_in,
            input wire WR,
            input wire clk,
            input wire rst,
            output reg [7:0] Data_A,
            output reg [7:0] Data_B
            );
            reg [7:0]TempData[7:0];
            integer add;
            initial begin
            Data_A=8'h00;
            Data_B=8'h00;
            
            end
            always@(posedge clk) begin
                TempData[0]=8'h00;
                if(1==rst)
                begin
                    for(add=1;add<8;add=add+1)
                    begin
                        TempData[add]=8'h00;
                    end 
                 //   $monitor("TempData is : %h",TempData);
                end
                if(1==!rst)
                begin
                    if(1==WR)
                    begin
                        TempData[DA]=Data_in;
                    end
                    if(1==!WR)
                    begin
                    if(AA!=0)
                    Data_A=TempData[AA];
                    if(BA!=0)
                    Data_B=TempData[BA];
                        
                    end
                end
            end
endmodule
