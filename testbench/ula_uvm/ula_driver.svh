/*
@author: Yago Monteiro
@brief:  
*/

class ula_driver extends uvm_driver#(seq_adder_transaction);

    `uvm_component_utils(ula_driver)

    ula_transaction tc;
    virtual ula_interface aif;

    function new(input string path = "ula_driver", uvm_component parent = null);
        super.new(path, parent);        
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tc = seq_adder_transaction::type_id::create("tc");

        if(!uvm_config_db#(virtual seq_adder_interface)::get(this,"", "aif", aif)) begin
            `uvm_error("[DRIVER]", "Unable to access uvm_config_db");
        end

    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(tc);            
                aif.i_op_selector <= tc.i_op_selector;
                aif.i_data_a <= tc.i_data_a;
                aif.i_data_b <= tc.i_data_b;
            seq_item_port.item_done();
            #10;
        end
    endtask


endclass