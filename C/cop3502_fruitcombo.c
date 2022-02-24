#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STORE_SIZE 7
#define BASKET_SIZE 3
#define MAX 100

// The basket containing the fuit
char ** basket;

// The fruit we can buy
char * store[STORE_SIZE] = {
   "apples",
   "grapes",
   "oranges",
   "grapefruit",
   "kiwi",
   "tomatoes",
   "bananas"
};

// The number of valid baskets
int count = 0;

// The recursive prototype
void combo(int fruitTaken, int lastChoice);


// The main function
int main()
{
   basket = calloc(BASKET_SIZE, sizeof(char*));
   for (int i = 0; i < BASKET_SIZE; i++)
      basket[i] = calloc(MAX + 1, sizeof(char));
   combo(0, -1);
}

// Our recursive function fo selecting fruit
void combo(int fruitTaken, int lastChoice)
{
   // Base case: Basket full
   if (fruitTaken == BASKET_SIZE)
   {
      // Print basket index
      printf("%d.", ++count);
      
      // Print all the fruit
      for (int i = 0; i < BASKET_SIZE; i++)
      {
         printf(" %s", basket[i]);
      }
      printf("\n");
      
      // Don't try to add more fruit
      return;
   }
   
   // Loop starting without select the last choice
   for (int choice = lastChoice + 1; choice < 
      STORE_SIZE; choice++)
   {
      // Add the fruit to the basket
      strcpy(basket[fruitTaken], store[choice]);
      
      // Run combinations
      combo(fruitTaken + 1, choice);
   }
}
