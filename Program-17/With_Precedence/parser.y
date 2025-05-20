%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%token PLUS MINUS MUL DIV LP RP

/* Operator precedence declarations */
%left PLUS MINUS  /* Lower precedence */
%left MUL DIV     /* Higher precedence */
%right UMINUS     /* Highest precedence (for unary minus) */

%%

input: /* empty */
     | expr    { printf("Result = %d\n", $1); }
     ;

expr: expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr   { $$ = $1 - $3; }
    | expr MUL expr     { $$ = $1 * $3; }
    | expr DIV expr     { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
        } else {
            $$ = $1 / $3; 
        }
      }
    | LP expr RP        { $$ = $2; }
    | MINUS expr %prec UMINUS  { $$ = -$2; } /* Unary minus */
    | NUMBER            { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter an arithmetic expression (with operator precedence grammar): ");
    yyparse();
    return 0;
}