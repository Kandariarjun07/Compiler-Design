%{
#include<stdio.h>
%}

%%

[a-zA-Z_][a-zA-Z_0-9]* {printf("%s is a valid identifier",yytext);}
.* {printf("%s is a not valid identifier",yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter identifier : ");
    yylex();
}