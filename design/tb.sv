`include "seq_adder.sv"


module tb;

    logic rst =0;
    logic clk =0;
    logic [4:0]  i_op_selector =0;
    reg [15:0] i_data_a;
    reg [15:0] i_data_b;
    wire o_data_valid;
    wire [31:0] o_data_result;
    wire o_data_carryout;

    sequential_basic_ula dut (rst,clk,i_op_selector, i_data_a,i_data_b, o_data_valid, o_data_result, o_data_carryout);


    always #5 clk = ~clk;

    initial begin
        rst=1;
        #5;
        
        rst =0;

        
        i_op_selector = OP_ADD;     
        i_data_a [15:0] = 16'h0FFF;
        i_data_b [15:0] = 16'h1;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_SUB;     
        i_data_a [15:0] = 16'h4;
        i_data_b [15:0] = 16'h1;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_MUL;     
        i_data_a [15:0] = 16'h4;
        i_data_b [15:0] = 16'h2;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_DIV;     
        i_data_a [15:0] = 16'h4;
        i_data_b [15:0] = 16'h2;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_AND;     
        i_data_a [15:0] = 16'h4;
        i_data_b [15:0] = 16'h2;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_OR;     
        i_data_a [15:0] = 16'h5;
        i_data_b [15:0] = 16'h2;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_XOR;     
        i_data_a [15:0] = 16'hFF;
        i_data_b [15:0] = 16'h5;
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);

        
        i_op_selector = OP_REV;     
        i_data_a [15:0] = 16'hFF;        
        @(posedge clk);
        $display("DATA A: %H, DATA B: %H, OP: %h , RESULT: %h",  i_data_a , i_data_b , i_op_selector , o_data_result);        
   

        $finish();

    end

endmodule