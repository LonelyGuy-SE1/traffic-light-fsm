module traffic_light (
    input  wire clk,
    input  wire reset,   
    output wire red,
    output wire green,
    output wire yellow
);
    reg s1, s0;

    wire d1 = s0;              
    wire d0 = ~s1 & ~s0;

    always @(posedge clk) begin
        s1 <= reset ? 1'b0 : d1;
        s0 <= reset ? 1'b0 : d0;
    end

    assign red    = ~s1 & ~s0;   
    assign green  = ~s1 &  s0;   
    assign yellow =  s1 & ~s0;   
endmodule
