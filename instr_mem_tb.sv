module instr_mem_tb();
    integer i;

    initial begin
        $display("instr_mem test");
        $dumpfile("out.vcd");
        $dumpvars(0, instr_mem_test);

        //Array workaround
        for(i = 0; i < 20; i = i +1)
            $dumpvars (1, instr_mem_test.RAM[i]);

        # 10;
        en = 0;
        we = 0;
        addr_in = 0;
        di = 32'h4321_DCBA;
        #4;
        en = 1;
        we = 1;
        #4;
        we = 0;
        #4;
        we = 1;
        addr_in = addr_in + 4;
        di = 32'hFFFF_FFFF;
        #4;
        we = 0;
        #10;
        we = 1;
        #10;


        $finish;
    end

    logic    [INSTR_WIDTH-1:0]   dout;
    logic    we, en;
    logic    [ADDR_WIDTH-1:0]    addr_in;
    logic    [INSTR_WIDTH-1:0]   di;

    logic clk = 0;
    always #1 clk = !clk;

    instr_mem instr_mem_test(.*);
endmodule