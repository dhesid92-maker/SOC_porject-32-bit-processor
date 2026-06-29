module s_s_display(
    input  [15:0] data_in,
    output reg [6:0] seg3,
    output reg [6:0] seg2,
    output reg [6:0] seg1,
    output reg [6:0] seg0
);

always @(*) begin

    case(data_in[3:0])
        4'h0: seg0 = 7'b0111111;
        4'h1: seg0 = 7'b0000110;
        4'h2: seg0 = 7'b1011011;
        4'h3: seg0 = 7'b1001111;
        default: seg0 = 7'b0000000;
    endcase

    case(data_in[7:4])
        4'h0: seg1 = 7'b0111111;
        4'h1: seg1 = 7'b0000110;
        4'h2: seg1 = 7'b1011011;
        4'h3: seg1 = 7'b1001111;
        default: seg1 = 7'b0000000;
    endcase

    case(data_in[11:8])
        4'h0: seg2 = 7'b0111111;
        4'h1: seg2 = 7'b0000110;
        4'h2: seg2 = 7'b1011011;
        4'h3: seg2 = 7'b1001111;
        default: seg2 = 7'b0000000;
    endcase

    case(data_in[15:12])
        4'h0: seg3 = 7'b0111111;
        4'h1: seg3 = 7'b0000110;
        4'h2: seg3 = 7'b1011011;
        4'h3: seg3 = 7'b1001111;
        default: seg3 = 7'b0000000;
    endcase

end

endmodule
