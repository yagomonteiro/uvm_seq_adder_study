
/*
@author: Yago Monteiro
@brief:  
*/



import ula_resources::*;
`include "./ula_interface.sv"
`include "../../design/ula.sv"



module tb_top();

    logic rst=0;
    logic clk=0;

    ula_if aif();

    ula dut(
        .rst(aif.rst),
        .clk(aif.clk),
        .i_op_selector(aif.i_op_selector),
        .i_data_a(aif.i_data_a),
        .i_data_b(aif.i_data_b),
        .o_data_valid(aif.o_data_valid),
        .o_data_result(aif.o_data_result),
        .o_data_carryout(aif.o_data_carryout)    
    );

    initial begin
        uvm_config_db#(virtual ula_if)::set(null, "uvm_test_top.e.a*","aif",aif);
        //$set_coverage_db_name("database_name");
        run_test("ula_test");

    
    end
  
   
endmodule




