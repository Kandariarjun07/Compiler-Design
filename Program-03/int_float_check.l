%{
#include<stdio.h>
%}

%%

[0-9]+ {printf("%s is an integer",yytext);}
[0-9]*"."[0-9]+ {printf("%s is a floating number",yytext);}
.* {printf("%s is not a valid number",yytext);}

%%

int yywrap() {
    return 1;
}
int main() {
    printf("Enter number : ");
    yylex();
}