
`timescale 1ns/1ps

module tb_sequence_detector_1011;

    reg clk, rst, din;
    wire detected;

    sequence_detector_1011 dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .detected(detected)
    );

    always #5 clk = ~clk;

    task send_bit;
        input bit_value;
        begin
            @(negedge clk);
            din = bit_value;
            @(posedge clk);
            #1;
            $display("%4t   %b       %b", $time, din, detected);
        end
    endtask

    initial begin
        clk = 0;
        rst = 1;
        din = 0;

        $display("Time  din  detected");

        #12;
        rst = 0;

        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1); // Expected detection here
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        $display("Simulation completed");
        $finish;
    end

endmodule




