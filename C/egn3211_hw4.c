//  HW4
//
//  Created by Andrew Richard Hollands on 2/9/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//  All questions are the property of the University of Central Florida.
//

//Q1 (Pythagorean Triples): Pythagorean triples are three positive integer numbers a, b, c that form the sides of a right triangle, such that a2 + b2 = c2. Use a brute-force method using triple nested for loops to generate all Pythagorean triples where sides a, b, and c are less than or equal to 500. Do not worry about duplicate sets of {a, b, c} such as {3, 4, 5} and {5, 4, 3}. Brute force techniques are not the most elegant solutions but can be used to solve interesting problems for which there is no known algorithm to solve the problem.

#include <stdio.h>

int main()  { // Function main begins program execution
    int h, b, p, c = 0; // Initialization and declaration phase

    for (h = 1; h < 501; h++)  { // Loop until hypotenuse reaches 501
        for (b = 1; b < 501; b++)  { // Loop until leg reaches 501
            for (p = 1; p <= 500; p++)   { // Loop until leg reaches 500
                if (h * h == (b * b + p * p))  { // Check if hypotenuse square is equal to sum of leg squares
                    c++; // Increment set number
                    printf("Set %d - Pythagorean Triple: {%d, %d, %d}\n", c, h, b, p); // Print Pythagorean triple
                } // End if
            } // End for
        } // End for
    } // End for
    return 0; // Exit program
} // Exit function main

//Q2: (Weekly Pay Calculator) (20 points) Develop a program that calculates weekly pay for group of hourly workers. Design appropriate prompts and outputs of your own design. The program should prompt for the number of hours worked in the week and the hourly rate. Generate the gross weekly pay and print it. Hours over 40 should be paid at time and a half hourly rate. Use a sentinel value to terminate data entry.

#include <stdio.h>

int main(void)  { // Function main begins program execution
    // Initialization and decalaration phase
    int employeeID = 1, payPeriod;
    float hours, overtimeHours, hourlyRate;

    while (employeeID >= 1)    { // Loop until user enters value less than 1 for employeeID
        printf("Pay stub for employee ID, from 1 to end (enter integer less than 1 to end): "); // Prompt for input
        scanf("%d", &employeeID); // Read input
        printf("Pay period from Sunday, in MMDDYYYY format with no slashes, to the following Saturday: "); // Prompt for input
        scanf("%d", &payPeriod); // Read input
        printf("Hours worked: "); // Prompt for input
        scanf("%f", &hours); // Read input
        printf("Hourly pay rate: $"); // Prompt for input
        scanf("%f", &hourlyRate); // Read input
        if (hours > 40) { // Overtime case
            overtimeHours = hours - 40; // Initializing overtime hours
            printf("Gross pay for the week of %d is $%.2f\n", payPeriod, overtimeHours * hourlyRate * 1.5 + 40 * hourlyRate); // Print gross pay if worked overtime
        } // End if
        else    { // Regular time case
            printf("Gross pay for the week of %d is $%.2f\n\n", payPeriod, hours * hourlyRate); // Print gross pay if worked only normal time
        } // End else
    } // End while
    return 0; // Exit program
} // Exit function main

//Q3: (Bar Charts) (20 Points) Write a program that reads in a series of integers in the range of 1 to 40, with the first number indicating how many integers follow it. Print out a bar chart of the numbers entered.

#include <stdio.h>

int main(void)  { // Function main begins program execution
    int n, m; // Declaring integers n and m
    printf("Enter a series of integers between 1 and 40 with the first integer indicating how many integers are to be entered: "); // Prompt for input
    scanf("%d", &n); // Read input for n
    for (int i = 0; i < n; i++)    { // Loop until integer i reaches user-defined value n
        scanf("%d", &m); // Read input for m
        for (int j = 0; j < m; j++)    { // Loop until integer j reaches user-defined value m
            printf("*"); // Print out bars (bar chat components)
        } // End for
        printf("  (%d)\n", m); // Print number of bar chart components in parentheses
    } // End for
    return 0; // Exit program
} // Exit function main

