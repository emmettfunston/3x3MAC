`timescale 1ns/10ps
module mac_array_3x3 (
input wire clk,
input wire rstb,
input wire signed [7:0] IN1,
input wire signed [7:0] IN2,
input wire signed [7:0] IN3,
input wire signed [7:0] W1,
input wire signed [7:0] W2,
input wire signed [7:0] W3,
output reg signed [19:0] OUT1,
output reg signed [19:0] OUT2,
output reg signed [19:0] OUT3,
output reg signed [19:0] OUT4,
output reg signed [19:0] OUT5,
output reg signed [19:0] OUT6,
output reg signed [19:0] OUT7,
output reg signed [19:0] OUT8,
output reg signed [19:0] OUT9
);
reg signed [7:0] IN1R, IN1RR;
reg signed [7:0] IN2R, IN2RR;
reg signed [7:0] IN3R, IN3RR;
reg signed [7:0] W1R, W1RR;
reg signed [7:0] W2R, W2RR;
reg signed [7:0] W3R, W3RR;
reg [3:0] cycle_count;
always @(posedge clk or negedge rstb) begin
if (!rstb) begin
IN1R <= 8'sd0;
IN1RR <= 8'sd0;
IN2R <= 8'sd0;
IN2RR <= 8'sd0;
IN3R <= 8'sd0;
IN3RR <= 8'sd0;
W1R <= 8'sd0;
W1RR <= 8'sd0;
W2R <= 8'sd0;
W2RR <= 8'sd0;
W3R <= 8'sd0;
W3RR <= 8'sd0;
OUT1 <= 20'sd0;
OUT2 <= 20'sd0;
OUT3 <= 20'sd0;
OUT4 <= 20'sd0;
OUT5 <= 20'sd0;
OUT6 <= 20'sd0;
OUT7 <= 20'sd0;
OUT8 <= 20'sd0;
OUT9 <= 20'sd0;
cycle_count <= 4'd0;
end else begin
IN1R <= IN1;
IN1RR <= IN1R;
IN2R <= IN2;
IN2RR <= IN2R;
IN3R <= IN3;
IN3RR <= IN3R;
W1R <= W1;
W1RR <= W1R;
W2R <= W2;
W2RR <= W2R;
W3R <= W3;
W3RR <= W3R;
if (cycle_count < 4'd13) begin
OUT1 <= OUT1 + IN1 * W1;
OUT2 <= OUT2 + IN1R * W2;
OUT3 <= OUT3 + IN1RR * W3;
OUT4 <= OUT4 + IN2 * W1R;
OUT5 <= OUT5 + IN2R * W2R;
OUT6 <= OUT6 + IN2RR * W3R;
OUT7 <= OUT7 + IN3 * W1RR;
OUT8 <= OUT8 + IN3R * W2RR;
OUT9 <= OUT9 + IN3RR * W3RR;
cycle_count <= cycle_count + 4'd1;
end
end
end
endmodule
