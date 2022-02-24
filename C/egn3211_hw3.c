//  HW3
//
//  Created by Andrew Richard Hollands on 2/1/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//  All questions are the property of the University of Central Florida.
// 

//Q1: (Find the Errors) (15 points) The only way to get good at finding errors is lots of practice, and with each chapter there are more kinds of syntax errors to look for. Find all the errors in the code below so that it produces the correct output.

#include <stdio.h>
int main(void)  {
    double salesAmount;
    //Gets First Sales Amount
    puts(":");
    printf("%s", "Enter sales in dollars (-1 to end): $");
    scanf("%lf", &salesAmount);
    while (salesAmount > - 1)  {
        printf("Salary is: $%.2lf\n\n", 200.0 + (.09 * salesAmount));
        printf("%s", "Enter sales in dollars (-1 to end): $");
        scanf("%lf", &salesAmount);
    }
    return 0;
}

//Changed the extra space between "int" and "Main(void)" and decapitalzed "Main" solely for preference
//Added a colon in puts function's quotations
//Changed datatype "salesAmount" to "double" instead of "int"
//Added a newline after each semicolon or comment to produce easy-to-read code
//Changed "%d" to "%lf" in first scan function
//Changed "==" to ">" in "while (salesAmount == - 1)"
//Deleted semicolon after "while (salesAmount > - 1)"
//Changed "%.2f" in second printf function to "%.2lf"
//Changed "%f" to "%lf" in final scan function
//Added an ampersand before "salesAmount" in final scan function

//Q2: (Integer Sequences with While Loops) (25 points): Loops are very useful for counting and generating sequences of integers. If you can use a variable with a loop to count from 0 to n, then you can often transform that variable n using a formula or function such that f(n) results in a new integer sequence. Write a program that prompts the user to enter a number between 2 and 20, and then uses a series of while loops to generate some interesting integer sequences. The loop counters should all start at zero, but the transformed number may start at a number other than zero. The exact prompts and outputs needed can be found in the sample output given below. Use 2 spaces between each integer printed.

#include <stdio.h>

/* function main begins program execution */
int main(void)  {

    /* initialization phase */
    int counter1 = 0;
    int counter2 = 0;
    int counter3 = 1;
    int counter4 = 0;
    int counter5 = 0;

    int n; /* variable n */
    printf("Enter a number between 2 and 20: "); /* prompt for input */
    scanf("%d", &n); /* read variable n from user */

    /* constraining variable n to between 2 and 20 */
    if (n < 2 || n > 20)    {
        printf("Invalid entry! Please enter a number between 2 and 20.\n"); /* display error message */
        return 0; /* exit program */
    } /* end if */

    printf("The first %d whole numbers: ", n); /* display message */

    /* loop until counter reaches variable n */
    while (counter1 < n)    {
        printf("%d  ", counter1); /* display whole number sequence */
        counter1++; /* increment counter1 */
    } /* end while */
    printf("\nThe first %d even whole numbers: ", n); /* display message */

    /* loop until counter reaches variable n */
    while (counter2 < n)    {
        printf("%d  ", 2 * counter2); /* display even whole number sequence */
        counter2++; /* increment counter2 */
    } /* end while */
    printf("\nThe first %d odd whole numbers: ", n); /* display message */

    /* loop until counter reaches variable n */
    while (counter3 <= n)    {
        printf("%d  ", 2 * counter3 - 1); /* display odd whole number sequence */
        counter3++; /* increment counte31 */
    } /* end while */
    printf("\nThe first %d whole numbers counting by %d: ", n, n - 1); /* display message */

    /* loop until counter reaches variable n */
    while (counter4 < n)    {
        printf("%d  ", counter4 * (n - 1)); /* display whole number sequence counting by n - 1 */
        counter4++; /* increment counter4 */
    } /* end while */
    printf("\nThe first %d perfect squares: ", n); /* display message */

    /* loop until counter reaches variable n */
    while (counter5 < n)    {
        printf("%d  ", counter5 * counter5); /* display whole number squares sequence */
        counter5++; /* increment counter5 */
    } /* end while */
    printf("\n"); /* proceed to next line for program end message */
}

//Q3: (Tipping Chart) (15 points): A very popular application on cell phones is a tip amount calculator. Write a program that takes as input the total amount of a restaurant bill. Then use a while loop to generate a chart of tip amounts for each percentage from 10% to 25%. Show the amount of the tip along with the total bill with the tip amount included.

#include <stdio.h>

