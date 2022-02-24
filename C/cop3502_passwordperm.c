#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PHRASE "adeflr"

#define FALSE 0
#define TRUE 1

void rec(int * used, char * orig, char * perm, 
   int num, int len);
   
int count = 0;

int main()
{
   // Store the length of the phrase
   int len = strlen(PHRASE);
   
   // The arrays that will be used
   int * used;
   char * original;
   char * perm;
   
   // Allocate the memory
   used = calloc(len, sizeof(int));
   original = calloc(len, sizeof(char));
   perm = calloc(len, sizeof(char));
   
   // Loop and initialize the memory
   for (int i = 0; i < len; i++) {
      used[i] = FALSE;
      original[i] = PHRASE[i];
      perm[i] = '\0';
   }
   
   // Recursively call the function
   rec(used, original, perm, 0, len);
   
   // Free all the allocated memory
   free(used);
   free(original);
   free(perm);
   
   // Return a zero
   return 0;
}

void rec(int * used, char * orig, char * perm, 
   int num, int len)
{
   // Base Case
   // The number of characters is at the length
   if (num == len)
   {
      // Print the number of phrases seen
      printf("%d. ", ++count);
      
      // Print the actual permuation out
      for (int i = 0; i < len; i++)
      {
         printf("%c", perm[i]);
      }
      
      // Separate with new lines
      printf("\n");
      return;
   }
   
   // Recursive step
   // try all possible letters
   for (int i = 0; i < len; i++)
   {
      // Check if the value was used
      if (!used[i])
      {
         // Make the decision
         used[i] = TRUE;
         perm[num] = orig[i];
         
         // Recurse
         rec(used, orig, perm, num + 1, len);
         
         // Unmake the decision
         used[i] = FALSE;
         perm[num] = '\0';
      }
   }
}
