//
//  Assignment\ 1\ Friendship.c
//  Assignment 1
//
//  Created by Andrew Richard Hollands on 1/23/20.
//  Copyright © 2020 Andrew Hollands. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct FriendList FriendList;

struct FriendList
{
    char a[100];
    char b[100];
    char query[20];
};

int main()
{
    int i = 1, j = 1, numQuery;
    FriendList * friendArr;
    //Read in the number of queries
    scanf("%d", &numQuery);
    //Allocate memory for FriendList
    friendArr = (FriendList *) calloc(numQuery, sizeof(FriendList));
    for (i = 1; i <= 7; i++)
    {
        scanf("%s", friendArr[i].query);
        if(strcmp(friendArr[i].query, "LIST") == 0)
            scanf("%s", friendArr[i].a);
        else if(strcmp(friendArr[i].query, "ADD") == 0)
            scanf("%s %s", friendArr[i].a, friendArr[i].b);
        else if(strcmp(friendArr[i].query, "REMOVE") == 0)
            scanf("%s %s", friendArr[i].a, friendArr[i].b);
        else i++;
    }
    for (j = 1; j <= numQuery; j++)
    {
        if(strcmp(friendArr[i].query, "LIST"))
            printf("%s",friendArr[i].a);
        if(strcmp(friendArr[i].query, "ADD"))
            strcpy(friendArr[i+1].a,friendArr[i].a);
    }
    printf("%s", (void *)friendArr);

    return 0;
}
