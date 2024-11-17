%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

%}

IDENTIFIER [a-zA-Z][a-zA-Z0-9]+
NUMBER [0-9]+

%%
"print"  {return print;}
"integer" {return integer;}
{NUMBER} {yylval.num = atoi(yytext); return number;}
{IDENTIFIER} {return identifier;}
"(" {return left_brace;}
")" {return right_brace;}
"=" {return equal_to;}

. {printf("invalid token %s\n" , yytext);}

%%
yywrap(void){
    return 1;
}
