/*
@author: Yago Monteiro
@brief:  
*/


class ula_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(ula_scoreboard)
    uvm_analysis_imp#(ula_transaction, ula_scoreboard) recv; //analysys_imp to receive from monitor->agent -> scbrd
    ula_transaction t;

    function new(string path = "ula_scoreboard", uvm_component parent = null);
        super.new(path,parent);
        recv = new("recv", this);    
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        t = ula_transaction::type_id::create("t",this);       
    endfunction

    virtual function void write(input ula_transaction tr);
        t = tr;
        `uvm_info("[SCOREBOARD]", "SCOREBOARD SANITY", UVM_NONE);
    endfunction
endclass