%{
    #include "parser.tab.h"
    extern int yylval;
%}

%%
[0-9]+ {yylval = atoi(yytext); return NUM;}
\n      return 0;
[ \t]   /* ignore whitespace */
.       return *yytext;
%%

int yywrap()
{
    return 1;
}