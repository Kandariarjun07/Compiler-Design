%{
#include<stdio.h>
%}

%%
\"[^\"]*\"  {
    printf("%s is a string\n",yytext);
}

"int"|"float"|"string"|"for"|"while"|"if"|"else if"|"else"|"char"|"double" {
    printf("%s is a keyword\n",yytext);
}

[0-9]+  {
    printf("%s is a integral literal\n",yytext);
}

[0-9]*"."[0-9]+ {
    printf("%s is a floating literal\n",yytext);
}

[a-zA-Z_][a-zA-Z_0-9]* {
    printf("%s is an identifier\n",yytext);
}

. {}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
}