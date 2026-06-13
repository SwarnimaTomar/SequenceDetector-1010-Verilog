`timescale 1ns / 1ps

module seq_1010_moore #
( parameter overlapping = "YES" )   // Yes or no
(
    //Global signals
    input i_clock,
    input i_reset,
    
    //Btn
    input i_btn,
    
    //Led
    output o_led
    );
    
// FSM States
localparam [2:0] S0 = 2'b00,
                 S1 = 2'b01,
                 S2 = 2'b10,
                 S3 = 2'b11,
                 S4 = 3'b100;
                 
// Internal/wire reg
reg r_led;
reg [2:0] r_state, r_next_state;

// Reset condition
always@(posedge i_clock) begin

    if(i_reset)
        r_state <= S0;
    else
        r_state <= r_next_state;
        
end
      
//FSM
always@(*) begin

    // store memory
    r_next_state = r_state;
    
    // State Machine
    case(r_state)
    
        S0 : r_next_state = i_btn ? S1 : S0;
        S1 : r_next_state = i_btn ? S1 : S2;
        S2 : r_next_state = i_btn ? S3 : S0;
        S3 : r_next_state = i_btn ? S1 : S4;
        S4 : begin
             if(overlapping == "YES")
                 r_next_state = i_btn ? S3 : S0;  //Overlapping
             else
                 r_next_state = i_btn ? S1 : S0;  //Non-overlapping
             end   
        default: r_next_state = S0;
    
    endcase
    
end  

//Output
assign o_led = (r_state == S4) ? 1:0;
         
endmodule
