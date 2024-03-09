`timescale 1ns / 1ps
module tb_fsm_mealy( );
    reg d_in,clk, rst_n,status;
    wire q_out, clr;
    integer i;
    
    fsm_mealy FM(.d_in(d_in), .clk(clk), .rst_n(rst_n), .status(status),
                    .q_out(q_out), .clr(clr));
    
    always #5 clk=~clk;
    
    initial
    begin
    
    clk=0; 
    rst_n=0;
    d_in=0;
    status=0;
    #7
    
    rst_n=1;
    
//    for(i=0; i<=20; i=i+1)
//    #7  d_in=$urandom_range(1,0);
    
    d_in=1; #7
    d_in=1; #7;
    d_in=1;#7
    d_in=0;#7
    d_in=1;#7
    d_in=0;#7
    d_in=1;#7
    d_in=1;#7
    d_in=1;#7
    d_in=0;#7
    d_in=0;#7
    d_in=1;#7
    d_in=0;#20;
   // d_in=0;#7
//    d_in=1;#13
//    d_in=0;#15
//    d_in=1;#15
    
    #500
    $finish;
    
    end                
                    
                     
endmodule
