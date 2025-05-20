%{
#include<stdio.h>
int vowels = 0, consonents = 0;
%}

%%

[aeiouAEIOU] {vowels++;}
[a-zA-Z] {consonents++;}
. {}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter String : ");
    yylex();
    printf("Total number of Vowels are: %d\n", vowels);
    printf("Total number of Consonents are: %d\n", consonents);
}