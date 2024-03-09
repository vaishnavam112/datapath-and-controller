`timescale 1ns / 1ps
module data_path(
     input clk, en, clr, 
     input [3:0]A,B,
     output reg [7:0]data_path_out,
     output reg done 
    );
    
     always@(posedge clk)
     begin
        if(clr==1)begin
            data_path_out=8'b00000000;
            end
        if(en==1 & clr==0)begin
            data_path_out = {A, B};
            done=1;
            
            end 
                else done=0;
     end          
    
endmodule
