#include<stdio.h>

int main(){
    int num;
    printf("Enter an integer: ");
    scanf("%d", &num);

    int ans = 1;
    for(int i = num; i > 0; i--){
        ans *= i;
    }

    printf("The factorial of %i is %i \n", num, ans);

}