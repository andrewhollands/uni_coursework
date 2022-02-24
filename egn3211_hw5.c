//
//  egn3211_hw5.c
//  HW5
//
//  Created by Andrew Richard Hollands on 3/4/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//  All questions are the property of the University of Central Florida.
//

//Q1: (Bisection method): Write a program to find solutions accurate to within 10−2 for 𝑥3 − 𝑥2 + 2 = 0 on interval [-200,300]. Use the Bisection method to solve this problem. The output should look like below.

#include <stdio.h>
#include <math.h>

int count = 0;

double equation(double x)   {
    return pow(x, 3) - pow(x, 2) + 2;
}

double findRoot(double a, double b) {
    double root;
    count++;
    if (equation(a) * equation(b) >= 0) {
        printf("The method failed after %d iterations.", count);
        return 0;
    }
    root = a;
    while ((b - a) >= 0.01) {
        root = (a + b) / 2;
        if (equation(root) == 0)    {
            break;
        }
        else if (equation(root) * equation(a) < 0)  {
            b = root;
        }
        else    {
            a = root;
        }
    }
    return root;
}

int main(void)  {
    int left = -200;
    int right = 300;
    float root = findRoot(left, right);
    printf("The procedure was successful.\nThe value of root is: %.4f\n", root);
    return 0;
}

//Q2: (Fixed-Point iteration method): Write a program to find solutions accurate to within 10−2 for 𝑥3 − 𝑥2 + 2 = 0 on interval [-200,300]. Use the Fixed-point iteration method to solve this problem. The output should look like below.

#include <stdio.h>
#include <math.h>

double equation(double x)   {
    return pow(x, 3) - pow(x, 2) + 2;
}

int main(void)  {
    double x0 = -200;
    double x1 = 300;
    for (int i = 1; i <= 20; i++)  {
        x1 = equation(x0);
        if (fabs(x1-x0)<1e-2)
            break;
        x0 = x1;
        if (i == 20)   {
            printf("The method failed after 20 iterations.\n");
            return 0;
        }
    }
    printf("The procedure was successful.\nThe value of root is : %.4f\n", x1);
    return 0;
}

//Q3: (Newton’s method): Write a program to find solutions accurate to within 10−2 for 𝑥3 − 𝑥2 + 2 = 0 on interval [-200,300]. Use the Newton’s method to solve this problem. The output should look like below.

#include <stdio.h>
#include <math.h>

// Introducing given function to the program
double equation(double x)    {
    return pow(x, 3) - pow(x, 2) + 2;
}
// Finds root of the given function
void findRoot(double left, double right)  {
    double root = left; // Initializes root as left bound x-value
    while ((right - left) >= 0.01)    { // Difference of left and right bounds
        root = (left + right) / 2; // Check if middle point is root
        if (equation(root) == 0.0) {
            break;
        }
        // Decide the side to repeat the steps based on condition in steps 4 and 5
        else if (equation(root) * equation(left) < 0) {
            right = root;
        }
        else    {
            left = root;
        }
    }
    if((right - left) < 0.01)    {
        printf( "The value of root is : %.4f\n" , root);
    }
    else    {
        printf("The method failed after 20 iterations");
    }
}
// Driver program to test above function
int main(void)  {
    // Initial values as provided
    double left = -200, right = 300;
    findRoot(left, right);
    return 0;
}
