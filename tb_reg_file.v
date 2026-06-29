module tb_reg_file;

reg clk=0,rstn=0,wr_en=0;
reg [3:0] rd_addr,rs1_addr,rs2_addr;
reg [7:0] wr_data;
wire [7:0] rs1_data,rs2_data;

reg_file uut(
    clk,rstn,wr_en,
    rd_addr,rs1_addr,rs2_addr,
    wr_data,rs1_data,rs2_data
);

always #5 clk=~clk;

initial begin
    #10 rstn=1;
    wr_en=1; rd_addr=4'd1; wr_data=8'hAA;
    #10 rs1_addr=4'd1; rs2_addr=4'd1;
    #20 $finish;
end
initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_reg_file);
end

endmodule
