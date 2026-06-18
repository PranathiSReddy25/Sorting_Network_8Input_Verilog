module reg16(
    output reg [15:0] q,
    input clk,
    input reset,
    input [15:0] d
);
    initial q = 16'd0;   // <-- removes initial X

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'd0;
        else
            q <= d;
    end
endmodule
