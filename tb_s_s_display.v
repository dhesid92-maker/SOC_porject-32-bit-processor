module tb_s_s_display;

reg [15:0] data_in;

wire [6:0] seg3, seg2, seg1, seg0;

s_s_display uut(
    .data_in(data_in),
    .seg3(seg3),
    .seg2(seg2),
    .seg1(seg1),
    .seg0(seg0)
);

initial begin
    data_in = 16'h0123; #10;
    data_in = 16'h3210; #10;
    data_in = 16'h1111; #10;

    $finish;
end

initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_s_s_display);
end

endmodule
