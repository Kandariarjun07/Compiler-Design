%{ 
    #include <stdio.h> 
%} 

%option noyywrap
%s INT A FLOAT ID DEAD 

%% 

<INITIAL>[0-9]           BEGIN INT; 
<INITIAL>[a-zA-Z_]       BEGIN ID; 
<INITIAL>[^a-zA-Z0-9_\n] BEGIN DEAD; 
<INITIAL>\n              { printf("Invalid String\n"); BEGIN INITIAL; } 

<INT>[0-9]               BEGIN INT; 
<INT>\.                  BEGIN A; 
<INT>[^0-9\.\n]          BEGIN DEAD; 
<INT>\n                  { printf("Integer\n"); BEGIN INITIAL; } 

<A>[0-9]                 BEGIN FLOAT; 
<A>[^0-9\n]              BEGIN DEAD; 
<A>\n                    { printf("Invalid String\n"); BEGIN INITIAL; } 

<FLOAT>[0-9]             BEGIN FLOAT; 
<FLOAT>[^0-9\n]          BEGIN DEAD; 
<FLOAT>\n                { printf("Floating Number\n"); BEGIN INITIAL; } 

<ID>[a-zA-Z0-9_]         BEGIN ID; 
<ID>[^a-zA-Z0-9_\n]      BEGIN DEAD; 
<ID>\n                   { printf("Identifier\n"); BEGIN INITIAL; } 

<DEAD>\n                 { printf("Invalid String\n"); BEGIN INITIAL; } 
<DEAD>[^\n]              BEGIN DEAD; 

%% 

int main() { 
    yylex(); 
    return 0; 
}