/* function main begins program execution */
int main(void)  {
    int percent = 10; /* initialization of tip percent */
    float restCharge; /* restaurant charge value */
    printf("Enter the total restaurant charge: $"); /* prompt for input */
    scanf("%f", &restCharge); /* read restaurant charge from user */

    /* tipping chart heading */
    printf("------Tipping Chart-----\n");
    printf("Percent Tip     Total\n");

    /* loop while sentinel value not yet read from user */
    while (percent <= 25)   {
        float tip = ((float)percent / 100) * restCharge, total = restCharge + tip; /* calculate tip value from user-defined values */
        printf("%d%%     $%.2f    $%.2f\n", percent, tip, total); /* display tip value and total charge for each tip percentage */
        percent++; /* increment tip percentage */
    } /* end while */
} /* end function main */

//Q4: (A Better Simple Interest Loan Calculator) (20 points): The simple interest on a loan is calculated by the formula:
//interest = principal * rate * days / 365;
//The preceding formula assumes that rate is the annual interest rate, and therefore includes the division by 365 (days). Develop a program that will input principal, rate and days for several loans, and will calculate and display the simple interest for each loan, using the preceding formula. Use a sentinel value with a while loop to calculate the simple interest on as many loans as desired until the sentinel value is entered.

#include <stdio.h>
/* function main begins program execution */
int main(void)  {
    double principal; /* principal value */
    double rate; /* rate value */
    int term; /* term value */
    printf("Enter loan principal (-1 to end): $"); /* prompt for input */
    scanf("%lf", &principal); /* read principal from user */

    /* loop while sentinel value not yet read from user */
    while (principal > 0)    {
        printf("Enter annual interest rate: "); /* prompt for input */
        scanf("%lf", &rate); /* read rate from user */
        printf("Enter term of the loan in days: "); /* prompt for input */
        scanf("%d", &term); /* read term from user */
        double interest = principal * rate * (double) term / 365; /* calculate interest from user-defined values */
        printf("The interest charge is $%.2lf\n", interest); /* display interest with 2 digits of precision*/
        printf("Enter loan principal (-1 to end): $"); /* prompt for input */
        scanf("%lf", &principal); /* read principal from user */
    } /* end while */
} /* end function main */

//Q5: (Flowchart: Tax Return) (25 points) This flowchart allows a single person to determine if he or she needs to file an income tax return. Develop an application that ask user the questions in the flowchart and show the user an appropriate message.

#include <stdio.h>

/* function main begins program execution*/
int main(void)  {

    /* prompt user with income tax return menu */
    printf("Do You Have to File an Income Tax Return?\n");
    printf("--------------------------------------------------------------\n");
    printf("Note: Please answer the following questions carefully.\n");
    printf("If you made a mistake in answering the questions,\n");
    printf("please restart the program and start answering the questions.\n");
    printf("Use 1 to say \"Yes\" and 0 to say \"No\"\n");
    printf("--------------------------------------------------------------\n\n");
    printf("Please answer the following questions:\n");
    printf("Are you single? "); /* prompt for input */
    int response; /* yes/no answer to each question */
    scanf("%d", &response); /* read answer from user */

    if (response == 1)    { /* if user answered yes */
        printf("Are you under 65 years of age? "); /* prompt for input */
        scanf("%d", &response); /* read answer from user */

        if (response == 1)    { /* if user answered yes */
            printf("Is your gross income less than $8450? "); /* prompt for input */
            scanf("%d", &response); /* read answer from user */
            if (response == 1)    { /* if user answered yes */
                printf("--------------------------------------------------------------\n\n"); /* display separating line */
                printf("You do not have to file an income tax return\n"); /* display final result of application */
                return 0; /* exits program */
            } /* end if */
            else    {/* if user answered no */
                printf("--------------------------------------------------------------\n\n"); /* display separating line */
                printf("You have to file an income tax return\n"); /* display final result of application */
                return 0; /* exits program */
            } /* end else */
        } /* end if */
        else    {/* if user answered no */
            printf("Is your gross income less than $9700? "); /* prompt for input */
            scanf("%d", &response); /* read answer from user */
            if (response == 1)    {  /* if user answered yes */
                printf("--------------------------------------------------------------\n\n"); /* display separating line */
                printf("You do not have to file an income tax return\n"); /* display final result of application */
                return 0; /* exits program */
            } /* end if*/
            else    {/* if user answered no */
                printf("--------------------------------------------------------------\n\n"); /* display separating line */
                printf("You have to file an income tax return\n"); /* display final result of application */
                return 0; /* exits program */
            } /* end else */
        } /* end else */
    }
    else    {/* if user answered no */
        printf("You have to choose form F-ABC\n"); /* display final result of application */
    } /* end else */
} /* end function main */

