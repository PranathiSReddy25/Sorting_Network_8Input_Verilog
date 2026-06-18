`timescale 1ns / 1ps

module sorting8_network_tb();

    reg clk, reset;
    reg [15:0] x0, x1, x2, x3, x4, x5, x6, x7;
    wire [15:0] y0, y1, y2, y3, y4, y5, y6, y7;

    sorting8_network dut(
        .clk(clk),
        .reset(reset),
        .x0(x0), .x1(x1), .x2(x2), .x3(x3),
        .x4(x4), .x5(x5), .x6(x6), .x7(x7),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6), .y7(y7)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        
        // Apply Reset
        reset = 1;
        #15;         // keep reset active through a clock edge
        reset = 0;

        // ------------ Test Vector 1 ------------
        x0 = 16'd50;
        x1 = 16'd20;
        x2 = 16'd70;
        x3 = 16'd10;
        x4 = 16'd90;
        x5 = 16'd30;
        x6 = 16'd80;
        x7 = 16'd40;

        #20; // Wait 2 clocks for sorted outputs

        $display("Sorted Output 1:");
        $display("%d %d %d %d %d %d %d %d",
                 y0,y1,y2,y3,y4,y5,y6,y7);

        // ------------ Test Vector 2 ------------
        x0 = 16'd100;
        x1 = 16'd5;
        x2 = 16'd200;
        x3 = 16'd40;
        x4 = 16'd1;
        x5 = 16'd150;
        x6 = 16'd75;
        x7 = 16'd60;

        #20;

        $display("Sorted Output 2:");
        $display("%d %d %d %d %d %d %d %d",
                 y0,y1,y2,y3,y4,y5,y6,y7);

       #200 $finish;
    end

endmodule
