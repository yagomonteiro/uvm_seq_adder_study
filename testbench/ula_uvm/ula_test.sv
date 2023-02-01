/*
@author: Yago Monteiro
@brief:  
*/

class ula_test extends uvm_test;
    `uvm_component_utils(ula_test)

    ula_generator gen;
    ula_env e;

    
    function new(input string path = "ula_test", uvm_component parent = null); //inst = TEST??
        super.new(path, parent);        
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        gen = ula_generator::type_id::create("gen",this);
        e   = ula_env::type_id::create("e",this);        
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        gen.start(e.a.seqr);
        phase.drop_objection(this);        
    endtask




endclass