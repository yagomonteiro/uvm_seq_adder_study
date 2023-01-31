/*
@author: Yago Monteiro
@brief:  
*/

class seq_adder_generator extends uvm_sequence#(seq_adder_transaction);

    `uvm_object_utils(seq_adder_generator);

    seq_adder_transaction sat;


    function new(string path = "seq_adder_generator");
        super.new(path);        
    endfunction

    //virtual task:

    virtual task body();
        sat = seq_adder_transaction::type_id::create("sat");    
        //defines the number of sequences applied to dut
        repeat (10) begin
            start_item(sat);
            sat.randomize();
            finish_item(sat);     
        end
    endtask
    


endclass