//Q6: (GPA Calculator – Extra credit) (15 points): Figure 3.8 in the textbook provides code that allows a user to enter a list of grades in number format, and then it displays the letter grade for the number and calculates the average grade for the class. Modify this code so that it becomes a GPA calculator. You will find the nested if..else if code example in the textbook on page 78 that also uses numerical grades to be very useful. Merge the two code examples of the textbook, adding some prompts for the amount of semester hours per grade, and some variables to keep up with total GPA points earned and total semester hours taken.

#include <stdio.h>

/* function main begins program execution */
int main(void)  {
    int hours; /* credit hours value */
    float gradePoints; /* GPA points value */
    float GPA; /* GPA value */

    /* initialization phase */
    int grade = 0;
    float cumPoints = 0;
    int cumHours = 0;

    /* loop while sentinel value not yet read from user */
    while (grade != -1) {
        printf("Enter grade, -1 to end: "); /* prompt for input */
        scanf("%d", &grade); /* read grade from user */
        if (grade < 0)  { /* if grade is negative */
            break; /* exit while */
        } /* end if */
        printf("Enter semester hours for this course: "); /* prompt for input */
        scanf("%d", &hours); /* read hours from user */

        /* conditional statements for grade to letter grade conversion and grade to GPA points conversion */
        if (grade >= 93 && grade <= 100)    { /* if grade is in the range of 93 - 100 */
            printf("A\n"); /* display letter grade A */
            gradePoints = 4.00; /* award 4.00 GPA points */
        } /* end if */
        else if (grade >= 90 && grade < 93) { /* if grade is in the range of 90 - 92 */
            printf("A-\n"); /* display letter grade A- */
            gradePoints = 3.75; /* award 3.75 GPA points */
        } /* end else */
        else if (grade >= 86 && grade < 90) { /* if grade is in the range of 86 - 89 */
            printf("B+\n"); /* display letter grade B+ */
            gradePoints = 3.25; /* award 3.25 GPA points */
        } /* end else */
        else if (grade >= 83 && grade < 86) { /* if grade is in the range of 83 - 85 */
            printf("B\n"); /* display letter grade B */
            gradePoints = 3.00; /* award 3.00 GPA points */
        } /* end else */
        else if (grade >= 80 && grade < 83) { /* if grade is in the range of 80 - 82 */
            printf("B-\n"); /* display letter grade B- */
            gradePoints = 2.75; /* award 2.75 GPA points */
        } /* end else */
        else if (grade >= 76 && grade < 80) { /* if grade is in the range of 76 - 79 */
            printf("C+\n"); /* display letter grade C+ */
            gradePoints = 2.25; /* award 2.25 GPA points */
        } /* end else */
        else if (grade >= 73 && grade < 76) { /* if grade is in the range of 73 - 75 */
            printf("C\n"); /* display letter grade C */
            gradePoints = 2.00; /* award 2.00 GPA points */
        } /* end else */
        else if (grade >= 70 && grade < 73) { /* if grade is in the range of 70 - 72 */
            printf("C-\n"); /* display letter grade C- */
            gradePoints = 1.75; /* award 1.75 GPA points */
        } /* end else */
        else if (grade >= 66 && grade < 70) { /* if grade is in the range of 66 - 69 */
            printf("D+\n"); /* display letter grade D+ */
            gradePoints = 1.25; /* award 1.25 GPA points */
        } /* end else */
        else if (grade >= 63 && grade < 66) { /* if grade is in the range of 63 - 65 */
            printf("D\n"); /* display letter grade D */
            gradePoints = 1.00; /* award 1.00 GPA points */
        } /* end else */
        else if (grade >= 60 && grade < 63) { /* if grade is in the range of 60 - 62 */
            printf("D-\n"); /* display letter grade D- */
            gradePoints = 0.75; /* award 0.75 GPA points */
        } /* end else */

        else    { /* if grade is in the range of < 60 */
            printf("F\n"); /* display letter grade F */
            gradePoints = 0.00; /* award 0.00 GPA points */
        } /* end else */

        /* calculate GPA of each course */
        float totalGPAPoints = gradePoints * (float) hours;

        cumHours += hours; /* add credit hours to total */
        cumPoints += totalGPAPoints; /* add GPA points to total */
        printf("Cumulative Semester Hours: %d   Cumulative GPA Points: %.3f\n", cumHours, cumPoints); /* display cumulative semester hours and cumulative GPA points with 3 digits of precision */
    } /* end while */

    GPA = cumPoints / (float) cumHours; /* calculate GPA of all grades entered */
    printf("GPA is %.3f\n", GPA); /* display GPA with 3 digits of precision */
    return 0; /* indicate program ended successfully */
} /* end function main */
