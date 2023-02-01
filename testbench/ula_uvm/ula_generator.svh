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
        t = ula_transaction::type_id::create("t");    
        //defines the number of sequences applied to dut
        repeat (5) begin
            start_item(t);
            // assert(t.randomize());       // just randomize data from class transaction
            t.i_data_a = $urandom();
            t.i_data_b = $urandom();
            t.i_op_selector = $urandom_range(0,15);

            finish_item(t);     
        end
    endtask
    


endclass