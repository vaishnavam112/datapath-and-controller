`timescale 1ns / 1ps
module tb_data_path( );

      reg clk, en, clr; 
      reg [3:0]A,B;
      wire [7:0]data_path_out;
      wire done;
      
      data_path DP(.clk(clk), .en(en), .clr(clr), .A(A),.B(B),.data_path_out(out), .done(done)); 

        always #5 clk=~clk;
        
        initial
        begin
        clk=0;
        en=0;
        clr=1;
        A=4'b0000;
        B=4'b0000;
        #10
        
        en=1;
        A=4'b1001;
        B=4'b0011;
        #5
        $finish;
        
       
        
        end
        
endmodule
