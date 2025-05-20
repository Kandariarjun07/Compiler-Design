%{ 
    #include<stdio.h>   
%} 

%option noyywrap
%s A B DEAD 

%% 

<INITIAL>a               BEGIN A; 
<INITIAL>[^a\n]          BEGIN DEAD; 
<INITIAL>\n              { printf("String not accepted\n"); BEGIN INITIAL; } 

<A>a                     BEGIN A; 
<A>b                     BEGIN B; 
<A>[^ab\n]               BEGIN DEAD; 
<A>\n                    { printf("String not accepted\n"); BEGIN INITIAL; } 

<B>a                     BEGIN A; 
<B>b                     BEGIN B; 
<B>[^ab\n]               BEGIN DEAD; 
<B>\n                    { printf("String Accepted\n"); BEGIN INITIAL; } 

<DEAD>[^\n]              BEGIN DEAD; 
<DEAD>\n                 { printf("String not accepted\n"); BEGIN INITIAL; } 

%% 

int main() { 
    yylex();  
    return 0;  
}
