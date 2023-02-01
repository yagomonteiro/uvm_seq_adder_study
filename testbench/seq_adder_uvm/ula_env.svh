/*
@author: Yago Monteiro
@brief:  
*/


class ula_env extends uvm_env;

    `uvm_component_utils(ula_env);

    function new(input string path = "ula_env", uvm_component parent = null );
        super.new(path, parent);        
    endfunction

    ula_agent a;
    ula_scoreboard s;
    //add coverage colector here

    virtual function build_phase(uvm_phase phase);
        super.build(phase);
        a = ula_transaction::type_id::create("a", this);
        s = ula_transaction::type_id::create("s", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        a.m.send.connect(s.recv); //connects send port from monitor in scoreboard recv analysis_imp        
    endfunction
    
endclass