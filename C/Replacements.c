//
//  Assignment\ 0\ Replacements .c
//  Assignment 0
//
//  Created by Andrew Richard Hollands on 1/9/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//

#include <stdio.h>
#include <string.h>

// The maximum length of our string
#define MAX   1000

// Some values that represent true and false
#define FALSE (0==1)
#define TRUE  (!FALSE)

// A value to represent if a value is not present
#define DNE   -1

// Function prototype
int getLoc(char * haystack, char * needle);
int beginsWith(char * phrase, char * beginning);

int main()
{
    int i, t;
    scanf("%d", &t);
    
    // Restricting number of cases to 1 at the lower bound and ending program once
    // user-specified number of cases has been reached.
    for(i = 1; i <= t; i++)
    {
    
    //Restricting number of cases to 10 at the upper bound
    if(t > 10)
        return 0;
    else
    {
    
    // Create the phrase, delete, and replace string.
    // The size could be upto MAX, but the +1 is necessary for
    // the null terminator ('\0') character used when working
    // with strings in C.
    char phrase[MAX + 1];
    char del[MAX + 1];
    char rep[MAX + 1];
    
    // Read in each string.
    // The %s format reads in the string until the first
    // whitespace character (e.g. space, tab, newline, etc.).
    scanf("%s", phrase);
    scanf("%s", del);
    scanf("%s", rep);
    
    // Find the location we need to replace
    int location = getLoc(phrase, del);
    
    // Check if we need to modify the phrase
    if (location != DNE)
    {
        // Make a new phrase that will store the result of
        // the replacement
        char newPhrase[MAX + 1];
        
        // Make a string that will store the first part
        // of the phrase (before the del string)
        char first[MAX + 1];
        
        // Make a string that will store the last part
        // of the phrase (after the del string)
        char last[MAX + 1];
        
        // Create the first string.
        strcpy(first, phrase);
        first[location] = '\0';
        
        // Create the last string.
        strcpy(last, &phrase[location + strlen(del)]);
        
        // Build the new phrase from the first, replacement,
        // and last string.
        // phrase was  |  first  | del |  last  |
        // newPhrase = |  first  | rep |  last  |
        
        // newPhrase = first;
        strcpy(newPhrase, first);
        
        // newPhrase += rep;
        strcat(newPhrase, rep);
        
        // newPhrase += last;
        strcat(newPhrase, last);
        
        // Print the resulting string
        printf("\n%s\n", newPhrase);
    }
    else
    {
        // The phrase does not need a replacement.
        // Print the original phrase.
        printf("\n%s\n", phrase);
    }
    }
    }
    // Return 0 to signify the program exited succesfully
    return 0;
}

// TODO: Fix this code in class
// Gets the location as an int of the needle in the haystack.
// Note this is slow, but fast enough for CS I.
// If you are interested in making this faster, I recommend
// looking into an algorthim called KMP. There will be NO
// bonus points for using KMP; it's just for your own
// practice/fun.

int getLoc(char * haystack, char * needle)
{
    int ans = 0;
    int done = FALSE;
    
    // Loop until the needle location is found
    while (!done)
    {
        // The FIX
        if (haystack[ans] == '\0')
        {
            break;
        }
        // Check if the haystack offset by our answer
        // begins with our needle.
        if (beginsWith(&haystack[ans], needle))
        {
            return ans;
        }
        
        // Move the potential answer to the next position,
        // since the current one did not work.
        ans++;
    }
    // Return that the answer was never found
    return DNE;
}


// Function to check if some phrase begins with some given
// beginning
int beginsWith(char * phrase, char * beginning)
{
    // Store the position of where the first difference occurs
    int curPos = 0;
    
    // Look for the first position the strings differ.
    while (beginning[curPos] == phrase[curPos])
    {
        // Stop if the beginning is at the end of the string
        if (beginning[curPos] == '\0')
        {
            return TRUE;
        }
        
        // Increment the positoin.
        curPos++;
    }
        
    // Check if the current position was at the end of the
    // beginning.
    // Note: the below code could be replaced with the following,
    // "return (beginning[curPos] == '\0');"
    if (beginning[curPos] == '\0')
    {
        return TRUE;
    }
    
    // We could not reach the end of the beginning string, so
    // return that the phrase does not begin with the beginning.
    return FALSE;
}
