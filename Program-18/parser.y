%{
#include <stdio.h>   
void yyerror(const char *s); 
int yylex();  
%}

%token NUM
%left '+' '-'
%left '*' '/'
%right NEGATIVE

%%
S: E {printf("\n"); return 0;}
   ;
E: E '+' E  {printf(" + ");}
   |  E '*' E {printf(" * ");}
   |  E '-' E {printf(" - ");}
   |  E '/' E {printf(" / ");}
   |  '(' E ')'
   |  '-' E %prec NEGATIVE {printf(" -");}
   |  NUM   {printf("%d", $1);}
   ;
%%

int main()
{
    printf("Input infix expression: ");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("\nError: %s\n", s);
}