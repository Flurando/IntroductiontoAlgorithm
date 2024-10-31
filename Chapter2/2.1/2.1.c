#include <stdio.h>
#include <stdlib.h>

int
main (int argc, char *argv[])
{
  int n = argc - 1;
  int A[argc-1];
  for (int index = 0; index <= argc - 2; index++)
    {
      A[index] = atoi (argv[index + 1]);
    }
  
  for (int index = 1; index <= n - 1; index++)
    {
      int key = A[index];
      int index2 = index - 1;
      while (index2 > 0 && A[index2] > key)
        {
          A[index2+1] = A[index2];
          index2--;
        }
      A[index2+1] = key;
    }
  
  for (int index = 0; index <= n - 1; index++)
    {
      printf ("%d ", A[index]);
    }
  printf ("\n");
  
  return 0;
}
