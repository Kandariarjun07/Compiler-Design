%{
#include<stdio.h>
%}

%%

[0-9]*[02468] {printf("%s is an even number",yytext);}
[0-9]*[13579] {printf("%s is an odd number",yytext);}
.* {printf("%s is not a valid number",yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter number : ");
    yylex();
}