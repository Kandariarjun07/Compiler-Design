%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%token PLUS MINUS MUL DIV LP RP
%left PLUS MINUS
%left MUL DIV
%%

input: /* empty */
     | expr    {printf("Valid Arithmetic Expression\n");}
     ;

expr: expr PLUS expr 
    | expr MINUS expr 
    | expr DIV expr 
    | expr MUL expr 
    | LP expr RP 
    | NUMBER
    ;

%%

void yyerror(const char *s){
    printf("Not a Valid Arithmetic Expression\n");
}

int main(){
    printf("Enter an Arithmetic Expression: ");
    int x = yyparse();
    return 0;
}