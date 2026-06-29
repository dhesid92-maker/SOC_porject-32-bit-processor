module tb_inst_m;

reg  [15:0] addr;
wire [15:0] instr;

inst_m uut (
	.addr(addr),
        .instr(instr)
);

initial begin
	addr = 0; #10;
        addr = 1; #10;    
        addr = 2; #10;
        addr = 3; #10;
        $finish;
end

initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_inst_m);
end
endmodule



