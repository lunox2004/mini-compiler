%{
    #include "y.tab.h"
    #include <stdio.h>
    #include <string.h>
    int yylex(void);
    int yyerror(const char *s);
    int success = 1;
    
    typedef struct symbol_table{
        string name;
        int data_type;
        union{
            int intValue;
        } value;
        symbol_table *next;

    } symbol_table;

    symbol_table *head_pointer = NULL;

    enum data_type{
        integer_type

    };


}
%}

%start line
%token print left_brace right_brace equal_to integer
%token <str> identifier
%token <num> number
%union{
    int num;
    char *str;
}

%%

line : print_statement
    | declaration
    ;

print_statement : print left_brace number right_brace {printf("%d\n", $3);}
    ;

declaration : integer identifier equal_to number {
                    head_pointer = insert_value(integer_type, $4, &head_pointer, $2)}
%%


symbol_table *insert_value(int data_type, int data_value, symbol_table **head_pointer, char* name){
    
    symbol_table *temp = (symbol_table*)malloc(sizeof(symbol_table));
    strcpy(temp->name , name);
    temp->data_type = data_type;
    temp->value.intValue = data_value;
    temp->next = *head_pointer;

    return temp;
}

int main()

{
    yyparse();
    if(success)
        printf("Parsing Successful\n");

    return 0;

}


int yyerror(const char *msg)

{

 extern int yylineno;

 printf("Parsing Failed\nLine Number: %d %s\n",yylineno,msg);

 success = 0;

 return 0;

}