%{
    #include <stdio.h>    
%}

%%
[0-9]+ {printf("%s is a number", yytext);}
[a-zA-Z]+ {printf("%s is a string", yytext);}
.+ {}

%%
yywrap(){
    return 0;
}
int main(){
    yylex();
    return 0;
}