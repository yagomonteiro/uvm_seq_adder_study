interface ula_if();
    logic rst;
    logic clk;
    logic [4:0]  i_op_selector;
    logic [15:0] i_data_a;
    logic [15:0] i_data_b;
    logic o_data_valid;
    logic [31:0] o_data_result;
    logic o_data_carryout;    
endinterface