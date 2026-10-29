`timescale 1ns/10ps
module mac_array_3x3_tb;
reg clk;
reg rstb;
reg signed [7:0] IN1, IN2, IN3;
reg signed [7:0] W1, W2, W3;
wire signed [19:0] OUT1, OUT2, OUT3;
wire signed [19:0] OUT4, OUT5, OUT6;
wire signed [19:0] OUT7, OUT8, OUT9;
mac_array_3x3 dut (
.clk(clk),
.rstb(rstb),
.IN1(IN1),
.IN2(IN2),
.IN3(IN3),
.W1(W1),
.W2(W2),
.W3(W3),
.OUT1(OUT1),
.OUT2(OUT2),
.OUT3(OUT3),
.OUT4(OUT4),
.OUT5(OUT5),
.OUT6(OUT6),
.OUT7(OUT7),
.OUT8(OUT8),
.OUT9(OUT9)
);
always #1 clk = ~clk;
integer i;
initial begin
clk = 0;
rstb = 0;
IN1 = 0;
IN2 = 0;
IN3 = 0;
W1 = 0;
W2 = 0;
W3 = 0;
#3;
rstb = 1;
for (i = 1; i <= 15; i = i + 1) begin
@(negedge clk);
IN1 = i;
IN2 = i + 1;
IN3 = i + 2;
W1 = i + 3;
W2 = i + 4;
W3 = i + 5;
end
#10;
$display("Final outputs:");
$display("OUT1 = %0d", OUT1);
$display("OUT2 = %0d", OUT2);
$display("OUT3 = %0d", OUT3);
$display("OUT4 = %0d", OUT4);
$display("OUT5 = %0d", OUT5);
$display("OUT6 = %0d", OUT6);
$display("OUT7 = %0d", OUT7);
$display("OUT8 = %0d", OUT8);
$display("OUT9 = %0d", OUT9);
$finish;
end
endmodule
