#include <stdio.h>
/*
    The stdio.h header file is used to read the input from the user and print the output to the console.
    The stdlib.h header file is used to use the exit function.
*/
/*
    The main function is the entry point of the program.
*/
#include <stdlib.h>
// Function to read the input from the user
/*
    The main function is the entry point of the program.
*/
int main()
{
    // Variable to store the input
    int input;
    // Read the input from the user
    scanf("%d", &input);
    // Print the input
    printf("The input is: %d\n", input);
    // Return 0 to indicate the successful completion of the program
    return 0;
}