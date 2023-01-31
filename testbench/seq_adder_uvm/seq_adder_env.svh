/*
@author: Yago Monteiro
@brief:  
*/


class seq_adder_env extends uvm_env;

    `uvm_component_utils(seq_adder_env);

    function new(input string path = "seq_adder_env", uvm_component parent = null );
        super.new(path, parent);        
    endfunction

    seq_adder_agent a;
    seq_adder_scoreboard s;
    //add coverage colector here

    virtual function build_phase(uvm_phase phase);
        super.build(phase);
        a = seq_adder_transaction::type_id::create("a", this);
        s = seq_adder_transaction::type_id::create("s", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        a.m.send.connect(s.recv); //connects send port from monitor in scoreboard recv analysis_imp        
    endfunction
    
endclass