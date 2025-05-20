%{
    #include "parser.tab.h"
%}

%%
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return LP;}
")" {return RP;}
[ \t] {} /* Skip spaces and tabs */
[\n] {return 0;} /* Return 0 to signal end of input on newline */
. {printf("Invalid character: %s\n", yytext); return 0;}
%%

int yywrap(){
    return 1;
}