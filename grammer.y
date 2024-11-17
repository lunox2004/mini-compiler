%{
    #include "y.tab.h"
    #include <stdio.h>
    int yylex(void);
    int yyerror(const char *s);
    int success = 1;
%}

%start line
%token print left_brace right_brace equal_to identifier
%token <num> number
%union{
    int num;
}

%%

line : print_statement 
    ;

print_statement : print left_brace number right_brace {printf("%d\n", $3);}
    ;

%%
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