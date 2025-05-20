%{
#include<stdio.h>
%}

%%

"//"[^\n]*  {}
"/*"([^*]*|[*]+[^/])*[*]+"/" {}
. {
    fprintf(yyout,"%s",yytext);
}

%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE* yyin, *yyout;
    yyin = fopen("input.c","r");
    yyout = fopen("output.c","w");

    yylex();
    
}