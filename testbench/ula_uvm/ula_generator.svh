/*
@author: Yago Monteiro
@brief:  
*/

class ula_generator extends uvm_sequence#(ula_transaction);

    `uvm_object_utils(ula_generator)

    ula_transaction t;


    function new(string path = "ula_generator");
        super.new(path);        
    endfunction

    //virtual task:

    virtual task body();
        sat = ula_transaction::type_id::create("t");    
        //defines the number of sequences applied to dut
        repeat (10) begin
            start_item(t);
            sat.randomize();
            finish_item(t);     
        end
    endtask
    


endclass