
`timescale 1ns/1ps

module tb_d_flip_flop;

    reg clk, rst, d;
    wire q;

    d_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("time=%0t rst=%b clk=%b d=%b q=%b",
                 $time, rst, clk, d, q);

        rst = 1;
        d = 0;
        #2;
        if (q !== 0) $display("FAIL reset");
        else $display("PASS reset");

        #6;
        rst = 0;
        d = 1;

        @(posedge clk);
        #1;
        if (q !== 1) $display("FAIL capture 1");
        else $display("PASS capture 1");

        d = 0;
        @(posedge clk);
        #1;
        if (q !== 0) $display("FAIL capture 0");
        else $display("PASS capture 0");

        rst = 1;
        #1;
        if (q !== 0) $display("FAIL async reset");
        else $display("PASS async reset");

        $display("Simulation completed");
        $finish;
    end
