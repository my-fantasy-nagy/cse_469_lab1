module core_1 (
    input logic clk, reset
);


//include macros
`include "macros_alex.sv"

//program counter  logic
logic   [INSTR_ADDR_WIDTH-1:0] addr_out, branch_addr;
logic   branch_select;
logic   [OFFSET_WIDTH-1:0] branch_offset;

//instr_ram lgoic
wire   [INSTR_ADDR_WIDTH-1:0] addr_in = addr_out;
logic   we, en;
logic   [INSTR_WIDTH-1:0]  dout, di;

//program counter instantiation
program_counter pc(.*);

//instruction memory instantiation
instr_mem i_mem(.*);

endmodule