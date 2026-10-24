
`timescale 1ns/1ps

module tb_half_adder;
    reg a, b;
    wire sum, carry;
    integer i;

    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("a b | carry sum");
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #10;
            $display("%b %b |   %b     %b", a, b, carry, sum);
        end
        $finish;
    end
endmodule
