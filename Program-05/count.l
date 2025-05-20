%{
#include<stdio.h>
int chars = 0, words=0, whitespaces = 0;
%}

%%
[ \t\n] {
    whitespaces++;
}
[^ \n\t]+ {
    chars=chars+yyleng;
    words++;
}

%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE* yyin;
    yyin = fopen("input.txt","r");

    yylex();
    printf("The number of total characters in the given input file is: %d\n",chars);
    printf("The number of total words in the given input file is: %d\n",words);
    printf("The number of total white spaces in the given input file is: %d\n",whitespaces);
}