/*
@author: Yago Monteiro
@brief:  
*/


class seq_adder_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(seq_adder_scoreboard);
    uvm_analysis_imp#(seq_adder_transaction, seq_adder_scoreboard) recv; //analysys_imp to receive from monitor->agent -> scbrd
    seq_adder_transaction sat;

    function new(string path = "seq_adder_scoreboard", uvm_component parent = null);
        super.new(path,parent);
        recv = new("recv", this);    
    endfunction

    virtual function build_phase(uvm_phase phase);
        super.build(phase);
        sat = seq_adder_transaction::type_id::create("sat");       
    endfunction

    virtual function void write(input seq_adder_transaction satr);
        sat = satr;
        `uvm_info("[SCOREBOARD]", "SCOREBOARD SANITY", UVM_NONE);
    endfunction
endclass