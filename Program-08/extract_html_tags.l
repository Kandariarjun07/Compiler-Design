%{
#include<stdio.h>
%}

%%

"<"[^>]*">" {
    fprintf(yyout,"%s",yytext);
}
. {}

%%

int yywrap() {
    return 1;
}
int main() {
    extern FILE* yyin, *yyout;
    yyin = fopen("index.html","r");
    yyout = fopen("output.txt","w");

    yylex();
    
}