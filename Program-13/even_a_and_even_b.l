%{ 
    #include <stdio.h> 
%} 

%option noyywrap
%s A B C DEAD 

%% 

<INITIAL>a               BEGIN A; 
<INITIAL>b               BEGIN B; 
<INITIAL>\n              { printf("String Accepted\n"); BEGIN INITIAL; } 
<INITIAL>[^ab\n]         BEGIN DEAD; 

<A>a                     BEGIN INITIAL; 
<A>b                     BEGIN C; 
<A>\n                    { printf("String Unaccepted\n"); BEGIN INITIAL; } 
<A>[^ab\n]               BEGIN DEAD; 

<B>a                     BEGIN C; 
<B>b                     BEGIN INITIAL; 
<B>\n                    { printf("String Unaccepted\n"); BEGIN INITIAL; } 
<B>[^ab\n]               BEGIN DEAD; 

<C>a                     BEGIN B; 
<C>b                     BEGIN A; 
<C>\n                    { printf("String Unaccepted\n"); BEGIN INITIAL; } 
<C>[^ab\n]               BEGIN DEAD; 

<DEAD>\n                 { printf("String Unaccepted\n"); BEGIN INITIAL; } 
<DEAD>[^\n]              BEGIN DEAD; 

%% 

int main() { 
    yylex(); 
    return 0; 
}
