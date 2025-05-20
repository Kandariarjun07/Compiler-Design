%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%token PLUS MINUS MUL DIV LP RP


%%

input: /* empty */
     | expr    { printf("Result = %d\n", $1); }
     ;

expr: term    { $$ = $1; }
    | expr PLUS term    { $$ = $1 + $3; }
    | expr MINUS term   { $$ = $1 - $3; }
    ;

term: factor    { $$ = $1; }
    | term MUL factor   { $$ = $1 * $3; }
    | term DIV factor   { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
        } else {
            $$ = $1 / $3; 
        }
      }
    ;

factor: NUMBER    { $$ = $1; }
      | LP expr RP    { $$ = $2; }
      | MINUS factor  { $$ = -$2; } /* Unary minus */
      ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter an arithmetic expression (without operator precedence grammar): ");
    yyparse();
    return 0;
}