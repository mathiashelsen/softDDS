module test;

    /* Make a reset that pulses once. */
    reg reset = 0;
    reg [7:0] addr;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);

        #0 addr = 8'b0;
        
        # 17 reset = 1;
        # 11 reset = 0;
        # 29 reset = 1;
        # 5  reset =0;
        # 513 $finish;
    end
    
    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #1 clk = !clk;
    
    always @(posedge clk) begin
        addr <= addr + 1'b1;
    end
    
    wire [7:0] value;
    sin_lut lut1 (clk, addr, value );


endmodule // test
