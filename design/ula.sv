

//defines op_selector enum datatype
typedef enum bit[3:0]
{   OP_UNUSED = 4'b0000,
    OP_ADD    = 4'b0001,
    OP_SUB    = 4'b0010,
    OP_MUL    = 4'b0011,
    OP_DIV    = 4'b0100,
    OP_AND    = 4'b0101,
    OP_OR     = 4'b0110,
    OP_XOR    = 4'b0111,
    OP_REV    = 4'b1000      
     
} op;



module ula(
    input logic rst,
    input logic clk,
    input [4:0]  i_op_selector,
    input [15:0] i_data_a,
    input [15:0] i_data_b,
    output logic o_data_valid,
    output logic [31:0] o_data_result,
    output logic o_data_carryout
);



    initial begin
        op op_list;
    end

    always @(posedge clk or rst) begin

        if (rst) begin        
            o_data_valid    =0;
            o_data_result   =0;
            o_data_carryout =0;        
            $display("[ULA LOG] RESET DONE!");
        end

        else begin
            $display("[ULA LOG] NORMAL MODE OPERATION");
            o_data_valid    =0; //before operation data is invalid       

            case (i_op_selector)
                OP_ADD: add_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_SUB: sub_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_MUL: mul_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_DIV: div_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_AND: and_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_OR:  or_op (i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_XOR: xor_op(i_data_a,i_data_b,o_data_valid,o_data_result,o_data_carryout);
                OP_REV: rev_op(i_data_a,o_data_valid,o_data_result,o_data_carryout);
                            
                default: begin
                    o_data_valid =0;
                end
            endcase

        end

        
    end


    task add_op(input [15:0] a, input [15:0] b, output valid,  output [15:0] result, output carry );         
        {carry,result} = a + b;
        valid = 1;    
        $display("======ADD_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h VALID: %h \n\n ", a, b,  {carry,result}, valid);

    endtask

    task sub_op(input [15:0] a, input [15:0] b, output  valid,  output [15:0] result, output carry );   
        {carry, result[15:0]} = a - b;
        valid = 1;
        $display("======SUB_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h VALID >> %h \n\n", a, b,  {carry, result}, valid); 
    endtask

    task mul_op(input [15:0] a, input [15:0] b, output valid,  output [15:0] result, output carry );   
        {carry,result} = a * b;
        valid = 1;
        $display("======MUL_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h  VALID >> %h  \n\n", a, b,  {carry, result},valid);    
    endtask

    task div_op(input [15:0] a, input [15:0] b, output valid,  output [15:0] result, output carry );   
        //TODO: REVIEW THIS
        {carry,result} = a / b;
        valid = 1;
        $display("====== DIV_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h VALID >> %h \n\n", a, b,  {carry, result}, valid);    
    endtask

    task and_op(input [31:0] a, input [31:0] b, output valid,  output [31:0] result, output carry );
        carry =0;      
        result = a & b;
        valid = 1;
        $display("====== AND_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h VALID >> %h \n\n", a, b,  {carry, result}, valid);
    endtask

    task or_op(input [31:0] a, input [31:0] b, output valid,  output [31:0] result, output carry );
        carry =0;  
        {carry,result} = a | b;
        valid = 1;
        $display("====== OR_OP Received params:  A-> %h B-> %h  | OUTPUT >> %h VALID >> %h \n\n", a, b,  {carry, result}, valid);
    endtask

    task xor_op(input [31:0] a, input [31:0] b, output  valid,  output [31:0] result, output carry );   
        {carry,result} = a ^ b;
        valid = 1;
        $display("====== XOR_OP Received params:  A-> %h B-> %h OUTPUT >> %h VALID >> %h \n\n", a, b,  {carry, result}, valid);   
    endtask

    task rev_op(input [31:0] a, valid,  output [31:0] result, output carry );  
    
        for (int i=0; i<32; ++i) begin
        result [i] = a[31-i];       
        end
        valid = 1;
        $display("====== REV_OP Received params:  A-> %h \n\n", a);        
        
    endtask


endmodule




