`timescale 1ns / 1ps

module seq_1010_tb;

// Internal Regs/Wires
reg     clk, rst, din;
wire    dout_mealy, dout_moore;

// Clock Gen
always 
    #10 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    din = 0;
    
    #25 rst = 0;
    // 1 0 1 0 1 0 0 1 0 1 0 1
    //       1             1
    //       1   1         1
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    
    #40 $stop;
end

// Instantiation
seq_1010_mealy # 
( .overlapping("NO"))
uut_1(
.i_clock(clk),
.i_reset(rst),
.i_btn(din),
.o_led(dout_mealy)
);

seq_1010_moore uut(
.i_clock(clk),
.i_reset(rst),
.i_btn(din),
.o_led(dout_moore)
);

endmodule