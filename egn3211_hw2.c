//  HW2
//
//  Created by Andrew Richard Hollands on 1/17/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//  All questions are the property of the University of Central Florida.
//

//Q1: (Formatting Code) : The C programming language generally ignores whitespace when coding. The following program can be copied (cut-n-pasted) into REPL and run.

#include <stdio.h>

int main (void)
{
    int number1, number2;
    char comma;

    printf("Enter two integers, separated by a comma: ");
    scanf("%d%c%d", &number1, &comma, &number2);

    if(number1 > number2)
        printf("%d is larger.\n",number1);
    if (number2 > number1)
        printf("%d is larger.\n", number2);
    if (number1 == number2)
        printf("These numbers are equal.");

    return 0;
}


//Q2: (Debugging Code) : As you are learning to program in C, you will often spend a lot of time debugging code and finding errors. It takes a lot of practice to develop this skill. There are many errors in the following program. Find and correct all the errors so that the program compiles and produces the correct output. (Add a new comment on line 1 of the code and list the errors.)

//List of errors in uncorrected code: Incorrect multi-line comment opening at line 2; Incorrect multi-line comment closing at line 4; Extraneous space between "#" and "include", "standardio" should read "stdio", comma should be a period, quotation should be > at line 6; Extraneous indentation before "int", "Main" is capitalized; "void" is contained in curly braces at line 8; Function body is incorrectly contained in brackets at line 9; "Integer"; extraneous newline at line 10; //Unterminated multi-line comment at line 11; Missing semicolon at line 12; Incorrect spelling of "scanf", missing "&" for addressing int "radius" at line 13; Incorrect closing quotation at line 15; Missing comma, incorrect use of colon, extraneous space after second "radius" at line 16; Incorrect newline indicator, extraneous "*", extraneous space after "radius" at line 17; Incorrect quotations at line 18; Missing semicolon at line 19; Function body is incorrectly contained in brackets, comment is missing an additional "/"
/*
 *   Find all the errors challenge
*/

#include <stdio.h>

int main(void)
{
    int radius;
/* Prompt user and obtain inputs */
    printf("%s","Enter the radius of a circle as an integer: ");
    scanf("%d", &radius);
// Calculate and and print solution
    printf("For a circle with radius %d:\n", radius);
    printf("Diameter = %d\n", radius + radius);
    printf("Circumference = %f\n", 2 * 3.14159 * radius);
    printf("Area = %f\n", 3.14159 * radius * radius );
    return 0;
}

//Q3: (Shapes with Asterisks) : Write a program that prints your initials with asterisks (*). The letters of your initials should look like the letters below (11*11 dot matrix).

#include <stdio.h>

int main(void)
{
    printf("    ***      ***     ***\n");
    printf("   *****     ***     ***\n");
    printf("  *******    ***     ***\n");
    printf(" **** ****   ***     ***\n");
    printf("****   ****  ***********\n");
    printf("***     ***  ***********\n");
    printf("***********  ***********\n");
    printf("***********  ***     ***\n");
    printf("***********  ***     ***\n");
    printf("***     ***  ***     ***\n");
    printf("***     ***  ***     ***\n");

    return 0;
}

//Q4: (Printing Values with printf) : Write a program that prints four last digits of your NID on the same line. For example if your NID is ab23456, the program should print 3456 using the following methods.

#include <stdio.h>

int main(void)
{
    int lastFourOfNID1 = 6, lastFourOfNID2 = 3, lastFourOfNID3 = 4, lastFourOfNID4 = 1;

    //a) Using one printf statement with no conversion specifiers (Conversion specifier: %d for integers, %s for strings).
    printf("6341\n");

    //b) Using one printf statement with four conversion specifiers.
    printf("%d%d%d%d\n", lastFourOfNID1, lastFourOfNID2, lastFourOfNID3, lastFourOfNID4);

    //c) Using four printf statements.
    printf("%d", lastFourOfNID1);
    printf("%d", lastFourOfNID2);
    printf("%d", lastFourOfNID3);
    printf("%d\n", lastFourOfNID4);

    return 0;
}

//Q5: (Printing Values with printf): Write a program that prompts the user to enter values for a, b, and c and displays the summation and product of a, b and c. The output should look like below for a=1, b=2 and c=3:

#include <stdio.h>

int main(void)
{
    int a, b, c;

    printf("Enter a, b, and c in order, separated by spaces: ");
    scanf("%d%d%d", &a, &b, &c);
    printf("The sum of a, b, and c is: %d\n", a + b + c);
    printf("The product of a, b, and c is: %d\n", a * b * c);

    return 0;
}
