module mux2to1(input wire d0, d1, sel, output wire y);
assign y = sel ? d1 : d0;
endmodule
