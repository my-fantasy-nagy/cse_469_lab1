//Author: Alex Nagy
//List of Macro Values for instr_memory, core_1 and program_counter


// Values 
parameter PC_INCR = 4;
parameter RESET_ADDR = 10'b0001_0000;
parameter ADDR_ERROR = 10'bx;       



//WIDTHS
parameter INSTR_ADDR_WIDTH = 10;
parameter INSTR_WIDTH = 32;
parameter ADDR_WIDTH = 10;
parameter BYTE_WIDTH = 8;
parameter OFFSET_WIDTH = 6;  //WHAT IS THE OFFSET WIDTH???
parameter BRANCH_PADDING_WIDTH = INSTR_ADDR_WIDTH-OFFSET_WIDTH;
parameter PC_PADDING_WIDTH= INSTR_ADDR_WIDTH-4;
