// Single-Port Block RAM No-Change Mode
// File: instr_mem.sv
// 

// `include "macros_alex.sv"

module instr_mem_old (
    output logic    [INSTR_WIDTH-1:0]   dout,
    input  logic             clk, we, en,
    input  logic    [ADDR_WIDTH-1:0]    addr_in,
    input  logic    [INSTR_WIDTH-1:0]   di
    );
    
    logic [INSTR_WIDTH-1:0] RAM  [1023:0];

    //split di into 4-byte chunk

    always @(posedge clk)
    begin
        if (en)
        begin
            if (we)
                RAM [addr_in] <= di;
        
            else
                dout <= RAM[addr_in];
        end
    end
    
endmodule



