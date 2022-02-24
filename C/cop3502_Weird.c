//
//  Assignment\ 5\ Weird.c
//  Assignment 5
//
//  Created by Andrew Richard Hollands on 3/31/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Input Input;

struct Input    {
    char queue[5];
};

int main(void)  {
    int n = 100000;
    Input * inputArr;
    inputArr = (Input *) calloc(n, sizeof(Input));
    for (int i = 0; i < n; i++) {
        scanf("%s", inputArr[i].queue);
        if(strcmp(inputArr[i].queue, "EXIT") == 0)  {
            break;
        }
        else if(strcmp(inputArr[i].queue, "TYPE") == 0)  {
            scanf("%c", inputArr[i].queue);
        }
        else if(strcmp(inputArr[i].queue, "FLIP") == 0)  {
            ;
        }
        else if(strcmp(inputArr[i].queue, "SPACE") == 0)  {
            printf(" ");
        }
        else if(strcmp(inputArr[i].queue, "BACK") == 0)  {
            
        }
    }
    free(inputArr);
    return 0;
}
