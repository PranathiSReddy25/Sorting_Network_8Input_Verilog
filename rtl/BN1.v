module BN1(
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] min,
    output [15:0] max
);
    assign min = (a < b) ? a : b;
    assign max = (a < b) ? b : a;
endmodule
