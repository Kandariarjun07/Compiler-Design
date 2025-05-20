%{ 
#include<stdio.h> 
%} 

%% 
^[a-zA-Z0-9._%+-]+@gmail\.com$ {
    printf("Valid Email\n");
} 
.* {
    printf("Not a valid email\n");
} 
%% 

int yywrap(){ 
    return 1; 
} 

int main(){ 
    printf("Enter your email: "); 
    yylex(); 
    return 0; 
}