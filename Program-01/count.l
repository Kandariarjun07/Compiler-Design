%{
#include<stdio.h>
int lines = 0, spaces=0, tabs = 0, others = 0;
%}

%%

[\n]    {lines++;}
[\t]    {tabs++;}
[ ]     {spaces++;}
.      {others++;}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter Sentence : ");
    yylex();

    printf("Lines : %d\n",lines);
    printf("Spaces : %d\n",spaces);
    printf("Tabs : %d\n",tabs);
    printf("Others : %d\n",others);
}