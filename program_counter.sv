//Author: Alex Nagy
//This program counter module increments instruction address by 4 each cylce unless branch is called
//If branch is called, output address is equal to that of branch address plus the branch offset.

module program_counter(
    
    output logic    [INSTR_ADDR_WIDTH-1:0] addr_out, //10 bits wide
    input logic     clk, reset, branch_select,
    input logic     [INSTR_ADDR_WIDTH-1:0] branch_addr, //10 bits wide
    input logic     [OFFSET_WIDTH-1:0] branch_offset    //6 bits wide???
    );
    
    //include macros 
	`include "macros_alex.sv"

    //counter for our instructions
    logic [INSTR_ADDR_WIDTH-1: 0] n_addr_out;
    logic [BRANCH_PADDING_WIDTH-1: 0] branch_padding = '0;
    logic [PC_PADDING_WIDTH:0] pc_padding = '0;

    //Declare States
    typedef enum    {   STATE_INITIAL,
                        INCRIMENT,
                        BRANCH,
                        XXX} state_e;

    state_e state, next;

    //Move state on clock edge and include reset case
    always_ff @(posedge clk, negedge reset)
        if(!reset)  state <= STATE_INITIAL;
        else        state <= next;
        
    //Combinatorial logic for state sequence
    always_comb begin
        next = XXX;
        case (state)
            STATE_INITIAL   :       next = INCRIMENT;           //RESET STATE

            INCRIMENT       :       if(branch_select)
                                            next = BRANCH;
                                    else    next = INCRIMENT;   //@LB

            BRANCH          :       if(!branch_select)
                                            next = INCRIMENT;
                                    else    next = BRANCH;      //@LB

            default         :       next = XXX;
        endcase
    end

    // Combinatorial logic for data
    always_comb begin
        
        case (state)
            STATE_INITIAL   :       n_addr_out = RESET_ADDR;                //Reset Case

            INCRIMENT       :       if (branch_select)
                                        n_addr_out = branch_addr + {4'b0, branch_offset};           //BRANCH
                                    else
                                        n_addr_out = addr_out + PC_INCR;    //@LB

            BRANCH          :       if (!branch_select)                
                                        n_addr_out = addr_out + PC_INCR;    //INCRIMENT
                                    else
                                        n_addr_out = branch_addr + {4'b0, branch_offset};           //@LB
            default         :           n_addr_out = ADDR_ERROR;            //DEFAULT 
        endcase 

    end

    always_ff @(posedge clk, negedge reset)
        if (!reset) begin
            addr_out <= RESET_ADDR;
        end
        else begin
            addr_out  <= n_addr_out;
        end

endmodule
