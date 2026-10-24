`timescale 1ns/1ps

module tb_mux2to1;
    reg d0, d1, sel;
    wire y;
    integer i;

mux2to1 dut (
        .d0(d0),
        .d1(d1),
        .sel(sel),
        .y(y)
    );

initial begin
$display("sel d1 d0 | y");
for (i = 0; i < 8; i = i + 1) begin
 = i[2:0];
#10;
$display(" %b   %b  %b | %b", sel, d1, d0, y);
end
$finish;
end
endmodule
