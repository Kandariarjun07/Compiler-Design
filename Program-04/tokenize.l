%{
#include<stdio.h>
%}

%%

"int"|"float"|"string"|"for"|"while"|"if"|"else if"|"else"|"char"|"double" {
    printf("%s is a keyword\n",yytext);
}

"<"|">"|"+"|"-"|"/"|"%"|"<="|">="|"="|"=="|"+="|"-="|"/="|"*"|"*=" {
    printf("%s is an operator\n",yytext);
}

[a-zA-z_]+[a-zA-z_0-9]* {
    printf("%s is an identifier\n",yytext);

}
","|";"|"("|")"|"{"|"}"|"["|"]" {
    printf("%s is a delimiter\n",yytext);
}
[0-9]*"."[0-9]+|[0-9]+ {
    printf("%s is a number\n",yytext);
}
[ \t\n] {}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code : ");
    yylex();
}