//Q4: (Approximating π) (20 points) The value of π can be approximated with the infinite series as follows: Write a program that determines how many terms in takes using the above infinite series to approximate π to 3.14159. You can state the answer to this question in the word document you submit, if you obtain the answer through trial and error.

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void)  { // Function main begins program execution
    // Initialization and decalaration phase
    double piApproximation = 0;
    int odd;

//  scanf("%d", &terms); // Commented out as was only used for trial and error
    for (int i = 0; i <= 130657; i++)   { // Changed to i <= 130657 from i <= terms after the first instance of 3.14159 was found in the output window using trial and error of user-defined term count
        odd = 2 * i + 1; // Initializing odd integer sequence
        piApproximation += pow(-1, i + 2) * (4 / (double) odd); // Initializing approximation of pi by summing alternating positive/negative terms of 4 / (odd sequence)
        printf("%d %.5lf\n", i, piApproximation); // Output term number beside its current summation of the pi approximating series
    } // End for
    return 0; // Exit program
} // Exit function main
// Output:
// First occurence of 3.14159:              terms     piApproximation
// Copied and pasted from output window:    130657    3.14159

// Q5: (World Population Growth) (20 points) World population has grown considerably over the centuries. Continued growth could eventually challenge the limits of breathable air, drinkable water, arable cropland and other limited resources. There is evidence that growth has been slowing in recent years and that world population could peak sometime this century, then start to decline. For this exercise, research world population growth issues online. Be sure to investigate various viewpoints. Get estimates for the current world population and its growth rate (the percentage by which it’s likely to increase this year). Write a program that calculates world population growth each year for the next 75 years, using the simplifying assumption that the current growth rate will stay constant. Print the results in a table. The first column should display the year from year 1 to year 75. The second column should display the anticipated world population at the end of that year. The third column should display the numerical increase in the world population that would occur that year. Using your results, determine the year in which the population would be double what itis today, if this year’s growth rate were to persist.

#include <stdio.h>

int main(void)  { // Function main begins program execution
    // Initialization and decalaration phase
    int yearNumber = 1, actualYear = 2020;
    float growth = .0105; // Growth rate is 1.05% per year
    long long worldPopulation = 7747924010;
    long long difference;

    // Display table header
    printf("** Not an accurate representation of the real world as population growth is static** \n\n");
    printf("*-----------------------------------------------------------------------------------*\n");
    printf("|        World Population Growth by the Year, from year 1 (2020) to 75 (2094)       |\n");
    printf("|-----------------------------------------------------------------------------------|\n");
    printf("| Year number | Actual Year | Anticipated Year-end Population | Population Increase |\n");
    printf("|-------------|-------------|---------------------------------|---------------------|\n");

    // Each while loop is the same in function but there are multiple loops to account for proper table formatting
    while (yearNumber <= 9)    {
        worldPopulation += worldPopulation * growth;
        difference = worldPopulation * (1 + growth) - worldPopulation;
        printf("| %d           | %d        | %lld                      | %lld            |\n", yearNumber, actualYear, worldPopulation, difference);
        yearNumber++;
        actualYear++;
    }
    while (yearNumber <= 19)    {
        worldPopulation += worldPopulation * growth;
        difference = worldPopulation * (1 + growth) - worldPopulation;
        printf("| %d          | %d        | %lld                      | %lld            |\n", yearNumber, actualYear, worldPopulation, difference);
        yearNumber++;
        actualYear++;
    }
    while (yearNumber <= 24)    {
        worldPopulation += worldPopulation * growth;
        difference = worldPopulation * (1 + growth) - worldPopulation;
        printf("| %d          | %d        | %lld                      | %lld           |\n", yearNumber, actualYear, worldPopulation, difference);
        yearNumber++;
        actualYear++;
    }
    while (yearNumber <= 75)    { // Loop until year reaches year 75
        worldPopulation += worldPopulation * growth; // Sum world population with multiplied growth rate
        difference = worldPopulation * (1 + growth) - worldPopulation; // Find population change from year to year
        printf("| %d          | %d        | %lld                     | %lld           |\n", yearNumber, actualYear, worldPopulation, difference); // Print year number, year, population, and population change
        yearNumber++; // Inrecement year number
        actualYear++; // Increment year
    }
    printf("*-----------------------------------------------------------------------------------*\n"); // Close table at bottom
    return 0; // Exit program
} // Exit function main
