module tb_timer_counter;

    reg clk;
    reg rst_n;
    reg [7:0] addr;
    reg [31:0] wdata;
    reg write_en;
    reg read_en;

    wire [31:0] rdata;
    wire ready;
    wire timer_irq;

    localparam ADDR_TIMER_LOAD   = 8'h00;
    localparam ADDR_TIMER_COUNT  = 8'h04;
    localparam ADDR_TIMER_CTRL   = 8'h08;
    localparam ADDR_TIMER_STATUS = 8'h0C;

       timer_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .addr(addr),
        .wdata(wdata),
        .write_en(write_en),
        .read_en(read_en),
        .rdata(rdata),
        .ready(ready),
        .timer_irq(timer_irq)
    );

        always begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
    end
   
    task bus_write(input [7:0] target_addr, input [31:0] data);
        begin
            @(posedge clk);
            addr     = target_addr;
            wdata    = data;
            write_en = 1'b1;  
  	    @(posedge clk);
            while (!ready)
	    @(posedge clk);
            write_en = 1'b0;
            wdata    = 32'b0;
            addr     = 8'b0;
        end
    endtask
    task bus_read(input [7:0] target_addr);
        begin
            @(posedge clk);
            addr    = target_addr;
            read_en = 1'b1;
            @(posedge clk);
	    
            while (!ready) 
	    @(posedge clk);
            read_en = 1'b0;
            addr    = 8'b0;
        end
    endtask

    initial begin
        rst_n    = 1'b0;
        addr     = 8'b0;
        wdata    = 32'b0;
        write_en = 1'b0;
        read_en  = 1'b0;
        #40;
        rst_n = 1'b1;
	bus_write(ADDR_TIMER_LOAD, 32'd5);
                bus_write(ADDR_TIMER_CTRL, 32'h1);
        repeat (12) begin
            @(posedge clk);
      end
        bus_read(ADDR_TIMER_STATUS);
        bus_write(ADDR_TIMER_STATUS, 32'h1);
        bus_write(ADDR_TIMER_CTRL, 32'h0);
        bus_write(ADDR_TIMER_LOAD, 32'd3);
        bus_write(ADDR_TIMER_CTRL, 32'h3);

        repeat (15) begin

            @(posedge clk);
                  end
        bus_write(ADDR_TIMER_CTRL, 32'h0);#100;
               $finish;
    end
 initial begin
	 $dumpfile("tb.vcd");
	 $dumpvars(0,tb_timer_counter);
 end

endmodule

