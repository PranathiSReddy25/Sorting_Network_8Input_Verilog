 module sorting8_network(
    input clk,
    input reset,
    input [15:0] x0, x1, x2, x3, x4, x5, x6, x7,
    output [15:0] y0, y1, y2, y3, y4, y5, y6, y7
);

    // Stage 1
    wire [15:0] s1[7:0];
    BN1 c10(x0,x1,s1[0],s1[1]);
    BN1 c11(x2,x3,s1[2],s1[3]);
    BN1 c12(x4,x5,s1[4],s1[5]);
    BN1 c13(x6,x7,s1[6],s1[7]);

    // Stage 2
    wire [15:0] s2[7:0];
    BN1 c20(s1[0],s1[2],s2[0],s2[1]);
    BN1 c21(s1[1],s1[3],s2[2],s2[3]);
    BN1 c22(s1[4],s1[6],s2[4],s2[5]);
    BN1 c23(s1[5],s1[7],s2[6],s2[7]);

    // Stage 3
    wire [15:0] s3[7:0];
    BN1 c30(s2[0],s2[4],s3[0],s3[1]);
    BN1 c31(s2[1],s2[5],s3[2],s3[3]);
    BN1 c32(s2[2],s2[6],s3[4],s3[5]);
    BN1 c33(s2[3],s2[7],s3[6],s3[7]);

    // Stage 4
    wire [15:0] s4[7:0];
    assign s4[0] = s3[0];
    BN1 c40(s3[1],s3[2],s4[1],s4[2]);
    BN1 c41(s3[3],s3[4],s4[3],s4[4]);
    BN1 c42(s3[5],s3[6],s4[5],s4[6]);
    assign s4[7] = s3[7];

    // Stage 5
    wire [15:0] s5[7:0];
    BN1 c50(s4[0],s4[1],s5[0],s5[1]);
    BN1 c51(s4[2],s4[3],s5[2],s5[3]);
    BN1 c52(s4[4],s4[5],s5[4],s5[5]);
    BN1 c53(s4[6],s4[7],s5[6],s5[7]);

    // Stage 6
    wire [15:0] s6[7:0];
    assign s6[0] = s5[0];
    BN1 c60(s5[1],s5[2],s6[1],s6[2]);
    BN1 c61(s5[3],s5[4],s6[3],s6[4]);
    BN1 c62(s5[5],s5[6],s6[5],s6[6]);
    assign s6[7] = s5[7];

    // Output registers
    reg16 r0(y0,clk,reset,s6[0]);
    reg16 r1(y1,clk,reset,s6[1]);
    reg16 r2(y2,clk,reset,s6[2]);
    reg16 r3(y3,clk,reset,s6[3]);
    reg16 r4(y4,clk,reset,s6[4]);
    reg16 r5(y5,clk,reset,s6[5]);
    reg16 r6(y6,clk,reset,s6[6]);
    reg16 r7(y7,clk,reset,s6[7]);

endmodule
