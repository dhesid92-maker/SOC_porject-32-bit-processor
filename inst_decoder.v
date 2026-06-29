module inst_decoder(
    input [15:0] instr,
    input zero_flag,
    output [3:0] opcode,
    output [3:0] rd_addr,
    output [3:0] rs1_addr,
    output [3:0] rs2_addr,
    output [7:0] imm,
    output reg [3:0] alu_op,
    output reg reg_wr_en,
    output reg imm_sel,
    output reg branch_en
);

assign opcode   = instr[15:12];
assign rd_addr  = instr[11:8];
assign rs1_addr = instr[7:4];
assign rs2_addr = instr[3:0];

assign imm = {{4{instr[3]}}, instr[3:0]};

always @(*) begin
    alu_op    = 4'b0000;
    reg_wr_en = 1'b0;
    imm_sel   = 1'b0;
    branch_en = 1'b0;

    case(opcode)

        4'b0000: begin
            alu_op    = 4'b0000;
            reg_wr_en = 1'b1;
        end
        4'b0001: begin  
            alu_op    = 4'b0001;
            reg_wr_en = 1'b1;
        end
        4'b0010: begin   
            alu_op    = 4'b0000;
            reg_wr_en = 1'b1;
            imm_sel   = 1'b1;
        end
        4'b0011: begin  
            alu_op = 4'b0001;
            if(zero_flag)
                branch_en = 1'b1;
        end
        default: begin
            alu_op    = 4'b0000;
            reg_wr_en = 1'b0;
            imm_sel   = 1'b0;
            branch_en = 1'b0;
        end
    endcase
end
endmodule






