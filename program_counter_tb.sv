module program_counter_tb();

    // `include "macros.sv"

    // initial begin
    //     $display("prgram_counter_tb");
    //     $dumpfile("out.vcd");
    //     $dumpvars(0, pc);
    //     reset  = 1;
    //     #6;    
    //     reset = 0;
    //     #6;
    //     reset = 1;
    //     branch_select = 0;
    //     branch_addr = 16;
    //     branch_offset = 1;
    //     #6;
    //     branch_select = 1;
    //     #6;
    //     branch_select = 0;
    //     #6;
    //     #40;
        
    //     $finish;

    // end

    logic clk = 0;
    
    logic  [INSTR_ADDR_WIDTH-1:0] addr_out ;
    logic  [OFFSET_WIDTH-1:0] branch_offset;
    
    logic  reset, branch_select;
    logic  [INSTR_ADDR_WIDTH-1:0] branch_addr;
    
     always #1 clk = !clk;

    program_counter pc(.*);

endmodule

