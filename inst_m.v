module inst_m(
    input  [15:0] addr,
    output [15:0] instr
);
    reg [15:0] mem [0:255];
    initial begin
        mem[0] = 16'h1234;
        mem[1] = 16'h5678;
        mem[2] = 16'hABCD;
        mem[3] = 16'hDEAD;
    end
    assign instr = mem[addr[7:0]];

endmodule





