%{
#include <stdio.h>
#include <y.tab.h>

%}

IDENTIFIER [a-zA-Z][a-zA-Z0-9]+
NUMBER [0-9]+

%%
"print"  {return print;}
"(" {return left_brace;}
")" {return right_brace;}
"=" {return equal_to;}
NUMBER {return number;}
IDENTIFIER {return identifier;}
.+ {}

%%
yywrap(){
    return 0;
}
int main(){
    yylex();
    return 0;
}