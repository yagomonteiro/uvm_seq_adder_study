#include <stdio.h>
#include "ula.h"


int main()
{
    
    int i=0;

    unsigned short rst =0;
    unsigned short clk =0;
    unsigned short i_op_selector=1;
    unsigned short i_data_a=0xF000;
    unsigned short i_data_b=2;
    unsigned short o_data_valid=0;
    unsigned int o_data_result=0;
    unsigned short o_data_carryout=0;

    rst=0;    

    //checking ops
    for ( i = 0; i < END_OF_OP_SIZE; i++)
    {
        ula(rst, clk, i_op_selector+i, i_data_a, i_data_b, &o_data_valid, &o_data_result, &o_data_carryout);
    }
    


}