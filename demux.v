module demux (
    input wire din,       // Single data input
    input wire [1:0] sel, // 2-bit select line
    output reg [3:0] dout // 4-bit output
);

    always @(din or sel) begin
        // Reset all outputs to 0 initially
        dout = 4'b0000;
        
        // Route the input to the corresponding output based on select lines
        case (sel)
            2'b00: dout[0] = din;
            2'b01: dout[1] = din;
            2'b10: dout[2] = din;
            2'b11: dout[3] = din;
            default: dout = 4'b0000;
        endcase
    end
endmodule

