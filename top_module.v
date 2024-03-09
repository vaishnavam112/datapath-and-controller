`timescale 1ns / 1ps
module top_module(
    input d_in, rst_n, clk, 
    input [3:0]A,B,
    output [7:0]data_path_out 
    );
    wire out;
    assign data_path_out=out;
    
    fsm_mealy FSM(.d_in(d_in), .rst_n(rst_n), .clk(clk),.status(done), .q_out(q_out), .clr(clr));
    data_path DP(.en(q_out),.clk(clk), .clr(clr), .A(A), .B(B), .done(done), .data_path_out(out) );
    
    
endmodule 
