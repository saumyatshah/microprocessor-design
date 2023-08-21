
module mux2x1(sel,D1,D2,out);
parameter data_width= 8;
    input sel;
    input [data_width-1:0]D1;
    input [data_width-1:0]D2;
    output [data_width-1:0]out;
    //always@* begin
    assign out=(sel)?D1:D2;
   //end
    
endmodule
module mux4x1(sel,D1,D2,D3,D4,out);
    parameter data_width= 8;
    input [1:0]sel;
    input [data_width-1:0]D1;
    input [data_width-1:0]D2;
    input [data_width-1:0]D3;
    input [data_width-1:0]D4;
    output [data_width-1:0]out;
    //always@* begin
    assign out= sel[0]?(sel[1]?D1:D2):(sel[1]?D3:D4);
//end
endmodule
module mux3x1(sel,D1,D2,D3,out);
    parameter data_width= 8;
    input [1:0]sel;
    input [data_width-1:0]D1;
    input [data_width-1:0]D2;
    input [data_width-1:0]D3;
    output [data_width-1:0]out;
    //always@* begin
    assign out= sel[0]?(sel[1]?D1:D2):D3;
//end
endmodule

module mux(sel,inp1,inp2,inp3,inp4,out1,out2,out3,out4);
    parameter data_width= 8;
    input [1:0]sel;
    input [data_width-1:0]inp1;
    input [data_width-1:0]inp2;
    input [data_width-1:0]inp3;
    input [data_width-1:0]inp4;
    output [data_width-1:0]out1;
    output [data_width-1:0]out2;
    output [data_width-1:0]out3;
    output [data_width-1:0]out4;
   
  //  mux2x1 MUXA(sel[0],inp1,inp2,out1);
  //  mux2x1 MUXB(sel[1],inp3,inp4,out2);
  //  mux4x1 MUXC(sel,inp1,inp2,inp3,inp4,out3);
    mux3x1 MUXD(sel,inp1,inp2,inp3,out4);
    
endmodule
