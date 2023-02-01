/*
@author: Yago Monteiro
@brief:  
*/

`include "uvm_macros.svh"
import uvm_pkg::*;

class ula_transaction extends uvm_sequence_item;

    //describes the form of a stimulus to be applied to dut

    //rst and clk are external, a good practice is to not put they inside transaction
    rand logic [4:0]  i_op_selector;
    rand logic [15:0] i_data_a;
    rand logic [15:0] i_data_b;

    rand logic [31:0] o_data_result;
    rand logic o_data_valid;
    rand logic o_data_carryout;

    //constructor
    function new(input string path="ula_transaction");
        super.new(path);
    endfunction

    //registering datafields to factory
    `uvm_object_utils_begin(ula_transaction);
        `uvm_field_int(i_op_selector, UVM_DEFAULT);
        `uvm_field_int(i_data_a, UVM_DEFAULT);
        `uvm_field_int(i_data_b, UVM_DEFAULT);
        `uvm_field_int(o_data_result, UVM_DEFAULT);
        `uvm_field_int(o_data_valid, UVM_DEFAULT);
        `uvm_field_int(o_data_carryout, UVM_DEFAULT);
    `uvm_object_utils_end


endclass