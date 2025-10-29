#include <stdio.h>


extern int factorial(int n);

int main() {
    int number;
    printf("Enter an integer: ");
    scanf("%d", &number);

    int result;

    result = factorial(number);

    
    printf("The factorial of %d is %d\n", number, result);

    return 0;
}