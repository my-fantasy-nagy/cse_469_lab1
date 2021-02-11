module core_tb();

    // initial begin
    //     $display("core_tb test");
    //     $dumpfile("out.vcd");
    //     $dumpvars(0, core_test);
    //     #10;
    //     reset  = 1;
    //     #6;    
    //     reset = 0;
    //     #6;
    //     reset = 1;

    //     $finish;
    // end

    logic reset;

    core_1 core_test(.*);
    logic clk = 0;
    always #1 clk = !clk;
endmodule