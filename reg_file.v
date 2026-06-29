module reg_file(
    input clk,rstn,wr_en,
    input [3:0] rd_addr,rs1_addr,rs2_addr,
    input [7:0] wr_data,
    output [7:0] rs1_data,rs2_data
);

reg [7:0] regs [0:15];
integer i;

always @(posedge clk or negedge rstn)
begin
    if(!rstn)
        for(i=0;i<16;i=i+1)
            regs[i] <= 8'h00;
    else if(wr_en && rd_addr!=0)
        regs[rd_addr] <= wr_data;
end

assign rs1_data = regs[rs1_addr];
assign rs2_data = regs[rs2_addr];

endmodule


