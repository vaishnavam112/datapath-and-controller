`timescale 1ns / 1ps
module tb_top_module();

    reg d_in, rst_n, clk; 
    reg [3:0]A,B;
    wire [7:0]data_path_out;
    
    integer i;
    top_module TM(.d_in(d_in), .rst_n(rst_n), .clk(clk), .A(A),.B(B), .data_path_out(data_path_out));
    
    always #5 clk=~clk;
    
    initial
    begin
    clk=0;
    rst_n=0;
    d_in=0;
    #10
    
    rst_n=1;
    
    for(i=0; i<=50;i=i+1)
     #7   d_in=$urandom_range(1,0);
     
     A=4'b1011;
     B=4'b0110;
    
      d_in=1; #7
      A=4'b1010;
     B=4'b0100;
    d_in=1; #7;
    A=4'b1000;
     B=4'b1110;
    d_in=1;#7
    A=4'b1111;
     B=4'b0010;
    d_in=0;#7
    A=4'b1010;
     B=4'b0100;
    d_in=1;#7
    A=4'b1111;
     B=4'b0110;
    d_in=0;#7
    A=4'b1011;
     B=4'b1110;
    d_in=1;#7
    A=4'b1001;
     B=4'b0111;
    d_in=1;#7
    A=4'b1011;
     B=4'b1111;
    d_in=1;#7
    d_in=0;#7
    d_in=0;#7
    d_in=1;#7
    d_in=0;#20;
        
      
    
    A=4'b1110;
    B=4'b1000;
    #10
    
    $finish; 
    
    end 
endmodule
