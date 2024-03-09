`timescale 1ns / 1ps
module fsm_mealy #(s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100)(
    input d_in,clk, rst_n,status,
    output reg q_out, clr 
    );
    reg [2:0]current_state; 
    reg [2:0]next_state;
    
    //state transition
    always @(posedge clk, negedge rst_n)
    begin
        if(~rst_n)
            current_state<=s0;
         else
            current_state<=next_state; 
    end
    
    //next_state logic
    always @(*)
    begin
    case(current_state)
        s0: if (d_in)
                next_state<=s1;
                  else 
                  next_state<=s0;
                  
        s1: if(d_in)
                next_state<=s1;
                else next_state<=s2;
                
        s2: if(d_in)
                next_state<=s3;
                else
                next_state<=s0;
                
        s3: if(d_in)
                next_state<=s1;
                else next_state<=s4;
                
        s4: if(d_in)
                next_state<=s3;
                else next_state<=s0;
                
        default: next_state<=s0;  
        endcase
     end   
        
        //output logic
        always@(*)
        begin
        case(current_state)
        s0: q_out<=0;
        s1: q_out<=0;
        s2: q_out<=0;
        s3: q_out<=0;
        s4: q_out<=1;
        
        //default: q_out=0;
        endcase
        end 
        
        always@(status)
        begin
            if(status)
             clr<=1;
             else clr<=0;
        
        end                                       
   
        
endmodule
