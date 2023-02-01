/*
@author: Yago Monteiro
@brief:  
*/


class ula_agent extends uvm_agent;
    
    `uvm_component_utils(ula_monitor)

    //create port from monitor to agent (good reuse practice)
    uvm_analysis_port#(ula_transaction) send;

    ula_transaction t;
    virtual ula_interface aif;

      
    
    function new(input string path = "ula_monitor", uvm_component parent = null);
        super.new(path);
        send = new("send", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        t = ula_transaction::type_id::create("t");

        if(!uvm_config_db#(virtual ula_interface)::get(this,"", "aif", aif)) begin
            `uvm_error("[MONITOR]", "Unable to access uvm_config_db");
        end

    endfunction

    virtual task run_phase(uvm_phase phase);
        #10; //same delay in the end of stimuli application 
        t.i_op_selector = aif.i_op_selector;
        t.i_data_a = aif.i_data_a;
        t.i_data_b = aif.i_data_b;
        t.o_data_valid = aif.o_data_valid;
        t.o_data_result = aif.o_data_result;
        t.o_data_carryout = aif.o_data_carryout;

        send.write(t);//send transaction to analysis port. (write will be defined)

    entask



endclass