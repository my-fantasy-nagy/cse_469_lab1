// Single-Port Block RAM No-Change Mode
// File: instr_mem.sv
// 

// `include "macros_alex.sv"

module instr_mem (
        output logic    [INSTR_WIDTH-1:0]   dout,    //32 bits wide
        input  logic             clk, we, en,        
        input  logic    [ADDR_WIDTH-1:0]    addr_in, //10 bits wide
        input  logic    [INSTR_WIDTH-1:0]   di       //32 bits wide
    );
    
    reg [7:0] RAM [1023:0];

    //split di into 4-byte chunks
    wire [7:0] di_byte_0 = di [7:0];
    wire [7:0] di_byte_1 = di [15:8];
    wire [7:0] di_byte_2 = di [23:16];
    wire [7:0] di_byte_3 = di [31:24];

    //split up byte addresses into 4 chunks
    wire [9:0] addr_byte_0 = addr_in;
    wire [9:0] addr_byte_1 = addr_in + 1;
    wire [9:0] addr_byte_2 = addr_in + 2;
    wire [9:0] addr_byte_3 = addr_in + 3;

    always @(posedge clk)
    begin
        
        if (en)
        begin
            if (we)
                begin
                    RAM [addr_byte_0] <= di_byte_0;
                    RAM [addr_byte_1] <= di_byte_1;
                    RAM [addr_byte_2] <= di_byte_2;
                    RAM [addr_byte_3] <= di_byte_3;
                end

            else
                dout <= {   
                    RAM [addr_byte_3],
                    RAM [addr_byte_2],
                    RAM [addr_byte_1],
                    RAM [addr_byte_0]
                        };
        end
    end
    
endmodule



