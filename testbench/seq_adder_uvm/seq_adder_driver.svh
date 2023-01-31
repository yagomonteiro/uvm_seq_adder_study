/*
@author: Yago Monteiro
@brief:  
*/

class seq_adder_driver extends uvm_driver#(seq_adder_transaction);

    `uvm_component_utils(driver);
    seq_adder_transaction satc;
    virtual seq_adder_interface aif;

    function new(input string path = "seq_adder_driver", uvm_component parent = null);
        super.new(path, parent);        
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        satc = seq_adder_transaction::type_id::create("satc");

        if(!uvm_config_db#(virtual seq_adder_interface)::get(this,"", "aif", aif)) begin
            `uvm_error("[DRIVER]", "Unable to access uvm_config_db");
        end

    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(satc);            
                aif.i_op_selector <= satc.i_op_selector;
                aif.i_data_a <= satc.i_data_a;
                aif.i_data_b <= satc.i_data_b;
            seq_item_port.item_done();
            #10;
        end
    endtask


endclass