

module tb_demux;

    // Inputs
    reg din;
    reg [1:0] sel;

    // Outputs
    wire [3:0] dout;

    // Instantiate the DUT (Device Under Test)
    demux uut (
        .din(din), 
        .sel(sel), 
        .dout(dout)
    );

    initial begin
        // Initialize Inputs
        din = 0;
        sel = 2'b00;

        // Wait 10 ns for global reset
        #10;
        
        // Test Case 1: Select line 00
        din = 1; sel = 2'b00; #10;
        din = 0; sel = 2'b00; #10;

        // Test Case 2: Select line 01
        din = 1; sel = 2'b01; #10;
        din = 0; sel = 2'b01; #10;

        // Test Case 3: Select line 10
        din = 1; sel = 2'b10; #10;
        din = 0; sel = 2'b10; #10;

        // Test Case 4: Select line 11
        din = 1; sel = 2'b11; #10;
        din = 0; sel = 2'b11; #10;

        // Finish the simulation
        $finish;
    end

    // Monitor changes to observe in the waveform
    initial begin
        $monitor("Time = %t | din = %b | sel = %b | dout = %b", 
                 $time, din, sel, dout);
	 $dumpfile("tb.fsdb");
	 $dumpvars(0,tb_demux);
    end
      
endmodule

