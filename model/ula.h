#ifndef ULA_H
#define ULA_H

typedef enum { 
    OP_UNUSED = 0,
    OP_ADD, 
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_AND,
    OP_OR,
    OP_XOR,
    OP_REV,
    END_OF_OP_SIZE         
     
} op;

void add_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a + i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("ADD_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}

void sub_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a - i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("SUB_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}

void mul_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a * i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("MUL_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}

void div_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{   
    if(i_data_b == 0)
    {
        *o_data_result =0;
        *o_data_valid =0;
        *o_data_carryout =0;
    }
    else
    {
        *o_data_result = i_data_a / i_data_b;
        *o_data_valid =1;
        *o_data_carryout =0;
        printf("DIV_OP: \n");
        printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
    }
    
}
void and_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a & i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("AND_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}
void or_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a | i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("OR_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}
void xor_op(unsigned short i_data_a, unsigned short i_data_b, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{    
    *o_data_result = i_data_a ^ i_data_b;
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("XOR_OP: \n");
    printf("A:%04X   B: %04X   VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, i_data_b, *o_data_valid, *o_data_result, *o_data_carryout);
}

void rev_op(unsigned short i_data_a, unsigned short* o_data_valid, int *o_data_result, unsigned short *o_data_carryout)
{   
    unsigned int NO_OF_BITS = sizeof(i_data_a) * 8;
    unsigned int reverse_num = 0;
    int i;
    for (i = 0; i < NO_OF_BITS; i++) {
        if ((i_data_a & (1 << i)))
            reverse_num |= 1 << ((NO_OF_BITS - 1) - i);
    }
    
    *o_data_result = reverse_num;    
    *o_data_valid =1;
    *o_data_carryout =0;
    printf("REV_OP: \n");
    printf("A:%04X  VALID: %01X  RES: %08x CARRY: %01x \n\n ", i_data_a, *o_data_valid, *o_data_result, *o_data_carryout);
}

void ula(unsigned short rst, unsigned short clk, short i_op_selector, unsigned short i_data_a, unsigned short i_data_b, unsigned short *o_data_valid, unsigned int *o_data_result, unsigned short *o_data_carryout)
{
    if (rst)
    {
        *o_data_valid    =1;
        *o_data_result   =0;
        *o_data_carryout =0;

        printf("[ULA LOG REFMOD] RESET DONE!\n\n");        
    }

    else
    {
        printf("[ULA LOG REFMOD] NORMAL OPERATION!\n\n");
        *o_data_valid =0;

        switch (i_op_selector)
        {
            case OP_UNUSED: 
                printf("UNUSED OPERATION\n\n");
                break;
            case OP_ADD: 
                add_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_SUB: 
                sub_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_MUL: 
                mul_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_DIV: 
                div_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_AND: 
                and_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_OR:  
                or_op (i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_XOR: 
                xor_op(i_data_a, i_data_b, o_data_valid, o_data_result, o_data_carryout);
                break;
            case OP_REV: 
                rev_op(i_data_a, o_data_valid, o_data_result, o_data_carryout);
                break;                      
            default:
                break;
            }

    }
}

#endif