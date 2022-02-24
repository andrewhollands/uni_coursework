//
//  Assignment\ 4\ Sweeping.c
//  Assignment 4
//
//  Created by Andrew Richard Hollands on 3/19/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct Cities Cities;

struct Cities   {
    char city[100]; //City name
    int a[500000], b[500000]; //x and y coordinates
};

int main(void) {
    Cities * cityArr; //Pointer to struct Cities
    int n; //Number of cities
    int i, j; //ints for for loops
    //int k; //Commented out int for k-for-loop
    //int dp[500000]; //Commented out for dot product (k-for-loop)
    int dx, dy; //Change in x and y
    scanf("%d", &n); //Assigning values to number of cities
    cityArr = (Cities *) calloc(n, sizeof(Cities)); //Allocating memory for Cities struct
    for (i = 0; i < n; i++) { //For loop for gathering x- and y- values and city names
        scanf("%d", cityArr[i].a); //Assigning value to i-th a value (x-coordinate)
        scanf("%d", cityArr[i].b); //Assigning value to i-th b value (y-coordinate)
        scanf("%s", cityArr[i].city); //Assigning name to i-th city
    }
    scanf("%d", &dx); //Assigning value to dx
    scanf("%d", &dy); //Assigning value to dy
    for (j = 0; j < n; j++) { //For loop for displaying cities
        printf("%s\n", cityArr[j].city); //Displaying city names (unsorted =c )
    }
//    for (k = 0; k < n; k++) {
//        dp[k] = *cityArr[i].a * dx + *cityArr[i].b * dy;
//    }
}
