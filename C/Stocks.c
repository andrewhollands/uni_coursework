//
//  Assignment\ 3\ Stocks.c
//  Assignment 3
//
//  Created by Andrew Richard Hollands on 2/16/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(int *a, int *b)   {
    int temp; //
    temp = *a; // Set temp value to a's position
    *a = *b; // Set a's position to b's position
    *b = temp; // Set b's position to temp value
    
}

void permutation(int * dataPoints, int start, int end) {
    if (start == end) // If the first value is equal to the last value, end
        return; // Exit permutation function
    for (int i = start; i <= end; i++)  {
        swap(dataPoints + i, dataPoints + start); // Call swap function
        permutation(dataPoints, start + 1, end); // Recursive step: call permutation function
        swap(dataPoints + i, dataPoints + start); // Call swap function
    }
}

int main(void)  {
    int numDataPoints; // Number of array members
    scanf("%d", &numDataPoints); // Read in number of array members
    int dataPoints[numDataPoints]; // Array members
    int differences[numDataPoints - 1]; // Differences between each array member
    int kCounter = 1; // Counter for distinct arrangements
    for (int i = 0; i < numDataPoints; i++) {
        scanf("%d", &dataPoints[i]); // Read in array members
    }
    for (int j = 0; j < numDataPoints - 1; j++) {
        scanf("%d", &differences[j]); // Read in desired array member differences
    }
    permutation(dataPoints, 0, numDataPoints - 1); // Call function permutation
    for (int k = 0; k <= sizeof(differences); k++)   {
        if (differences[k + 1] - differences[k] == differences[k])   { // If differences array member k + 1 minus differences array member k is equal to array member k
            kCounter++; // Increment kCounter by 1;
        }
    }
    printf("%d\n", kCounter); // Display kCounter value
}
