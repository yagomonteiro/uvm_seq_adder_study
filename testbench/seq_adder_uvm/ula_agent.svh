/*
@author: Yago Monteiro
@brief:  
*/

class ula_agent extends uvm_agent;

    `uvm_component_utils(ula_agent);    

    //following reuse good practice: create a analisys port from monitor to agent and another
    // one to expose from agent
    uvm_analysis_port#(ula_transaction) send;

    function new(input string path = "ula_agent", uvm_component parent = null); // TODO:check c
        super.new(path, parent);        
    endfunction

    ula_monitor m;
    ula_driver  d;
    uvm_sequencer#(ula_transaction) seqr;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m = ula_monitor::type_id::create("m",this);
        d = ula_monitor::type_id::create("d",this);
        seqr = uvm_sequencer#(ula_transaction)::type_id::create("seqr",this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        d.seq_item_port.connect(seqr.seq_item_export); //connects driver output
        m.send.connect(this.send); //connects send port from monitor to the port declared here
    endfunction


endclass