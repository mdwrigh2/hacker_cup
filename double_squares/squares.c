#include <stdio.h>
#include <math.h>
int main(int argc, const char *argv[])
{
  FILE *fp = fopen(argv[1], "r");
  int n;
  fscanf(fp, "%d", &n);
  for(int i = 0; i < n; i++){
    int j;
    int squares = 0;
    fscanf(fp, "%d", &j);
    int top = sqrt(j);
    for(int m = 0; m <= top; m++){
      for(int n = 0; n <= m; n++){
        if(((m*m)+(n*n))==j){
          //printf("%d**2 + %d**2\n", m, n);
          squares++;
        }
      }
    }
    printf("%d\n", squares);
  }

  return 0;
}
