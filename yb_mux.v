module yb_mux;

reg a,b,sel;
wire y;

mux dut(
	.a(a),
	.b(b),
	.sel(sel),
	.y(y)
);

initial begin 
	a=0; b=0; sel=0;
	#10; 
	a=0; b=1; sel=0;
	#10; 
	a=1; b=0; sel=1;
	#10; 
	a=1; b=1; sel=1;
	#10;
	$finish;#100;
end
initial begin
	$monitor(" a=%b b=%b sel=%b y=%b ",a,b,sel,y);
	$dumpfile("tb.fsdb");
	$dumpvars(0,yb_mux);
end
endmodule


